require "raylib-cr"
screen_width = 800
screen_height = 450
LibRaylib.init_window(screen_width, screen_height, "Hello World")
LibRaylib.set_target_fps(60)

until LibRaylib.close_window?
  LibRaylib.begin_drawing
  LibRaylib.clear_background(LibRaylib::RAYWHITE)
  LibRaylib.draw_text("Basic Shapes", 20, 20, 20, LibRaylib::DARKGRAY)
  LibRaylib.draw_circle(screen_width/5, 120, 35, LibRaylib::DARKBLUE);
  LibRaylib.draw_circle_gradient(screen_width/5, 220, 60, LibRaylib::GREEN, LibRaylib::SKYBLUE);
  LibRaylib.draw_circle_lines(screen_width/5, 340, 80, LibRaylib::DARKBLUE);

  LibRaylib.draw_rectangle(screen_width/4*2 - 60, 100, 120, 60, LibRaylib::RED);
  LibRaylib.draw_rectangle_gradient_h(screen_width/4*2 - 90, 170, 180, 130, LibRaylib::MAROON, LibRaylib::GOLD);
  LibRaylib.draw_rectangle_lines(screen_width/4*2 - 40, 320, 80, 60, LibRaylib::ORANGE); 

  a = LibRaylib::Vector2.new
  a.x = screen_width / 4.0 * 3.0
  a.y = 80.0

  b = LibRaylib::Vector2.new
  b.x = screen_width / 4.0 * 3.0 - 60.0
  b.y = 150.0

  c = LibRaylib::Vector2.new
  c.x = screen_width / 4.0 * 3.0 + 60.0
  c.y = 150.0
  LibRaylib.draw_triangle(a, b, c, LibRaylib::VIOLET);

  a.x = screen_width / 4.0 * 3.0
  a.y = 160.0

  b.x = screen_width / 4.0 * 3.0 - 20.0
  b.y = 230.0

  c.x = screen_width / 4.0 * 3.0 + 20.0
  c.y = 230.0
  LibRaylib.draw_triangle_lines(a, b, c, LibRaylib::DARKBLUE)

  a.x = screen_width / 4.0 * 3.0
  a.y = 320.0

  LibRaylib.draw_poly(a, 6, 80, 0, LibRaylib::BROWN)
  LibRaylib.draw_poly_lines_ex(a, 6, 80, 0, 6, LibRaylib::BEIGE)

  LibRaylib.draw_line(17, 42, screen_width - 18, 42, LibRaylib::BLACK)
  LibRaylib.end_drawing
end

LibRaylib.close_window
