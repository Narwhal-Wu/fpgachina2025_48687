# test.s
# A simple assembly program to test IROM reading and DRAM read/write.

.section .text
.global _start

_start:
    # Load an immediate value into register t0.
    # This instruction is read from IROM.
    li t0, 0xABCD1234

    # Store the value from t0 into DRAM at address 0x40.
    # We use t1 to hold the address.
    # This tests the DRAM write functionality.
    li t1, 0x40
    sw t0, 0(t1)

    # Load the value from DRAM at address 0x40 back into register t2.
    # This tests the DRAM read functionality.
    # After this, t2 should contain 0xABCD1234.
    lw t2, 0(t1)

    # Store the value from t2 into DRAM at a different address, 0x80.
    # This further verifies that the read was successful and write works.
    li t1, 0x80
    sw t2, 0(t1)

# Infinite loop to halt the processor.
# The processor will keep fetching and executing this 'j loop' instruction.
loop:
    j loop

