require "raylib-cr"

module Basic_template

    class SceneGame

        def initialize
            @frameCount = 0
        end

        def load
            
        end

        def update
            @frameCount += 1
            if Raylib.key_pressed? Raylib::KeyboardKey::Space
                puts "space clicked"
                SceneManager.current_scene = SceneSettings.new

            end
        end

        def draw
            Raylib.draw_text("Imagine if you will, that the game of your dreams is running here!", 190, 200, 20, Raylib::BLACK)
            Raylib.draw_text("Frame count = #{@frameCount}", 190, 240, 20, Raylib::BLACK)
            if LibRayGUI.button( Raylib::Rectangle.new, "Press me!" ) 
                pp "Pressed";
            end
        end

        def unload
        end

    end
end