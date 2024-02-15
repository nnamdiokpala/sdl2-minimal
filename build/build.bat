@echo off
@REM  Set the paths to the SDL2 libraries and includes
set SDL_LIB_PATH="C:/Dev/SDL2/x86_64-w64-mingw32/lib"
set SDL_INCLUDE_PATH="C:/Dev/SDL2/x86_64-w64-mingw32/include;./include"

@REM Compile all *.c files in src directory
for %%i in (src\*.c) do (
    mkdir bin
    gcc  %%i -I%SDL_INCLUDE_PATH% -L%SDL_LIB_PATH%  -o bin\%%~ni.exe -lmingw32 -lSDL2main -lSDL2 -lSDL2_image
    )

REM Check if the compilation was successful
if %errorlevel% equ 0 (
    echo Build successful!
) else (
    echo Build failed!
)