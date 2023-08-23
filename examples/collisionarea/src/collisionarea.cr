require "raylib-cr"
screen_width = 800
screen_height = 450

Raylib.init_window(screen_width, screen_height, "Hello World")

box_a = Raylib::Rectangle.new
box_a.x = 10
box_a.y = screen_height/2.0 - 50
box_a.width = 200
box_a.height = 100
box_a_speed_x = 4

box_b = Raylib::Rectangle.new
box_b.x = screen_width/2.0 - 30
box_b.y = screen_height/2.0 - 30
box_b.width = 60
box_b.height = 60

box_collision = Raylib::Rectangle.new
screen_upper_limit = 40
pause = false
collision = false

Raylib.set_target_fps(60)

until Raylib.close_window?
  box_a.x += box_a_speed_x unless pause
  box_a_speed_x *= -1 if ((box_a.x + box_a.width) >= screen_width) || (box_a.x <= 0)

  box_b.x = Raylib.get_mouse_x - (box_b.width / 2.0)
  box_b.y = Raylib.get_mouse_y - (box_b.height / 2.0)

  if ((box_b.x + box_b.width) >= screen_width)
    box_b.x = screen_width - box_b.width
  elsif box_b.x <= 0
    box_b.x
  end

  if ((box_b.y + box_b.height) >= screen_height)
    box_b.y = screen_height - box_b.height
  elsif box_b.y <= screen_upper_limit
    box_b.y
  end

  collision = Raylib.check_collision_recs?(box_a, box_b)
  box_collision = Raylib.get_collision_rec(box_a, box_b)

  pause = !pause if Raylib.key_pressed?(Raylib::KeyboardKey::Space)

  Raylib.begin_drawing
  Raylib.clear_background Raylib::WHITE
  Raylib.draw_rectangle(0, 0, screen_width, screen_upper_limit, collision ? Raylib::RED : Raylib::BLACK)
  Raylib.draw_rectangle_rec(box_a, Raylib::GOLD)
  Raylib.draw_rectangle_rec(box_b, Raylib::BLUE)

  if collision
    Raylib.draw_rectangle_rec(box_collision, Raylib::GREEN)
    Raylib.draw_text("COLLISION!", screen_width/2.0 - Raylib.measure_text("COLLISION!", 20)/2.0, screen_upper_limit/2.0 - 10, 20, Raylib::BLACK)
    Raylib.draw_text("Collision Area: #{(box_collision.width * box_collision.height).to_i}", screen_width/2.0 - 100, screen_upper_limit + 10, 20, Raylib::BLACK)
  end

  Raylib.draw_fps(10, 10)

  Raylib.end_drawing
end

Raylib.close_window
