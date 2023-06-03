![logo](logo/raylib-cr_256x256.png)

# raylib-cr

Crystal Bindings for `raylib`, a small and easy to use game development library.  
As for now the bindings only support the raw function calls from raylib itself.
`raymath` functions are also supported, as are infix operators for vectors,
matricies, and quaternions.
# Supported platforms

These platforms are supported out of the box and are linked statically
1. `x86_64-linux-gnu` = 64-bit Linux
2. `x86_64-windows` = 64-bit Windows

Hopefully soon
3. Raspberry PI

# Installation

### Linux
1. Install raylib from [github](https://github.com/raysan5/raylib/releases)
2. Run `make install` in raylib
3. Add `raylib-cr` to your `shard.yml` dependencies like so:
```yml
dependencies:
  raylib-cr:
    github: sol-vin/raylib-cr
```
4. Run `shards install`
5. Get programming!

### Windows

1. Follow the instructions at https://github.com/neatorobito/scoop-crystal to add the crystal-preview bucket to scoop
2. Install crystal with `scoop install crystal`
3. Copy `./rsrc/native/windows/raylib` to `C:\raylib`
4. Run in powershell
```powershell
$env:LIB="${env:LIB};C:\raylib\lib"
$env:PATH="${env:PATH};C:\raylib\lib"
```

OR

Run in cmd
```cmd
set PATH=%PATH%;C:\raylib\lib
set LIB=%LIB%;C:\raylib\lib
```
5. Go back to your project directory. Add `raylib-cr` to your `shard.yml`:
```yml
dependencies:
  raylib-cr:
    github: sol-vin/raylib-cr
```
6. Run `mkdir lib && cd lib && git clone https://github.com/sol-vin/raylib-cr`
7. Get programming!

# Usage Example

```crystal
require "raylib-cr"

Raylib.init_window(800, 450, "Hello World")
Raylib.set_target_fps(60)

until Raylib.close_window?
  Raylib.begin_drawing
  Raylib.clear_background(Raylib::RAYWHITE)
  
  Raylib.draw_text("Hello World!", 190, 200, 20, Raylib::BLACK)
  Raylib.end_drawing
end

Raylib.close_window
```

# Contributing

1. Fork it (https://github.com/sol-vin/raylib-cr)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

# Owner
- [sol-vin](https://github.com/sol-vin)

# Major Contributors
- [rightbrace](https://github.com/b1tlet) - Raymath & Wrapper

# Minor Contributors
- [b1tlet](https://github.com/b1tlet) - Fog Shader

# Inactive Contributors
- [AregevDev](https://github.com/AregevDev) - creator