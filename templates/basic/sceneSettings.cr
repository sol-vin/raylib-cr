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
            LibRaylib.draw_text("Settings",  LibRaylib.get_screen_width //2 - 60,  150, 20, LibRaylib::BLACK)

            if LibRayGUI.button( LibRaylib::Rectangle.new(x: LibRaylib.get_screen_width //2 - 60, y: 250, width: 120, height: 40), "Toggle Full Screen" ) 
                pp "Toggling fullscreen"

                # see what display we are on right now
                display = LibRaylib.get_current_monitor

                if LibRaylib.window_fullscreen?
                    # if we are full screen, then go back to the default windowed size
                    # Do note that going back from fullscreen to windows is pretty finicky
                    LibRaylib.set_window_size(Config.default_screen_width, Config.default_screen_height )
                else
                    # if we are not full screen, set the window size to match the monitor we are on
                    LibRaylib.set_window_size(LibRaylib.get_monitor_width(display), LibRaylib.get_monitor_height(display))
                end

                # toggle the state
                LibRaylib.toggle_fullscreen 
            end

            if LibRayGUI.button( LibRaylib::Rectangle.new(x: LibRaylib.get_screen_width //2 - 60, y: 300, width: 120, height: 40), "Back to Menu" ) 
                SceneManager.current_scene = SceneMainMenu.new
            end

        end

        def unload
        end

    end
end
