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
copy raylib\Release\raylib.lib C:\raylib\raylib.lib
copy raylib\Release\raylib.dll C:\raylib\raylib.dll
cd ..\..

git clone https://github.com/raysan5/raygui
cd raygui
copy src\raygui.h src\raygui.c
cl /O2 /I../raylib/src/ /D_USRDLL /D_WINDLL /DRAYGUI_IMPLEMENTATION /DBUILD_LIBTYPE_SHARED src/raygui.c /LD /Feraygui.dll /link /LIBPATH ../raylib/build/raylib/Debug/raylib.lib /subsystem:windows /machine:x64
copy raygui.lib C:\raylib\raygui.lib
copy raygui.dll C:\raylib\raygui.dll
cd ..

Remove-Item "raylib" -Recurse -Force
Remove-Item "raygui" -Recurse -Force
