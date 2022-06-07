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
            if LibRaylib.key_pressed? LibRaylib::KeyboardKey::Space
                puts "space clicked"
                SceneManager.current_scene = SceneSettings.new

            end
        end

        def draw
            LibRaylib.draw_text("Imagine if you will, that the game of your dreams is running here!", 190, 200, 20, LibRaylib::BLACK)
            LibRaylib.draw_text("Frame count = #{@frameCount}", 190, 240, 20, LibRaylib::BLACK)
            if LibRayGUI.button( LibRaylib::Rectangle.new, "Press me!" ) 
                pp "Pressed";
            end
        end

        def unload
        end

    end
end