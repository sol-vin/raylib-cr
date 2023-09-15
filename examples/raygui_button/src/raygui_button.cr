require "raylib-cr"
require "raylib-cr/raygui"
screen_width = 800
screen_height = 450

Raylib.init_window(screen_width, screen_height, "Hello World")

Raylib.set_target_fps(60)

show_text = false

until Raylib.close_window?
  Raylib.begin_drawing
  Raylib.clear_background(Raylib::WHITE)

  button_width = 250
  button_height = 80

  Raygui.set_style(Raygui::Control::Default, Raygui::DefaultProperty::TextSize, 25)

  if Raygui.button(
       Raylib::Rectangle.new(
         x: Raylib.get_screen_width/2 - button_width/2,
         y: Raylib.get_screen_height/2 - button_height/2,
         width: button_width,
         height: button_height
       ),
       "Click This Button"
     )
    show_text = !show_text
  end

  if show_text
    Raylib.draw_text("Button Pressed!", 10, 10, 40, Raylib::RED)
  end

  Raylib.end_drawing
end

Raylib.close_window
