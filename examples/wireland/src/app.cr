require "raylib-cr"
require "./wireland"

alias V2 = R::Vector2


module C
  SCREEN_WIDTH  = 800
  SCREEN_HEIGHT = 450
end

R.init_window(C::SCREEN_WIDTH, C::SCREEN_HEIGHT, "wireland")

R.set_target_fps(60)

until R.close_window?
  R.begin_drawing
  R.clear_background(R::BLACK)

  R.end_drawing
end

R.close_window
