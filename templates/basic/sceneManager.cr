module Basic_template

    # This is the simplest scene manager. Every scene is a class which gets initialized every time the scene changes.
    # The scene is changed by simply changing the current_scene value
    # A much more advanced Scene Manager will also keep track of initialized scenes and allow you to switch to them, 
    # instead of creating new ones every time
    module SceneManager extend self
        class_property current_scene : SceneLogo | SceneMainMenu | SceneSettings | SceneGame = SceneLogo.new
    end
end
