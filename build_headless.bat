@echo off
rem build_headless.bat
rem Wrapper for STM32CubeIDE Headless Build in Docker

echo Starting Headless Build...

docker run --rm -v "%cd%":/workspace paniti/stm32-builder:v1.0 ^
/opt/st/stm32cubeide_2.0.0/headless-build.sh -data /tmp/workspace -import /workspace -build all

if %ERRORLEVEL% NEQ 0 (
    echo Build failed with error level %ERRORLEVEL%
    exit /b %ERRORLEVEL%
)


echo Generating Binaries...
docker run --rm -v "%cd%":/workspace paniti/stm32-builder:v1.0 sh /workspace/post_build.sh

echo Build Complete.
