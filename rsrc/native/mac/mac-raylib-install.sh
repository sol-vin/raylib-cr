#!/usr/bin/env sh

set -e

test -d /usr/local/lib || mkdir /usr/local/lib

# Raylib
test -d raylib || git clone --depth 1 --branch 6.0 --recursive https://github.com/raysan5/raylib 
cd raylib

# Build static library
test -d build || mkdir build
cd build
cmake .. -DCMAKE_POLICY_VERSION_MINIMUM=3.5
make -Bj4 SHAREDLIBS="-lglfw -framework OpenGL -framework OpenAL -framework Cocoa" SHARED_RAYLIB=YES PLATFORM=PLATFORM_DESKTOP

sudo cp ./raylib/libraylib.a /usr/local/lib/libraylib.a
cd ..
sudo rm -r ./build

# Build shared library
test -d build || mkdir build
cd build
cmake .. -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DBUILD_SHARED_LIBS=ON
make -Bj4 SHAREDLIBS="-lglfw -framework OpenGL -framework OpenAL -framework Cocoa" SHARED_RAYLIB=YES PLATFORM=PLATFORM_DESKTOP
sudo cp ./raylib/libraylib.6.0.0.dylib /usr/local/lib/libraylib.6.0.0.dylib
sudo cp ./raylib/libraylib.600.dylib /usr/local/lib/libraylib.600.dylib
sudo cp ./raylib/libraylib.dylib /usr/local/lib/libraylib.dylib

cd ../../

# Raygui
test -d raygui || git clone --depth 1 --recursive https://github.com/raysan5/raygui
cd raygui
cp src/raygui.h src/raygui.c
export PKG_CONFIG_PATH="../raylib/build/raylib"

# Build static library
gcc -c -o raygui.o src/raygui.c -I../raylib/build/raylib/include -DRAYGUI_IMPLEMENTATION $(pkg-config --cflags raylib)
ar rcs libraygui.a raygui.o
sudo cp ./libraygui.a /usr/local/lib/libraygui.a

# Build shared library
gcc -o raygui.dylib src/raygui.c -I../raylib/build/raylib/include -shared -fpic -DRAYGUI_IMPLEMENTATION -framework OpenGL -lm -lpthread -ldl $(pkg-config --libs --cflags raylib)
sudo cp ./raygui.dylib /usr/local/lib/raygui.dylib

# Cleanup
cd ../
sudo rm -r raylib
sudo rm -r raygui