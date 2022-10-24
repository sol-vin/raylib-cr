require "raylib-cr"

alias Rl = LibRaylib

puts "ma_data_converter_size: #{Rl.ma_data_converter_size}"
puts "ma_device_size: #{Rl.ma_device_size}"
puts "ma_context_size: #{Rl.ma_context_size}"
puts "ma_mutex_size: #{Rl.ma_mutex_size}"

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
