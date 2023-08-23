gcc -c -fPIC rsrc/miniaudio-tests/miniaudiohelpers.c -o rsrc/miniaudio-tests/miniaudiohelpers.o
sudo gcc rsrc/miniaudio-tests/miniaudiohelpers.o -shared -o /usr/local/lib/libminiaudiohelpers.so -lm
sudo cp /usr/local/lib/libminiaudiohelpers.so /usr/lib/libminiaudiohelpers.so
sudo ln -s /usr/lib/libminiaudiohelpers.so /lib/miniaudiohelpers.so
git clone https://github.com/raysan5/raylib
mkdir raylib/build
sudo apt install libasound2-dev libx11-dev libxrandr-dev libxi-dev libgl1-mesa-dev libglu1-mesa-dev libxcursor-dev libxinerama-dev
cmake raylib -DBUILD_SHARED_LIBS=ON -B raylib/build 
cmake --build raylib/build
sudo make install -C raylib/build
sudo cp /usr/local/lib/libraylib.so.4.5.0 /usr/lib/libraylib.so.450
sudo ln -s /usr/lib/libraylib.so.450 /lib/raylib.so
rm -r raylib
rm -r rsrc/miniaudio-tests/miniaudiohelpers.o