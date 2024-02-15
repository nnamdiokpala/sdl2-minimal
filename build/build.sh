# Set the paths to the SDL2 libraries and includes
SDL_LIB_PATH="C:/Dev/SDL2/x86_64-w64-mingw32/lib"
SDL_INCLUDE_PATH="C:/Dev/SDL2/x86_64-w64-mingw32/include;./include"

# Compile all *.c files in src directory
for file in src/*.c; do
    mkdir -p bin
    gcc -o bin/$(basename "$file" .c).out "$file" -I"$SDL_INCLUDE_PATH" -L"$SDL_LIB_PATH" -lmingw32 -lSDL2main -lSDL2 
done

# Check if the compilation was successful
if [ $? -eq 0 ]; then
    echo "Build successful!"
else
    echo "Build failed!"
fi
