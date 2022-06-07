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
            LibRaylib.draw_text("Super Pong!",  LibRaylib.get_screen_width //2 - 60,  150, 20, LibRaylib::BLACK)

            if LibRayGUI.button( LibRaylib::Rectangle.new(x: LibRaylib.get_screen_width //2 - 60, y: 200, width: 120, height: 40), "Start Game" ) 
                SceneManager.current_scene =  SceneGame.new
            end

            if LibRayGUI.button( LibRaylib::Rectangle.new(x: LibRaylib.get_screen_width //2 - 60, y: 250, width: 120, height: 40 ), "Settings" ) 
                SceneManager.current_scene =  SceneSettings.new
            end
            
            if LibRayGUI.button( LibRaylib::Rectangle.new(x: LibRaylib.get_screen_width //2 - 60, y: 300, width: 120, height: 40), "Quit" ) 
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