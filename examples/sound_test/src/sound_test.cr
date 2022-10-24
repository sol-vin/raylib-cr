require "raylib-cr"

alias Rl = LibRaylib

Rl.init_window(100, 100, "Sound Test")
Rl.init_audio_device
Rl.set_target_fps(60)

sound = Rl.load_sound("rsrc/marmapurr.mp3")
until Rl.close_window?

  Rl.begin_drawing
  if !Rl.sound_playing?(sound)
    Rl.play_sound(sound)
  end
  Rl.clear_background(Rl::RAYWHITE)
  Rl.end_drawing
end
Rl.close_audio_device
Rl.close_window
