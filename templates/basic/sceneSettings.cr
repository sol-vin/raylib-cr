require "raylib-cr"

module Basic_template

    class SceneSettings

        def initialize
        end

        def load
            
        end

        def update
        end

        def draw
            Raylib.draw_text("Settings",  Raylib.get_screen_width //2 - 60,  150, 20, Raylib::BLACK)

            if LibRayGUI.button( Raylib::Rectangle.new(x: Raylib.get_screen_width //2 - 60, y: 250, width: 120, height: 40), "Toggle Full Screen" ) 
                pp "Toggling fullscreen"

                # see what display we are on right now
                display = Raylib.get_current_monitor

                if Raylib.window_fullscreen?
                    # if we are full screen, then go back to the default windowed size
                    # Do note that going back from fullscreen to windows is pretty finicky
                    Raylib.set_window_size(Config.default_screen_width, Config.default_screen_height )
                else
                    # if we are not full screen, set the window size to match the monitor we are on
                    Raylib.set_window_size(Raylib.get_monitor_width(display), Raylib.get_monitor_height(display))
                end

                # toggle the state
                Raylib.toggle_fullscreen 
            end

            if LibRayGUI.button( Raylib::Rectangle.new(x: Raylib.get_screen_width //2 - 60, y: 300, width: 120, height: 40), "Back to Menu" ) 
                SceneManager.current_scene = SceneMainMenu.new
            end

        end

        def unload
        end

    end
end
