cl /c rsrc\miniaudio-tests\miniaudiohelpers.c
lib miniaudiohelpers.obj
mkdir libs
copy miniaudiohelpers.lib libs\miniaudiohelpers.lib
del miniaudiohelpers.obj
del miniaudiohelpers.lib

git clone https://github.com/raysan5/raylib
cd raylib
mkdir build
cd build 
cmake .. -DBUILD_SHARED_LIBS=ON
cmake --build .
copy raylib\Debug\raylib.lib ..\..\libs\raylib.lib
copy raylib\Debug\raylib.dll ..\..\libs\raylib.dll
cd ..\..
del raylib