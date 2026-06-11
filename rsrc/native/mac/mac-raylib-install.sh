#!/usr/bin/env sh

set -e

test -d /usr/local/lib || mkdir /usr/local/lib

test -d raylib || git clone --depth 1 --branch 6.0 --recursive https://github.com/raysan5/raylib 
cd raylib

test -d build || mkdir build
cd build
cmake .. -DCMAKE_POLICY_VERSION_MINIMUM=3.5
make -Bj4 SHAREDLIBS="-lglfw -framework OpenGL -framework OpenAL -framework Cocoa" SHARED_RAYLIB=YES PLATFORM=PLATFORM_DESKTOP

sudo cp ./raylib/libraylib.a /usr/local/lib/libraylib.a
cd ..
sudo rm -r ./build

test -d build || mkdir build
cd build
cmake .. -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DBUILD_SHARED_LIBS=ON
make -Bj4 SHAREDLIBS="-lglfw -framework OpenGL -framework OpenAL -framework Cocoa" SHARED_RAYLIB=YES PLATFORM=PLATFORM_DESKTOP
sudo cp ./raylib/libraylib.6.0.0.dylib /usr/local/lib/libraylib.6.0.0.dylib
sudo cp ./raylib/libraylib.600.dylib /usr/local/lib/libraylib.600.dylib
sudo cp ./raylib/libraylib.dylib /usr/local/lib/libraylib.dylib

cd ../../
sudo rm -r raylib
