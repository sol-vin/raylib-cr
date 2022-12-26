require "./spec_helper"

describe Wireland::Circuit do
  it "should be able to read a file in" do
    circuit = Wireland::Circuit.new("rsrc/count-test.png")
    circuit.components.size.should eq 24
  end

  it "should be able to read a file in" do
    circuit = Wireland::Circuit.new("rsrc/count-test2.png")
    circuit.components.size.should eq 8
  end

  it "should be able to connect components" do
    circuit = Wireland::Circuit.new("rsrc/connect-test.png")

    if start = circuit.components.find { |c| c.is_a? WC::Start && c.xy.size == 4 }
      start.connects.all? do |w_c|
        (circuit[w_c].is_a? WC::Buffer && circuit[w_c].xy.size == 4)
      end.should be_true
    else
      # Fail
      true.should be_false
    end

    if buffer = circuit.components.find { |c| c.is_a? WC::Buffer && c.xy.size == 4 }
      buffer.connects.all? do |w_c|
          (circuit[w_c].is_a? WC::Wire && circuit[w_c].xy.size == 4) ||
          (circuit[w_c].is_a? WC::AltWire && circuit[w_c].xy.size == 8)
      end.should be_true
    else
      # Fail
      true.should be_false
    end

    if wire = circuit.components.find { |c| c.is_a? WC::Wire && c.xy.size == 4 }
      wire.connects.all? do |w_c|
        (circuit[w_c].is_a? WC::Buffer && circuit[w_c].xy.size == 4) ||
          (circuit[w_c].is_a? WC::Join && circuit[w_c].xy.size == 8)
      end.should be_true
    else
      # Fail
      true.should be_false
    end

    if altwire = circuit.components.find { |c| c.is_a? WC::AltWire && c.xy.size == 8 }
      altwire.connects.all? do |w_c|
        (circuit[w_c].is_a? WC::Buffer && circuit[w_c].xy.size == 4) ||
          (circuit[w_c].is_a? WC::Join && circuit[w_c].xy.size == 8)
      end.should be_true
    else
      # Fail
      true.should be_false
    end

    if join = circuit.components.find { |c| c.is_a? WC::Join && c.xy.size == 8 }
      join.connects.all? do |w_c|
        (circuit[w_c].is_a? WC::Wire && circuit[w_c].xy.size == 4) ||
          (circuit[w_c].is_a? WC::AltWire && circuit[w_c].xy.size == 8) ||
          (circuit[w_c].is_a? WC::Cross && circuit[w_c].xy.size == 1) ||
          (circuit[w_c].is_a? WC::NotIn && circuit[w_c].xy.size == 4)
      end.should be_true

      join.connects.size.should eq 5
    else
      # Fail
      true.should be_false
    end

    circuit.components.select(&.is_a? WC::Cross).size.should eq 4

    if not_in = circuit.components.find { |c| c.is_a? WC::NotIn && c.xy.size == 4 }
      not_in.connects.all? do |w_c|
        (circuit[w_c].is_a? WC::NotOut && circuit[w_c].xy.size == 4)
      end.should be_true

      not_in.connects.size.should eq 1
    else
      # Fail
      true.should be_false
    end

    if not_out = circuit.components.find { |c| c.is_a? WC::NotOut && c.xy.size == 4 }
      #not_out.connects.each {|i| puts "#{circuit[i].id} - #{circuit[i].class} -  #{circuit[i].connects}"}
      not_out.connects.all? do |w_c|
        (circuit[w_c].is_a? WC::NOPole && circuit[w_c].xy.size == 4) ||
          (circuit[w_c].is_a? WC::Switch && circuit[w_c].xy.size == 4)
      end.should be_true

      not_out.connects.size.should eq 2
    else
      # Fail
      true.should be_false
    end

    if switch = circuit.components.find { |c| c.is_a? WC::Switch && c.xy.size == 4 }.as WC::Switch
      switch.connects.all? do |w_c|
        (circuit[w_c].is_a? WC::Cross && circuit[w_c].xy.size == 1)
      end.should be_true

      switch.poles.size.should eq 2

      switch.connects.size.should eq 0
    else
      # Fail
      true.should be_false
    end

    circuit.components.select(&.is_a? Wireland::RelayPole).size.should eq 3

    circuit.components.any? { |c| c.is_a? WC::NOPole && c.xy.size == 4 && c.terminal? }.should be_true

    if no_pole = circuit.components.find { |c| c.is_a? WC::NOPole && c.xy.size == 4 && c.connects.size != 0 }
      no_pole.connects.all? do |w_c|
        (circuit[w_c].is_a? WC::DiodeIn && circuit[w_c].xy.size == 4) ||
          (circuit[w_c].is_a? WC::NCPole && circuit[w_c].xy.size == 4)
      end.should be_true

      no_pole.connects.size.should eq 2
    else
      # Fail
      true.should be_false
    end

    if diode_in = circuit.components.find { |c| c.is_a? WC::DiodeIn && c.xy.size == 4 }
      diode_in.connects.all? do |w_c|
        (circuit[w_c].is_a? WC::DiodeOut && circuit[w_c].xy.size == 4)
      end.should be_true

      diode_in.connects.size.should eq 1
    else
      # Fail
      true.should be_false
    end

    if diode_out = circuit.components.find { |c| c.is_a? WC::DiodeOut && c.xy.size == 4 }
      diode_out.terminal?.should be_true
    else
      # Fail
      true.should be_false
    end

    # Tunnel test

    # Find middle tunnel
    tunnel = circuit.components.find!(&.is_a?(WC::Tunnel))
    tunnel.xy.size.should eq 9
    tunnel.connects.size.should eq 10
  end

  it "should be able to run pulse-test" do
    circuit = Wireland::Circuit.new("rsrc/pulse-test.png")
    start = circuit.components.find!(&.is_a? WC::Start)
    buffer = circuit.components.find!(&.is_a? WC::Buffer).as(WC::Buffer)

    circuit.active_pulses[start.id]?.should be_truthy
    circuit.active_pulses[buffer.id]?.should be_falsey

    circuit.tick

    circuit.active_pulses[start.id]?.should be_falsey
    circuit.active_pulses[buffer.id]?.should be_truthy

    circuit.tick

    circuit.active_pulses[start.id]?.should be_falsey
    circuit.active_pulses[buffer.id]?.should be_falsey
  end

  it "should be able to run cross-test" do
    circuit = Wireland::Circuit.new("rsrc/cross-test.png")
    wire_start = circuit.components.find! {|c| c.is_a? WC::Start && c.connects.any? { |con| c.parent[con].is_a? WC::Wire }} 
    wire_end = circuit.components.find! {|c| c.is_a? WC::Buffer && c.connects.any? { |con| c.parent[con].is_a? WC::DiodeIn }} 
    altwire_start = circuit.components.find! {|c| c.is_a? WC::Start && c.connects.any? { |con| c.parent[con].is_a? WC::AltWire }} 
    altwire_end = circuit.components.find! {|c| c.is_a? WC::Buffer && c.connects.any? { |con| c.parent[con].is_a? WC::NotIn }}
  
    circuit.active_pulses[wire_start.id]?.should be_truthy
    circuit.active_pulses[wire_end.id]?.should be_falsey
    circuit.active_pulses[altwire_start.id]?.should be_truthy
    circuit.active_pulses[altwire_end.id]?.should be_falsey
  
    circuit.tick

    circuit.active_pulses[wire_start.id]?.should be_falsey
    circuit.active_pulses[wire_end.id]?.should be_truthy
    circuit.active_pulses[altwire_start.id]?.should be_falsey
    circuit.active_pulses[altwire_end.id]?.should be_truthy
  
    circuit.tick
  
    circuit.active_pulses[wire_start.id]?.should be_falsey
    circuit.active_pulses[wire_end.id]?.should be_falsey
    circuit.active_pulses[altwire_start.id]?.should be_falsey
    circuit.active_pulses[altwire_end.id]?.should be_falsey
  end

  it "should be able to run cross-test2" do
    circuit = Wireland::Circuit.new("rsrc/cross-test2.png")
    detector = circuit.components.find! {|c| c.is_a? WC::Buffer}

    circuit.active_pulses[detector.id]?.should be_falsey
    circuit.tick
    circuit.active_pulses[detector.id]?.should be_truthy
  end

  it "should be able to run tunnel-test" do
    circuit = Wireland::Circuit.new("rsrc/tunnel-test.png")
    starts = circuit.components.select(&.is_a? WC::Start)
    buffers = circuit.components.select(&.is_a? WC::Buffer)

    starts.each {|p| circuit.active_pulses[p.id]?.should be_truthy}
    buffers.each {|p| circuit.active_pulses[p.id]?.should be_falsey}
  
    circuit.tick

    starts.each {|p| circuit.active_pulses[p.id]?.should be_falsey}
    buffers.each {|p| circuit.active_pulses[p.id]?.should be_truthy}
  
    circuit.tick

    starts.each {|p| circuit.active_pulses[p.id]?.should be_falsey}
    buffers.each {|p| circuit.active_pulses[p.id]?.should be_falsey}
  end

  it "should be able to run buffer-test" do
    circuit = Wireland::Circuit.new("rsrc/buffer-test.png")
    buffer1 =  circuit.components.find! {|c| c.is_a? WC::Buffer && c.connects.size == 1}
    buffer2 =  circuit.components.find! {|c| c.is_a? WC::Buffer && c.connects.size == 0}


    circuit.active_pulses[buffer1.id]?.should be_falsey
    circuit.active_pulses[buffer2.id]?.should be_falsey

    circuit.tick

    circuit.active_pulses[buffer1.id]?.should be_truthy
    circuit.active_pulses[buffer2.id]?.should be_falsey
    
    circuit.tick

    circuit.active_pulses[buffer1.id]?.should be_falsey
    circuit.active_pulses[buffer2.id]?.should be_truthy

    circuit.tick

    circuit.active_pulses[buffer1.id]?.should be_falsey
    circuit.active_pulses[buffer2.id]?.should be_falsey
  end

  it "should be able to run buffer-test2" do
    circuit = Wireland::Circuit.new("rsrc/buffer-test2.png")
    buffer1 =  circuit.components.find! {|c| c.is_a? WC::Buffer && c.connects.any? {|c_id| circuit[c_id].is_a? WC::AltWire}}
    buffer2 =  circuit.components.find! {|c| c.is_a? WC::Buffer && c.connects.any? {|c_id| circuit[c_id].is_a? WC::Join}}
    buffer3 =  circuit.components.find! {|c| c.is_a? WC::Buffer && c.connects.any? {|c_id| circuit[c_id].is_a? WC::DiodeIn}}
    buffer4 =  circuit.components.find! {|c| c.is_a? WC::Buffer && c.connects.any? {|c_id| circuit[c_id].is_a? WC::NotIn}}
    buffer5 =  circuit.components.find! {|c| c.is_a? WC::Buffer && c.connects.any? {|c_id| circuit[c_id].is_a? WC::Switch}}

    circuit.active_pulses[buffer1.id]?.should be_falsey
    circuit.active_pulses[buffer2.id]?.should be_falsey
    circuit.active_pulses[buffer3.id]?.should be_falsey
    circuit.active_pulses[buffer4.id]?.should be_falsey
    circuit.active_pulses[buffer5.id]?.should be_falsey
    
    circuit.tick

    circuit.active_pulses[buffer1.id]?.should be_falsey
    circuit.active_pulses[buffer2.id]?.should be_falsey
    circuit.active_pulses[buffer3.id]?.should be_falsey
    circuit.active_pulses[buffer4.id]?.should be_falsey
    circuit.active_pulses[buffer5.id]?.should be_falsey

    circuit.tick

    circuit.active_pulses[buffer1.id]?.should be_truthy
    circuit.active_pulses[buffer2.id]?.should be_falsey
    circuit.active_pulses[buffer3.id]?.should be_falsey
    circuit.active_pulses[buffer4.id]?.should be_falsey
    circuit.active_pulses[buffer5.id]?.should be_falsey

    circuit.tick

    circuit.active_pulses[buffer1.id]?.should be_falsey
    circuit.active_pulses[buffer2.id]?.should be_truthy
    circuit.active_pulses[buffer3.id]?.should be_falsey
    circuit.active_pulses[buffer4.id]?.should be_falsey
    circuit.active_pulses[buffer5.id]?.should be_falsey

    circuit.tick

    circuit.active_pulses[buffer1.id]?.should be_falsey
    circuit.active_pulses[buffer2.id]?.should be_falsey
    circuit.active_pulses[buffer3.id]?.should be_truthy
    circuit.active_pulses[buffer4.id]?.should be_falsey
    circuit.active_pulses[buffer5.id]?.should be_falsey

    circuit.tick

    circuit.active_pulses[buffer1.id]?.should be_falsey
    circuit.active_pulses[buffer2.id]?.should be_falsey
    circuit.active_pulses[buffer3.id]?.should be_falsey
    circuit.active_pulses[buffer4.id]?.should be_truthy
    circuit.active_pulses[buffer5.id]?.should be_falsey

    circuit.tick

    circuit.active_pulses[buffer1.id]?.should be_falsey
    circuit.active_pulses[buffer2.id]?.should be_falsey
    circuit.active_pulses[buffer3.id]?.should be_falsey
    circuit.active_pulses[buffer4.id]?.should be_falsey
    circuit.active_pulses[buffer5.id]?.should be_falsey

    185.times {circuit.active_pulses[buffer5.id]?.should be_falsey; circuit.tick}
    circuit.active_pulses[buffer5.id]?.should be_truthy
  end

  it "should be able to run notout-test" do
    circuit = Wireland::Circuit.new("rsrc/notout-test.png")
    detector =  circuit.components.find! {|c| c.is_a? WC::Buffer}

    circuit.active_pulses[detector.id]?.should be_falsey

    circuit.tick

    circuit.active_pulses[detector.id]?.should be_truthy

    circuit.tick

    circuit.active_pulses[detector.id]?.should be_truthy

    circuit.tick

    circuit.active_pulses[detector.id]?.should be_truthy

    circuit.tick

    circuit.active_pulses[detector.id]?.should be_truthy
  end

  it "should be able to run relay-test" do
    circuit = Wireland::Circuit.new("rsrc/relay-test.png")
    detector_no =  circuit.components.find! {|c| c.is_a? WC::Buffer && c.connects.any? {|c_id| circuit[c_id].is_a? WC::NotIn}}
    detector_nc =  circuit.components.find! {|c| c.is_a? WC::Buffer && c.connects.any? {|c_id| circuit[c_id].is_a? WC::DiodeIn}}

    circuit.active_pulses[detector_no.id]?.should be_falsey
    circuit.active_pulses[detector_nc.id]?.should be_falsey

    circuit.tick

    circuit.active_pulses[detector_no.id]?.should be_falsey
    circuit.active_pulses[detector_nc.id]?.should be_truthy

    circuit.tick

    circuit.active_pulses[detector_no.id]?.should be_truthy
    circuit.active_pulses[detector_nc.id]?.should be_falsey

    circuit.tick

    circuit.active_pulses[detector_no.id]?.should be_truthy
    circuit.active_pulses[detector_nc.id]?.should be_falsey

    circuit.tick

    circuit.active_pulses[detector_no.id]?.should be_truthy
    circuit.active_pulses[detector_nc.id]?.should be_falsey
  end
  
  it "should be able to run xor-test" do
    circuit = Wireland::Circuit.new("rsrc/xor-test.png")
    detector_00 =  circuit.components.find! {|c| c.is_a? WC::Buffer && c.connects.any? {|c_id| circuit[c_id].is_a? WC::NOPole}}
    detector_01 =  circuit.components.find! {|c| c.is_a? WC::Buffer && c.connects.any? {|c_id| circuit[c_id].is_a? WC::NCPole}}
    detector_10 =  circuit.components.find! {|c| c.is_a? WC::Buffer && c.connects.any? {|c_id| circuit[c_id].is_a? WC::NotIn}}
    detector_11 =  circuit.components.find! {|c| c.is_a? WC::Buffer && c.connects.any? {|c_id| circuit[c_id].is_a? WC::DiodeIn}}

    circuit.active_pulses[detector_00.id]?.should be_falsey
    circuit.active_pulses[detector_01.id]?.should be_falsey
    circuit.active_pulses[detector_10.id]?.should be_falsey
    circuit.active_pulses[detector_11.id]?.should be_falsey

    circuit.tick
    circuit.tick
    circuit.tick

    circuit.active_pulses[detector_00.id]?.should be_falsey
    circuit.active_pulses[detector_01.id]?.should be_truthy
    circuit.active_pulses[detector_10.id]?.should be_truthy
    circuit.active_pulses[detector_11.id]?.should be_falsey
  end

  it "should be able to run not-test" do
    circuit = Wireland::Circuit.new("rsrc/not-test.png")
    detector =  circuit.components.find! {|c| c.is_a? WC::Buffer}
    not =  circuit.components.find! {|c| c.is_a? WC::NotOut}

    circuit.active_pulses[detector.id]?.should be_falsey
    circuit.active_pulses[not.id]?.should be_truthy
    
    10.times do 
      circuit.tick
      circuit.active_pulses[detector.id]?.should be_truthy
      circuit.active_pulses[not.id]?.should be_falsey
      circuit.tick
      circuit.active_pulses[detector.id]?.should be_falsey
      circuit.active_pulses[not.id]?.should be_truthy
    end
  end

  it "should be able to run complex-test" do
    circuit = Wireland::Circuit.new("rsrc/complex-test.png")
    detectors =  circuit.components.select {|c| c.is_a? WC::Buffer && c.connects.any? {|c_id| circuit[c_id].is_a? WC::NotIn }}.sort {|a,b| a.xy[0][:x] <=> b.xy[0][:x] }

    detectors.each {|d| circuit.active_pulses[d.id]?.should be_falsey}
    7.times do
      circuit.tick
      circuit.active_pulses[detectors[circuit.ticks-1].id]?.should be_truthy
      (detectors-[detectors[circuit.ticks-1]]).each {|d| circuit.active_pulses[d.id]?.should be_falsey}
    end
    circuit.tick
    detectors.each {|d| circuit.active_pulses[d.id]?.should be_truthy}
    circuit.tick
    detectors.each {|d| circuit.active_pulses[d.id]?.should be_falsey}
  end

  it "should be able to run srlatch-test" do
    circuit = Wireland::Circuit.new("rsrc/srlatch-test.png")
    detector =  circuit.components.find! {|c| c.is_a? WC::Buffer && c.connects.any? {|c_id| circuit[c_id].is_a? WC::NotIn}}
    pole = circuit.components.find! {|c| c.is_a? WC::NCPole}
    circuit.active_pulses[detector.id]?.should be_falsey
    pole.conductive?.should be_true
    circuit.tick
    circuit.tick
    circuit.tick
    circuit.tick
    circuit.active_pulses[detector.id]?.should be_truthy
    circuit.tick
    circuit.active_pulses[detector.id]?.should be_truthy
    pole.conductive?.should be_false
    circuit.tick
    circuit.active_pulses[detector.id]?.should be_falsey
    circuit.tick
    pole.conductive?.should be_true
    circuit.active_pulses[detector.id]?.should be_truthy
    circuit.tick
    circuit.active_pulses[detector.id]?.should be_truthy
    pole.conductive?.should be_false
    circuit.tick
    circuit.active_pulses[detector.id]?.should be_falsey
    circuit.tick
    pole.conductive?.should be_true
    circuit.active_pulses[detector.id]?.should be_truthy
    circuit.tick
    circuit.active_pulses[detector.id]?.should be_truthy
    pole.conductive?.should be_false
    circuit.tick
    circuit.active_pulses[detector.id]?.should be_falsey
  end

  it "should be able to run pole-test" do
    circuit = Wireland::Circuit.new("rsrc/pole-test.png")
    detector =  circuit.components.find! {|c| c.is_a? WC::Buffer}
    circuit.active_pulses[detector.id]?.should be_falsey
    circuit.tick
    circuit.active_pulses[detector.id]?.should be_falsey
    circuit.tick # Extra tick to make sure the switches turn on for the NOPole
    circuit.active_pulses[detector.id]?.should be_truthy
  end

  it "should be able to run tunnel-test2" do
    circuit = Wireland::Circuit.new("rsrc/tunnel-test2.png")
    detector =  circuit.components.find! {|c| c.is_a? WC::Buffer && c.connects.any? {|c_id| circuit[c_id].is_a? WC::NotIn} }

    circuit.active_pulses[detector.id]?.should be_falsey

    circuit.tick

    circuit.active_pulses[detector.id]?.should be_truthy

    circuit.tick

    circuit.active_pulses[detector.id]?.should be_falsey
  end

  it "should be able to run tick-elongator" do
    circuit = Wireland::Circuit.new("rsrc/tick-elongator.png")
    detector =  circuit.components.find! {|c| c.is_a? WC::Buffer && c.connects.any? {|c_id| circuit[c_id].is_a? WC::NotIn} }

    circuit.active_pulses[detector.id]?.should be_falsey
    
    169.times do
      circuit.tick

      circuit.active_pulses[detector.id]?.should be_truthy
    end
    circuit.tick

    circuit.active_pulses[detector.id]?.should be_falsey
  end

  
  it "should be able to run tick-elongator-safe" do
    circuit = Wireland::Circuit.new("rsrc/tick-elongator-safe.png")
    detector =  circuit.components.find! {|c| c.is_a? WC::Buffer && c.connects.any? {|c_id| circuit[c_id].is_a? WC::NotIn} }

    100.times do
      circuit.active_pulses[detector.id]?.should be_falsey

      21.times do
        circuit.tick

        circuit.active_pulses[detector.id]?.should be_truthy
      end
      circuit.tick
    end
  end

  it "should be able to run cross-test3" do
    circuit = Wireland::Circuit.new("rsrc/cross-test3.png")
    detector =  circuit.components.find! {|c| c.is_a? WC::Buffer}

    circuit.active_pulses[detector.id]?.should be_falsey

    circuit.tick

    circuit.active_pulses[detector.id]?.should be_truthy

    circuit.tick

    circuit.active_pulses[detector.id]?.should be_falsey
  end

  it "should be able to run io-test" do
    circuit = Wireland::Circuit.new("rsrc/io-test.png")
    i_t_on = circuit.components.find!{|c| c.is_a?(WC::InputToggleOn)}.as(WC::InputToggleOn)
    i_t_on_out_on = circuit.components.find!{|c| c.is_a?(WC::OutputOn) && c.xy.size == 9}.as(WC::OutputOn)
    i_t_on_out_off = circuit.components.find!{|c| c.is_a?(WC::OutputOff) && c.xy.size == 9}.as(WC::OutputOff)

    i_t_off = circuit.components.find!{|c| c.is_a?(WC::InputToggleOff)}.as(WC::InputToggleOff)
    i_t_off_out_on = circuit.components.find!{|c| c.is_a?(WC::OutputOn) && c.xy.size == 8}.as(WC::OutputOn)
    i_t_off_out_off = circuit.components.find!{|c| c.is_a?(WC::OutputOff) && c.xy.size == 8}.as(WC::OutputOff)

    i_on = circuit.components.find!{|c| c.is_a?(WC::InputOn)}.as(WC::InputOn)
    i_on_out_on = circuit.components.find!{|c| c.is_a?(WC::OutputOn) && c.xy.size == 7}.as(WC::OutputOn)
    i_on_out_off = circuit.components.find!{|c| c.is_a?(WC::OutputOff) && c.xy.size == 7}.as(WC::OutputOff)

    i_off = circuit.components.find!{|c| c.is_a?(WC::InputOff)}.as(WC::InputOff)
    i_off_out_on = circuit.components.find!{|c| c.is_a?(WC::OutputOn) && c.xy.size == 6}.as(WC::OutputOn)
    i_off_out_off = circuit.components.find!{|c| c.is_a?(WC::OutputOff) && c.xy.size == 6}.as(WC::OutputOff)

    i_t_on.on?.should be_true
    circuit.active_pulses[i_t_on.id]?.should be_truthy
    i_t_off.on?.should be_false
    i_on.on?.should be_false
    circuit.active_pulses[i_on.id]?.should be_truthy
    i_off.on?.should be_false

    circuit.tick

    i_t_on.on?.should be_true
    circuit.active_pulses[i_t_on.id]?.should be_truthy
    i_t_off.on?.should be_false
    i_on.on?.should be_false
    circuit.active_pulses[i_on.id]?.should be_falsey
    i_off.on?.should be_false

    circuit.tick

    i_t_on.on?.should be_true
    circuit.active_pulses[i_t_on.id]?.should be_truthy
    i_t_off.on?.should be_false
    i_on.on?.should be_false
    circuit.active_pulses[i_on.id]?.should be_falsey
    i_off.on?.should be_false

    i_on.on
    i_off.on

    circuit.tick
    circuit.active_pulses[i_on.id]?.should be_truthy
    circuit.active_pulses[i_off.id]?.should be_truthy

    circuit.tick
    circuit.active_pulses[i_on.id]?.should be_falsey
    circuit.active_pulses[i_off.id]?.should be_falsey

    i_t_on.off
    circuit.tick
    circuit.active_pulses[i_t_on.id]?.should be_falsey

    circuit.tick
    circuit.active_pulses[i_t_on.id]?.should be_falsey

    i_t_on.on

    circuit.tick
    circuit.active_pulses[i_t_on.id]?.should be_truthy

    i_t_on_out_on.on?.should be_false
    i_t_on_out_off.on?.should be_false


    circuit.tick
    circuit.active_pulses[i_t_on.id]?.should be_truthy
    i_t_on_out_on.on?.should be_true
    i_t_on_out_off.on?.should be_true
  end
end
