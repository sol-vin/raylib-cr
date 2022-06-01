require "raylib-cr"

alias F = LibFerox
alias R = LibRaylib

module Screen
  class_property width : LibC::Float = 800
  class_property height : LibC::Float = 600

  def self.width_in_meters
    F.number_pixels_to_meters(width)
  end

  def self.height_in_meters
    F.number_pixels_to_meters(height)
  end
end

module Vars
  class_property? use_polygon_cursor = false

  TEXT      = "LEFT-CLICK TO CHANGE THE SHAPE TYPE OF THE CURSOR!"
  FONT_SIZE = 20
end

def init_example
end

def deinit_example
end

def update_example
end

def draw_example
  R.begin_drawing
  R.end_drawing
end

R.set_config_flags(R::ConfigFlags::MSAA4xHint)
R.set_target_fps(60)
R.init_window(Screen.width, Screen.height, "Hello World")

init_example

until R.close_window?
  update_example
  draw_example
end
deinit_example
R.close_window
