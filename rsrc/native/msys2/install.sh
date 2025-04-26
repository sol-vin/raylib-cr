# Compile miniaudio helpers
cc -c -fPIC rsrc/miniaudiohelpers/miniaudiohelpers.c -o rsrc/miniaudiohelpers/miniaudiohelpers.o
cc rsrc/miniaudiohelpers/miniaudiohelpers.o -shared -lm \
  -o${MINGW_PREFIX}/bin/libminiaudiohelpers.dll \
  -Wl,--out-implib=${MINGW_PREFIX}/lib/libminiaudiohelpers.dll.a
rm rsrc/miniaudiohelpers/miniaudiohelpers.o

# Install raylib
pacman -Sy "${MINGW_PACKAGE_PREFIX:+${MINGW_PACKAGE_PREFIX}-}raylib" --needed --noconfirm

# Compile raygui
git clone --depth 1 --branch 4.0 https://github.com/raysan5/raygui
mv raygui/src/raygui.h raygui/src/raygui.c
cc -c -fPIC raygui/src/raygui.c -o raygui/raygui.o -DRAYGUI_IMPLEMENTATION
cc raygui/raygui.o -shared -DRAYGUI_IMPLEMENTATION -lraylib -lm -lpthread \
  -o${MINGW_PREFIX}/bin/libraygui.dll \
  -Wl,--out-implib=${MINGW_PREFIX}/lib/libraygui.dll.a
rm -rf raygui
