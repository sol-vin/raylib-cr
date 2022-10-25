require "raylib-cr"

module Basic_template

    class SceneMainMenu

        def initialize
        end

        def load
        end

        def update
        end

        def draw
            Raylib.draw_text("Super Pong!",  Raylib.get_screen_width //2 - 60,  150, 20, Raylib::BLACK)

            if LibRayGUI.button( Raylib::Rectangle.new(x: Raylib.get_screen_width //2 - 60, y: 200, width: 120, height: 40), "Start Game" ) 
                SceneManager.current_scene =  SceneGame.new
            end

            if LibRayGUI.button( Raylib::Rectangle.new(x: Raylib.get_screen_width //2 - 60, y: 250, width: 120, height: 40 ), "Settings" ) 
                SceneManager.current_scene =  SceneSettings.new
            end
            
            if LibRayGUI.button( Raylib::Rectangle.new(x: Raylib.get_screen_width //2 - 60, y: 300, width: 120, height: 40), "Quit" ) 
                SceneManager.current_scene.unload
                GUI.disable
                RL.close_window

                exit(0)
            end


        end

        def unload
        end

    end
end