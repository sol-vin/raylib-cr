require "./lib_raylib"

LibRaylib.init_window(800, 450, "Hello World")
LibRaylib.set_target_fps(60)

until LibRaylib.close_window?
  LibRaylib.begin_drawing
  LibRaylib.clear_background(LibRaylib::RAYWHITE)
  LibRaylib.draw_text("Yeah this works", 190, 200, 20, LibRaylib::BLACK)
  LibRaylib.end_drawing
end

LibRaylib.close_window
