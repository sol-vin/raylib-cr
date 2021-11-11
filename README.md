![logo](logo/raylib-cr_256x256.png)

# raylib-cr

Crystal Bindings for `raylib`, a small and easy to use game development library.  
As for now the bindings only support the raw function calls from raylib itself, a wrapper will be out shortly, 
I plan on making a more object-oriented wrapper around raylib.  

The native libraries can be found in the `native/<OSNAME>` folder of this repository.

# Supported platforms

These platforms are supported out of the box and are linked statically
1. `x86_64-linux-gnu` = 64-bit Linux

# Installation

1. Add `raylib-cr` to your `shard.yml`:
```yml
dependencies:
  raylib-cr:
    github: AregevDev/raylib-cr
```
2. Run `shards install`

# Usage Example

```crystal
require "raylib-cr"

LibRaylib.init_window(800, 450, "Hello World")
LibRaylib.set_target_fps(60)

until LibRaylib.close_window?
  LibRaylib.begin_drawing
  LibRaylib.clear_background(LibRaylib::RAYWHITE)
  
  LibRaylib.draw_text("Hello World!", 190, 200, 20, LibRaylib::BLACK)
  LibRaylib.end_drawing
end

LibRaylib.close_window
```

# TODO:

These are my plans for `v1.0.0`
- [ ] Proper testing with `crystal spec`
- [ ] Setup Travis CI
- [ ] OOP Wrapper

# Contributing

1. Fork it (https://github.com/AregevDev/raylib-cr)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

# Contributors

- [AregevDev](https://github.com/AregevDev) - creator and maintainer
- [sol-vin](https://github.com/sol-vin) - maintainer