cl /c lib\raylib-cr\rsrc\miniaudio-tests\miniaudiohelpers.c
lib miniaudiohelpers.obj
mkdir libs
copy miniaudiohelpers.lib libs\miniaudiohelpers.lib
del miniaudiohelpers.obj
del miniaudiohelpers.lib

git clone https://github.com/raysan5/raylib
cd raylib
mkdir build
cd build 
cmake .. -DBUILD_SHARED_LIBS=ON -DCMAKE_BUILD_TYPE=Release
cmake --build .
copy raylib\Release\raylib.lib ..\..\libs\raylib.lib
copy raylib\Release\raylib.dll ..\..\libs\raylib.dll
cd ..\..

git clone https://github.com/raysan5/raygui
cd raygui
copy src\raygui.h src\raygui.c
cl /O2 /I../raylib/src/ /D_USRDLL /D_WINDLL /DRAYGUI_IMPLEMENTATION /DBUILD_LIBTYPE_SHARED src/raygui.c /LD /Feraygui.dll /link /LIBPATH ../raylib/build/raylib/Debug/raylib.lib /subsystem:windows /machine:x64
copy raygui.lib ..\libs\raygui.lib
copy raygui.dll ..\libs\raygui.dll
cd ..
del raygui
del raylib
