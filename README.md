![logo](logo/raylib-cr_256x256.png)
# raylib-cr

Crystal Bindings for `raylib`, a small and easy to use game development library.  
As for now the bindings only support the raw function calls from raylib itself, a warpper will be out shortly!
The native library can be found in th `native` folder of this repository.

## Supported platforms
`x86_64-linux-gnu` = 64-bit Linux

## Installation
1. Add `raylib-cr` to your `shard.yml`:
```yml
  dependencies:
    raylib-cr:
      github: AregevDev/raylib-cr
```
2. Run `shards install`

## Usage Example
```crystal
require "raylib-cr"

screen_width = 800
screen_height = 450

LibRaylib.InitWindow screen_width, screen_height, "raylib-cr"
LibRaylib.SetTargetFPS 60

c = LibRaylib::Color.new
c.r = 0
c.g = 0
c.b = 0
c.a = 255

until LibRaylib.WindowShouldClose
    LibRaylib.BeginDrawing
    LibRaylib.ClearBackground c
    LibRaylib.EndDrawing
end

LibRaylib.CloseWindow
```

## Contributing
1. Fork it (<https://github.com/AregevDev/raylib-cr)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors
- [AregevDev](https://github.com/AregevDev) - creator and maintainer
