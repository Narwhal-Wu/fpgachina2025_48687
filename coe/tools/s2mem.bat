@echo off
setlocal EnableDelayedExpansion

REM Set the source directory to 'src'
set "src_dir=src"
set "tool_dir=%src_dir%\tool"

REM Check if src directory exists
if not exist "%src_dir%" (
    echo Error: 'src' directory not found
    pause
    exit /b 1
)

REM Search for .s and .ld files in src directory
echo Searching for .s and .ld files in %src_dir%...
set "s_file="
for %%f in ("%src_dir%\*.s") do (
    if defined s_file (
        echo Error: Multiple .s files found in %src_dir%, please ensure only one .s file exists
        pause
        exit /b 1
    )
    set "s_file=%%f"
)
if not defined s_file (
    echo Error: No .s file found in %src_dir%
    pause
    exit /b 1
)

set "ld_file=%src_dir%\linker.ld"
if not exist "!ld_file!" (
    echo Error: linker.ld not found in %src_dir%
    pause
    exit /b 1
)

REM Get the base name from the .s file
for %%F in ("!s_file!") do (
    set "base_name=%%~nF"
    set "src_path=%%~dpF"
)

REM Create output directory with the name of the .s file
set "output_dir=%src_dir%\!base_name!"
if not exist "!output_dir!" (
    mkdir "!output_dir!"
)

echo Assembling !s_file! ...
riscv-none-embed-as.exe -c "!s_file!" -o "!output_dir!\!base_name!.o" --march=rv32i --mabi=ilp32
if errorlevel 1 (
    echo Error: Assembly failed. Please check the error messages above for details.
    pause
    exit /b 1
)

echo Linking...
riscv-none-embed-ld -m elf32lriscv -e _start -T "!ld_file!" -nostdlib -nostartfiles "!output_dir!\!base_name!.o" -o "!output_dir!\!base_name!.elf"
if errorlevel 1 (
    echo Error: Linking failed. Please check the error messages above for details.
    pause
    exit /b 1
)

echo Generating .bin file...
riscv-none-embed-objcopy -O binary "!output_dir!\!base_name!.elf" "!output_dir!\!base_name!.bin"
if errorlevel 1 (
    echo Error: Generating .bin file failed. Please check the error messages above for details.
    pause
    exit /b 1
)

echo Generating .mem file...
"!tool_dir!\bin2mem.exe" "!output_dir!\!base_name!.bin"
if errorlevel 1 (
    echo Error: Generating .mem file failed. Please check the error messages above for details.
    pause
    exit /b 1
)

echo Done! Generated files in !output_dir!:
echo   !base_name!.o
echo   !base_name!.elf
echo   !base_name!.bin
echo   !base_name!.mem
pause