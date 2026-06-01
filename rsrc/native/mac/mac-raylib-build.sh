#!/usr/bin/env sh

set -e

test -d raylib || git clone --depth 1 --branch 5.0 --recursive https://github.com/raysan5/raylib 
cd raylib
test -d build || mkdir build
cd build
cmake .. -DCMAKE_POLICY_VERSION_MINIMUM=3.5
make -Bj4 SHAREDLIBS="-lglfw -framework OpenGL -framework OpenAL -framework Cocoa" SHARED_RAYLIB=YES PLATFORM=PLATFORM_DESKTOP
