require "raylib-cr"
screen_width = 800
screen_height = 450
Raylib.init_window(screen_width, screen_height, "Hello World")
Raylib.set_target_fps(60)

until Raylib.close_window?
  Raylib.begin_drawing
  Raylib.clear_background(Raylib::RAYWHITE)
  Raylib.draw_text("Basic Shapes", 20, 20, 20, Raylib::DARKGRAY)
  Raylib.draw_circle(screen_width/5, 120, 35, Raylib::DARKBLUE);
  Raylib.draw_circle_gradient(screen_width/5, 220, 60, Raylib::GREEN, Raylib::SKYBLUE);
  Raylib.draw_circle_lines(screen_width/5, 340, 80, Raylib::DARKBLUE);

  Raylib.draw_rectangle(screen_width/4*2 - 60, 100, 120, 60, Raylib::RED);
  Raylib.draw_rectangle_gradient_h(screen_width/4*2 - 90, 170, 180, 130, Raylib::MAROON, Raylib::GOLD);
  Raylib.draw_rectangle_lines(screen_width/4*2 - 40, 320, 80, 60, Raylib::ORANGE); 

  a = Raylib::Vector2.new
  a.x = screen_width / 4.0 * 3.0
  a.y = 80.0

  b = Raylib::Vector2.new
  b.x = screen_width / 4.0 * 3.0 - 60.0
  b.y = 150.0

  c = Raylib::Vector2.new
  c.x = screen_width / 4.0 * 3.0 + 60.0
  c.y = 150.0
  Raylib.draw_triangle(a, b, c, Raylib::VIOLET);

  a.x = screen_width / 4.0 * 3.0
  a.y = 160.0

  b.x = screen_width / 4.0 * 3.0 - 20.0
  b.y = 230.0

  c.x = screen_width / 4.0 * 3.0 + 20.0
  c.y = 230.0
  Raylib.draw_triangle_lines(a, b, c, Raylib::DARKBLUE)

  a.x = screen_width / 4.0 * 3.0
  a.y = 320.0

  Raylib.draw_poly(a, 6, 80, 0, Raylib::BROWN)
  Raylib.draw_poly_lines_ex(a, 6, 80, 0, 6, Raylib::BEIGE)

  Raylib.draw_line(17, 42, screen_width - 18, 42, Raylib::BLACK)
  Raylib.end_drawing
end

Raylib.close_window
