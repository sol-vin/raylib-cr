require "./spec_helper"
require "../src/raylib-cr/rlgl"

describe "RLGL" do
  it "matches the render batch ABI on 64-bit platforms" do
    sizeof(RLGL::VertexBuffer).should eq(72)
    sizeof(RLGL::DrawCall).should eq(16)
    sizeof(RLGL::RenderBatch).should eq(32)

    vertex_buffer = RLGL::VertexBuffer.new
    render_batch = RLGL::RenderBatch.new
    typeof(vertex_buffer.vbo_id).should eq(StaticArray(LibC::UInt, 5))
    typeof(render_batch.vertex_buffer).should eq(Pointer(RLGL::VertexBuffer))
  end

  it "exposes representative rlgl signatures" do
    typeof(RLGL.get_cull_distance_near).should eq(Float64)
    typeof(RLGL.get_proc_address(Pointer(LibC::Char).null)).should eq(Pointer(Void))
    typeof(RLGL.draw_vertex_array_instanced(0, 0, 0)).should eq(Nil)
    typeof(RLGL.load_framebuffer).should eq(UInt32)
    typeof(RLGL.get_shader_buffer_size(0)).should eq(UInt32)
  end
end
