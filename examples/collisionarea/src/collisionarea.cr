require "raylib-cr"
screen_width = 800
screen_height = 450

LibRaylib.init_window(screen_width, screen_height, "Hello World")


box_a = LibRaylib::Rectangle.new
box_a.x = 10
box_a.y = screen_height/2.0 - 50
box_a.width = 200
box_a.height = 100
box_a_speed_x = 4

box_b = LibRaylib::Rectangle.new
box_b.x = screen_width/2.0 - 30
box_b.y = screen_height/2.0 - 30
box_b.width = 60
box_b.height = 60

box_collision = LibRaylib::Rectangle.new
screen_upper_limit = 40
pause = false
collision = false

LibRaylib.set_target_fps(60)

until LibRaylib.close_window?
  box_a.x += box_a_speed_x unless pause
  box_a_speed_x *= -1 if ((box_a.x + box_a.width) >= screen_width) || (box_a.x <= 0)

  box_b.x = LibRaylib.get_mouse_x - (box_b.width / 2.0)
  box_b.y = LibRaylib.get_mouse_y - (box_b.height / 2.0)


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

  collision = LibRaylib.check_collision_recs?(box_a, box_b)
  box_collision = LibRaylib.get_collision_rec(box_a, box_b)

  pause = !pause if LibRaylib.key_pressed?(LibRaylib::KeyboardKey::KeySpace)

  LibRaylib.begin_drawing
  LibRaylib.clear_background LibRaylib::WHITE
  LibRaylib.draw_rectangle(0, 0, screen_width, screen_upper_limit, collision ? LibRaylib::RED : LibRaylib::BLACK)
  LibRaylib.draw_rectangle_rec(box_a, LibRaylib::GOLD)
  LibRaylib.draw_rectangle_rec(box_b, LibRaylib::BLUE)

  if collision
    LibRaylib.draw_rectangle_rec(box_collision, LibRaylib::GREEN)
    LibRaylib.draw_text("COLLISION!", screen_width/2.0 - LibRaylib.measure_text("COLLISION!", 20)/2.0, screen_upper_limit/2.0 - 10, 20, LibRaylib::BLACK)
    LibRaylib.draw_text("Collision Area: #{ (box_collision.width *  box_collision.height).to_i}", screen_width/2.0 - 100, screen_upper_limit + 10, 20, LibRaylib::BLACK)
  end

  LibRaylib.draw_fps(10, 10)

  LibRaylib.end_drawing
end

LibRaylib.close_window
