require "./spec_helper"

describe "Raylib" do
  it "matches the core ABI on 64-bit platforms" do
    sizeof(Raylib::Mesh).should eq(120)
    sizeof(Raylib::Model).should eq(136)
    sizeof(Raylib::ModelAnimation).should eq(48)

    mesh = Raylib::Mesh.new
    typeof(mesh.bone_indices).should eq(Pointer(LibC::UChar))
    typeof(mesh.vboId).should eq(Pointer(LibC::UInt))
    typeof(Raylib::BoneInfo.new.name).should eq(StaticArray(LibC::Char, 32))
  end

  it "accepts the core callback types" do
    trace_callback = ->(_level : LibC::Int, _text : LibC::Char*, _args : LibC::VaList) { }
    load_data_callback = ->(_name : LibC::Char*, _size : LibC::Int*) { Pointer(LibC::UChar).null }
    save_data_callback = ->(_name : LibC::Char*, _data : Void*, _size : LibC::Int) { true }
    load_text_callback = ->(_name : LibC::Char*) { Pointer(LibC::Char).null }
    save_text_callback = ->(_name : LibC::Char*, _text : LibC::Char*) { true }

    typeof(Raylib.set_trace_log_callback(trace_callback)).should eq(Nil)
    typeof(Raylib.set_load_file_data_callback(load_data_callback)).should eq(Nil)
    typeof(Raylib.set_save_file_data_callback(save_data_callback)).should eq(Nil)
    typeof(Raylib.set_load_file_text_callback(load_text_callback)).should eq(Nil)
    typeof(Raylib.set_save_file_text_callback(save_text_callback)).should eq(Nil)
  end

  it "exposes corrected core signatures" do
    null_char = Pointer(LibC::Char).null
    null_int = Pointer(LibC::Int).null
    white = Raylib::WHITE

    typeof(Raylib.load_file_data(null_char, null_int)).should eq(Pointer(LibC::UChar))
    typeof(Raylib.draw_line_dashed(Raylib::Vector2.new, Raylib::Vector2.new, 1, 1, white)).should eq(Nil)
    typeof(Raylib.export_image_to_memory(Raylib::Image.new, null_char, null_int)).should eq(Pointer(LibC::UChar))
    typeof(Raylib.load_model_animations(null_char, null_int)).should eq(Pointer(Raylib::ModelAnimation))
    typeof(Raylib.update_model_animation_ex(
      Raylib::Model.new,
      Raylib::ModelAnimation.new, 0_f32,
      Raylib::ModelAnimation.new, 0_f32,
      0.5_f32
    )).should eq(Nil)
  end
end
