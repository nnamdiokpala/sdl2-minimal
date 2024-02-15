
# Set the paths to the SDL2 libraries and includes
$SDL_LIB_PATH = "C:/Dev/SDL2/x86_64-w64-mingw32/lib"
$SDL_INCLUDE_PATH = "C:/Dev/SDL2/x86_64-w64-mingw32/include;./include"

# Compile all *.c files in src directory
Get-ChildItem src\*.c | ForEach-Object {
    Make-Directory -Path bin -ErrorAction SilentlyContinue -Force
    Write-Host "Compiling $($_.FullName)..."
    $outputFile = "bin\$($_.BaseName).exe"
    gcc -o $outputFile $_.FullName -I $SDL_INCLUDE_PATH -L $SDL_LIB_PATH -lmingw32 -lSDL2main -lSDL2 -lSDL2_image
}

# Check if the compilation was successful
if ($LASTEXITCODE -eq 0) {
    Write-Host "Build successful!"
} else {
    Write-Host "Build failed!"
}
