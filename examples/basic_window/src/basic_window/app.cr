require "raylib-cr"

class App
  SCREEN_WIDTH  = 800
  SCREEN_HEIGHT = 450

  getter :name

  def initialize(@name : String = "Project")
  end

  def run!
    # Initialization
    Raylib.init_window(SCREEN_WIDTH, SCREEN_HEIGHT, name)
    Raylib.set_target_fps(60)

    # Main game loop
    until Raylib.close_window? # Detect window close button or ESC key
      draw
    end

    # De-Initialization
    Raylib.close_window # Close window and OpenGL context
  end

  # Draw method
  private def draw
    Raylib.begin_drawing

    Raylib.clear_background(Raylib::RAYWHITE)
    Raylib.draw_text("Congrats! You created your first window!", 190, 200, 20, Raylib::LIGHTGRAY)

    Raylib.end_drawing
  end
end
