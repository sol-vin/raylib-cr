module Basic_template

    # This pattern allows us to create "global variables" in a separate module 
    # and inject them wherever we need them. Ideally the game's config should be
    # added here

    module Config extend self
        class_property default_screen_width     = 1024
        class_property default_screen_height    = 768
    end
end
