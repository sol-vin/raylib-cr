#!/usr/bin/env sh

set -e

test -f /usr/local/lib/libraylib.a || sh ./mac-raylib-build.sh
test -d /usr/local/lib || mkdir /usr/local/lib
sudo cp /raylib/libraylib.a /usr/local/lib/libraylib.a
