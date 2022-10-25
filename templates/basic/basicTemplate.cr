require "raylib-cr"

require "./config.cr"
require "./sceneManager.cr"
require "./sceneLogo.cr"
require "./sceneMainMenu.cr"
require "./sceneSettings.cr"
require "./sceneGame.cr"

# The aliases here are just to show that you don't need to use the full namespaces
alias RL = Raylib
alias GUI = LibRayGUI

module Basic_template

    RL.init_window(Config.default_screen_width, Config.default_screen_height, "Hello World")
    RL.set_target_fps(60)

    # By default Raylib sets Esc as the exit key. If you don't want this behavior, you can set the exit key as Null.
    RL.set_exit_key (RL::KeyboardKey::Null)

    GUI.enable

    SceneManager.current_scene.load

    until RL.close_window?
        SceneManager.current_scene.update

        RL.begin_drawing
        RL.clear_background(RL::RAYWHITE)
        RL.draw_fps(20, 20)

        SceneManager.current_scene.draw
        RL.end_drawing
    end

    # This is where you will need to free all the textures and assets that you send over to Raylib
    # A good rule of thumb is that if it is in the assets folder, it will need to be freed
    # In this example template, we are not using any textures and as such the unload function is empty for all scenes
    SceneManager.current_scene.unload
    GUI.disable
    RL.close_window

    # Forced exit is good practice with FFI based frameworks as sometimes the window is closed but the process keeps running
    exit(0)
end
