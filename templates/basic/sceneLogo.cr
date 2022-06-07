require "raylib-cr"

module Basic_template
    
    # This scene is just a port of the https://www.raylib.com/examples/shapes/loader.html?name=shapes_logo_raylib_anim example
    class SceneLogo
        property logoPositionX      : Int32
        property logoPositionY      : Int32
        property framesCounter      : Int32
        property lettersCount       : Int32 
        property topSideRecWidth    : Int32
        property leftSideRecHeight  : Int32
        property bottomSideRecWidth : Int32
        property rightSideRecHeight : Int32
        property state              : Int32
        property alpha              : Float32      

        def initialize
            @logoPositionX      = Config.default_screen_width//2 - 128
            @logoPositionY      = Config.default_screen_width//2 - 256
        
            @framesCounter      = 0
            @lettersCount       = 0
        
            @topSideRecWidth    = 16
            @leftSideRecHeight  = 16
        
            @bottomSideRecWidth = 16
            @rightSideRecHeight = 16
        
            @state              = 0               # Tracking animation states (State Machine)
            @alpha              = 1.0             # Useful for fading
        end

        def load
            
        end

        def update
            case @state

            # State 0: Small box blinking
            when 0
                @framesCounter += 1
    
                if @framesCounter == 120
                    @state = 1
                    @framesCounter = 0      # Reset counter... will be used later...
                end

            # State 1: Top and left bars growing
            when 1
                @topSideRecWidth += 4
                @leftSideRecHeight += 4
    
                if @topSideRecWidth == 256 
                    @state = 2
                end

            # State 2: Bottom and right bars growing
            when 2
                @bottomSideRecWidth += 4
                @rightSideRecHeight += 4
    
                if @bottomSideRecWidth == 256 
                    @state = 3
                end

            # State 3: Letters appearing (one by one)
            when 3
                @framesCounter += 1

                if @framesCounter.divisible_by?(12)       # Every 12 frames, one more letter!
                    @lettersCount += 1
                    @framesCounter = 0
                end
    
                if @lettersCount >= 10     # When all letters have appeared, just fade out everything
                    @alpha -= 0.02
    
                    if @alpha <= 0.0
                        @alpha = 0.0
                        @state = 4
                    end
                end

            # State 4: Reset and Replay
            when 4
                if LibRaylib.key_pressed? LibRaylib::KeyboardKey::R
                    @framesCounter = 0
                    @lettersCount = 0
    
                    @topSideRecWidth = 16
                    @leftSideRecHeight = 16
    
                    @bottomSideRecWidth = 16
                    @rightSideRecHeight = 16
    
                    @alpha = 1.0
                    @state = 0          # Return to State 0
                end
            end

            if LibRaylib.key_pressed? LibRaylib::KeyboardKey::Space
                puts "space clicked"
                SceneManager.current_scene =  SceneMainMenu.new
            end
        end

        def draw
            LibRaylib.draw_text("MADE WITH LOVE USING", LibRaylib.get_screen_width //2 - 128 , LibRaylib.get_screen_width //2 - 286, 20, LibRaylib::GRAY)

            case @state
            when 0 #TODO

                if (@framesCounter//15).odd? 
                    LibRaylib.draw_rectangle(@logoPositionX, @logoPositionY, 16, 16, LibRaylib::BLACK)
                end

            when 1
                LibRaylib.draw_rectangle(@logoPositionX, @logoPositionY, @topSideRecWidth, 16, LibRaylib::BLACK)
                LibRaylib.draw_rectangle(@logoPositionX, @logoPositionY, 16, @leftSideRecHeight, LibRaylib::BLACK)

            when 2
                LibRaylib.draw_rectangle(@logoPositionX, @logoPositionY, @topSideRecWidth, 16, LibRaylib::BLACK)
                LibRaylib.draw_rectangle(@logoPositionX, @logoPositionY, 16, @leftSideRecHeight, LibRaylib::BLACK)

                LibRaylib.draw_rectangle(@logoPositionX + 240, @logoPositionY, 16, @rightSideRecHeight, LibRaylib::BLACK)
                LibRaylib.draw_rectangle(@logoPositionX, @logoPositionY + 240, @bottomSideRecWidth, 16, LibRaylib::BLACK)
            
            when 3
                LibRaylib.draw_rectangle(@logoPositionX, @logoPositionY, @topSideRecWidth, 16, LibRaylib.fade(LibRaylib::BLACK, @alpha))
                LibRaylib.draw_rectangle(@logoPositionX, @logoPositionY + 16, 16, @leftSideRecHeight - 32, LibRaylib.fade(LibRaylib::BLACK, @alpha))

                LibRaylib.draw_rectangle(@logoPositionX + 240, @logoPositionY + 16, 16, @rightSideRecHeight - 32, LibRaylib.fade(LibRaylib::BLACK, @alpha))
                LibRaylib.draw_rectangle(@logoPositionX, @logoPositionY + 240, @bottomSideRecWidth, 16, LibRaylib.fade(LibRaylib::BLACK, @alpha))

                LibRaylib.draw_rectangle(LibRaylib.get_screen_width //2 - 112, LibRaylib.get_screen_height //2 - 112, 224, 224, LibRaylib.fade(LibRaylib::RAYWHITE, @alpha))

                LibRaylib.draw_text( LibRaylib.text_subtext("raylib", 0, @lettersCount), LibRaylib.get_screen_width //2 - 44, LibRaylib.get_screen_height //2 + 48, 50,  LibRaylib.fade(LibRaylib::BLACK, @alpha))
            
            when 4
                # Automatically goto next scene
                SceneManager.current_scene =  SceneMainMenu.new
            end
        end

        def unload
        end

    end
end
