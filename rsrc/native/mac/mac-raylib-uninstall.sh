#!/usr/bin/env sh

set -e

test -f /usr/local/lib/libraylib.a && sudo rm /usr/local/lib/libraylib.a
test -f /usr/local/lib/libraylib.6.0.0.dylib && sudo rm /usr/local/lib/libraylib.6.0.0.dylib
test -f /usr/local/lib/libraylib.600.dylib && sudo rm /usr/local/lib/libraylib.600.dylib
test -f /usr/local/lib/libraylib.dylib && sudo rm /usr/local/lib/libraylib.dylib
test -f /usr/local/lib/raygui.dylib && sudo rm /usr/local/lib/raygui.dylib
test -f /usr/local/lib/libraygui.a && sudo rm /usr/local/lib/libraygui.a
