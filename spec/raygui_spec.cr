require "./spec_helper"
require "../src/raylib-cr/raygui"

describe "Raygui" do
  it "binds representative raygui 5.0 additions" do
    bounds = Raylib::Rectangle.new

    Raygui::Control::TabBar.value.should eq(11)
    Raygui::IconName::FiletypeIcon.value.should eq(256)
    typeof(Raygui.load_style_from_memory(Pointer(LibC::UChar).null, 0)).should eq(Nil)
    typeof(Raygui.value_box_float(bounds, Pointer(LibC::Char).null, Pointer(LibC::Char).null, Pointer(LibC::Float).null, false)).should eq(Int32)
    typeof(Raygui.tab_bar_ex(bounds, Pointer(Pointer(LibC::Char)).null, 0, Pointer(LibC::Int).null, Pointer(LibC::Int).null, Pointer(LibC::Int).null)).should eq(Int32)
  end
end
