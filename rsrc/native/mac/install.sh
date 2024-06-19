#!/usr/bin/env sh

set -e

test -f $(dirname "$0")/raylib/build/raylib/libraylib.a || sh $(dirname "$0")/build.sh
sudo cp $(dirname "$0")/raylib/build/raylib/libraylib.a /usr/local/lib/libraylib.a
sudo rm -rf $(dirname "$0")/raylib