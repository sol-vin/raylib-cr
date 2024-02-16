# Compile miniaudio helpers
gcc -c -fPIC rsrc/miniaudiohelpers/miniaudiohelpers.c -o rsrc/miniaudiohelpers/miniaudiohelpers.o
sudo gcc rsrc/miniaudiohelpers/miniaudiohelpers.o -shared -o /usr/local/lib/libminiaudiohelpers.so -lm
sudo cp /usr/local/lib/libminiaudiohelpers.so /usr/lib/libminiaudiohelpers.so
sudo ln -s /usr/lib/libminiaudiohelpers.so /lib/miniaudiohelpers.so

# Compile raylib
git clone --depth 1 --branch 5.0 https://github.com/raysan5/raylib
mkdir raylib/build
sudo apt install libasound2-dev libx11-dev libxrandr-dev libxi-dev libgl1-mesa-dev libglu1-mesa-dev libxcursor-dev libxinerama-dev
cmake raylib -DBUILD_SHARED_LIBS=ON -DCMAKE_BUILD_TYPE=Release -B raylib/build 
cmake --build raylib/build
sudo make install -C raylib/build
sudo cp /usr/local/lib/libraylib.so.5.0.0 /usr/lib/libraylib.so.500
sudo ln -s /usr/lib/libraylib.so.500 /lib/raylib.so

# Compile raygui
git clone --depth 1 --branch 4.0 https://github.com/raysan5/raygui
mv raygui/src/raygui.h raygui/src/raygui.c
gcc -c -fPIC raygui/src/raygui.c -o raygui/raygui.o -DRAYGUI_IMPLEMENTATION
sudo gcc raygui/raygui.o -shared -o /usr/local/lib/libraygui.so -DRAYGUI_IMPLEMENTATION -lraylib -lGL -lm -lpthread -ldl -lrt -lX11
sudo cp /usr/local/lib/libraygui.so /usr/lib/libraygui.so
sudo ln -s /usr/lib/libraygui.so /lib/raygui.so

rm -r raygui
rm -r raylib
