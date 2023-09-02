cl /c rsrc\miniaudio-tests\miniaudiohelpers.c
lib miniaudiohelpers.obj
copy miniaudiohelpers.lib C:\raylib\miniaudiohelpers.lib
del miniaudiohelpers.obj
del miniaudiohelpers.lib

git clone https://github.com/raysan5/raylib
cd raylib
mkdir build
cd build 
cmake .. -DBUILD_SHARED_LIBS=ON
cmake --build .
mkdir C:\raylib
copy raylib\Debug\raylib.lib C:\raylib\raylib.lib
copy raylib\Debug\raylib.dll C:\raylib\raylib.dll
cd ..\..
del raylib


$env:PATH="${env:PATH};C:\raylib\lib"
$env:LIB="${env:LIB};C:\raylib\lib"