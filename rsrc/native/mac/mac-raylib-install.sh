#!/usr/bin/env sh

set -e

test -f $(dirname "$0")/raylib/build/raylib/libraylib.a || sh $(dirname "$0")/mac-raylib-build.sh
sudo cp $(dirname "$0")/raylib/build/raylib/libraylib.a /usr/local/lib/libraylib.a
