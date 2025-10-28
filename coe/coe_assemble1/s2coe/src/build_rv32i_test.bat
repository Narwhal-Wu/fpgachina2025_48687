@echo off
REM Build script for rv32i_test.s
REM Generates ELF, BIN, MEM, and COE files

echo ========================================
echo Building RV32I Comprehensive Test
echo ========================================

REM ============================================
REM Configure RISC-V Toolchain Path
REM ============================================
set "RISCV_TOOLCHAIN=D:\gnu-mcu-eclipse-riscv-none-gcc\RISC-V Embedded GCC\bin"
set "RISCV_PREFIX=riscv-none-embed-"

REM Verify toolchain exists
if not exist "%RISCV_TOOLCHAIN%\%RISCV_PREFIX%as.exe" (
    echo ERROR: RISC-V toolchain not found at: %RISCV_TOOLCHAIN%
    echo Please check the path and try again.
    pause
    exit /b 1
)

echo Found RISC-V toolchain at: %RISCV_TOOLCHAIN%
set "PATH=%RISCV_TOOLCHAIN%;%PATH%"

echo.

REM Set file names
set SOURCE=rv32i_test.s
set OBJECT=rv32i_test.o
set ELF=rv32i_test.elf
set BIN=rv32i_test.bin
set MEM=rv32i_test.mem
set COE=rv32i_test.coe

REM Create output directory
if not exist "test_output" mkdir test_output

echo.
echo [1/5] Assembling %SOURCE%...
%RISCV_PREFIX%as -march=rv32i -mabi=ilp32 -o test_output\%OBJECT% %SOURCE%
if errorlevel 1 (
    echo ERROR: Assembly failed!
    pause
    exit /b 1
)
echo Assembly successful!

echo.
echo [2/5] Linking %OBJECT%...
%RISCV_PREFIX%ld -T linker.ld -o test_output\%ELF% test_output\%OBJECT%
if errorlevel 1 (
    echo ERROR: Linking failed!
    pause
    exit /b 1
)
echo Linking successful!

echo.
echo [3/5] Generating binary file...
%RISCV_PREFIX%objcopy -O binary test_output\%ELF% test_output\%BIN%
if errorlevel 1 (
    echo ERROR: Binary generation failed!
    pause
    exit /b 1
)
echo Binary generated!

echo.
echo [4/5] Converting to MEM format...
tool\bin2mem.exe test_output\%BIN% test_output\%MEM%
if errorlevel 1 (
    echo ERROR: MEM conversion failed!
    pause
    exit /b 1
)
echo MEM file generated!

echo.
echo [5/5] Converting to COE format...
tool\coemem.exe test_output\%MEM% test_output\%COE%
if errorlevel 1 (
    echo ERROR: COE conversion failed!
    pause
    exit /b 1
)
echo COE file generated!

echo.
echo ========================================
echo Build completed successfully!
echo ========================================
echo.
echo Output files in test_output\ directory:
echo   - %OBJECT% (object file)
echo   - %ELF% (executable)
echo   - %BIN% (binary)
echo   - %MEM% (memory format)
echo   - %COE% (COE format for Xilinx)
echo.
echo Disassembly to check instructions:
%RISCV_PREFIX%objdump -d test_output\%ELF% > test_output\rv32i_test.asm
echo   - rv32i_test.asm (disassembly)
echo.

echo Expected result when all tests pass: 34 (0x22)
echo This value will be stored at address 0xFFFFFFFC for LED output
echo.

pause
