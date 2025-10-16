# Makefile for RV32I Test Compilation
# Requires RISC-V toolchain (riscv32-unknown-elf-gcc)

# Directories
ASM_DIR = asm
OUTPUT_DIR = output
TOOLS_DIR = tools

# Tool
ASM2COE = $(TOOLS_DIR)/asm2coe.py

# Assembly files
ASM_FILES = $(wildcard $(ASM_DIR)/*.s)
COE_FILES = $(patsubst $(ASM_DIR)/%.s,$(OUTPUT_DIR)/%.coe,$(ASM_FILES))

# Default target
.PHONY: all
all: $(COE_FILES)
	@echo "All test files compiled successfully!"
	@echo "COE files are in $(OUTPUT_DIR)/"

# Create output directory
$(OUTPUT_DIR):
	mkdir -p $(OUTPUT_DIR)

# Compile individual assembly files
$(OUTPUT_DIR)/%.coe: $(ASM_DIR)/%.s | $(OUTPUT_DIR)
	@echo "Compiling $<..."
	$(ASM2COE) $< -o $(OUTPUT_DIR)

# Specific targets
.PHONY: comprehensive
comprehensive: $(OUTPUT_DIR)/test_rv32i_comprehensive.coe
	@echo "Comprehensive test compiled: $<"

.PHONY: basic
basic: $(OUTPUT_DIR)/test_basic.coe
	@echo "Basic test compiled: $<"

.PHONY: arithmetic
arithmetic: $(OUTPUT_DIR)/test_arithmetic.coe
	@echo "Arithmetic test compiled: $<"

.PHONY: logic
logic: $(OUTPUT_DIR)/test_logic.coe
	@echo "Logic test compiled: $<"

.PHONY: shift
shift: $(OUTPUT_DIR)/test_shift.coe
	@echo "Shift test compiled: $<"

.PHONY: branch
branch: $(OUTPUT_DIR)/test_branch.coe
	@echo "Branch test compiled: $<"

.PHONY: memory
memory: $(OUTPUT_DIR)/test_memory.coe
	@echo "Memory test compiled: $<"

.PHONY: jump
jump: $(OUTPUT_DIR)/test_jump.coe
	@echo "Jump test compiled: $<"

# Clean
.PHONY: clean
clean:
	rm -rf $(OUTPUT_DIR)
	@echo "Cleaned output directory"

# Help
.PHONY: help
help:
	@echo "RV32I Test Compilation Makefile"
	@echo ""
	@echo "Usage:"
	@echo "  make              - Compile all test files"
	@echo "  make comprehensive - Compile comprehensive test"
	@echo "  make basic        - Compile basic test"
	@echo "  make arithmetic   - Compile arithmetic test"
	@echo "  make logic        - Compile logic test"
	@echo "  make shift        - Compile shift test"
	@echo "  make branch       - Compile branch test"
	@echo "  make memory       - Compile memory test"
	@echo "  make jump         - Compile jump test"
	@echo "  make clean        - Clean output directory"
	@echo "  make help         - Show this help message"
	@echo ""
	@echo "Requirements:"
	@echo "  - RISC-V toolchain (riscv32-unknown-elf-gcc)"
	@echo "  - Python 3"
