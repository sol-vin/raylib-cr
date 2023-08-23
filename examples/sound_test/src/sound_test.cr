require "raylib-cr"
require "raylib-cr/audio"

alias Rl = Raylib
alias Ra = RAudio

Rl.init_window(100, 100, "Sound Test")
RAudio.init_audio_device
Rl.set_target_fps(60)

# puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" + MiniAudioHelpers.ma_data_converter_size.to_s

sound = RAudio.load_sound("rsrc/marmapurr.mp3")
until Rl.close_window?
  Rl.begin_drawing
  if !RAudio.sound_playing?(sound)
    RAudio.play_sound(sound)
  end
  Rl.clear_background(Rl::RAYWHITE)
  Rl.end_drawing
end
RAudio.close_audio_device
Rl.close_window
