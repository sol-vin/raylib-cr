require "./spec_helper"

describe Wireland::Pallette do
  it "should be able to read a palette in" do
    palette = Wireland::Pallette.new("rsrc/wireland.pal")
    palette = Wireland::Pallette.new("rsrc/wireland-alt.pal")
  end
end
