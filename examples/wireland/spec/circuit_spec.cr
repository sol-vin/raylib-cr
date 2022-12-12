require "./spec_helper"

describe Wireland::Circuit do
  it "should be able to read a file in" do
    circuit = Wireland::Circuit.new("rsrc/count-test.png")
    circuit.components.size.should eq 27
  end

  it "should be able to read a file in" do
    circuit = Wireland::Circuit.new("rsrc/count-test2.png")
    circuit.components.size.should eq 8
  end

  it "should be able to connect components" do
    circuit = Wireland::Circuit.new("rsrc/connect-test.png")

    if start = circuit.components.find { |c| c.is_a? WC::Start && c.xy.size == 4 }
      start.connects.all? do |w_c|
        (circuit[w_c].is_a? WC::Pause && circuit[w_c].xy.size == 4)
      end.should be_true
    else
      # Fail
      true.should be_false
    end

    if pause = circuit.components.find { |c| c.is_a? WC::Pause && c.xy.size == 4 }
      pause.connects.all? do |w_c|
        (circuit[w_c].is_a? WC::Start && circuit[w_c].xy.size == 4) ||
          (circuit[w_c].is_a? WC::Wire && circuit[w_c].xy.size == 4) ||
          (circuit[w_c].is_a? WC::AltWire && circuit[w_c].xy.size == 8)
      end.should be_true
    else
      # Fail
      true.should be_false
    end

    if wire = circuit.components.find { |c| c.is_a? WC::Wire && c.xy.size == 4 }
      wire.connects.all? do |w_c|
        (circuit[w_c].is_a? WC::Pause && circuit[w_c].xy.size == 4) ||
          (circuit[w_c].is_a? WC::Join && circuit[w_c].xy.size == 8)
      end.should be_true
    else
      # Fail
      true.should be_false
    end

    if altwire = circuit.components.find { |c| c.is_a? WC::AltWire && c.xy.size == 8 }
      altwire.connects.all? do |w_c|
        (circuit[w_c].is_a? WC::Pause && circuit[w_c].xy.size == 4) ||
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
      not_out.connects.all? do |w_c|
        (circuit[w_c].is_a? WC::RelayNOPole && circuit[w_c].xy.size == 4) ||
          (circuit[w_c].is_a? WC::RelaySwitch && circuit[w_c].xy.size == 4)
      end.should be_true

      not_out.connects.size.should eq 2
    else
      # Fail
      true.should be_false
    end

    if switch = circuit.components.find { |c| c.is_a? WC::RelaySwitch && c.xy.size == 4 }.as WC::RelaySwitch
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

    circuit.components.any? { |c| c.is_a? WC::RelayNOPole && c.xy.size == 4 && c.terminal? }.should be_true

    if no_pole = circuit.components.find { |c| c.is_a? WC::RelayNOPole && c.xy.size == 4 && c.connects.size != 0 }
      no_pole.connects.all? do |w_c|
        (circuit[w_c].is_a? WC::DiodeIn && circuit[w_c].xy.size == 4) ||
          (circuit[w_c].is_a? WC::RelayNCPole && circuit[w_c].xy.size == 4)
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
    m_t = circuit.components.select { |t| t.is_a?(WC::Tunnel) }.map(&.as(WC::Tunnel)).find do |t|
      t.connect_directions.size == 1 && t.connect_directions.keys[0] == Wireland::Direction::All
    end

    m_t.should be_truthy

    if middle_tunnel = m_t
      middle_tunnel.connect_directions.size.should eq 1
      middle_tunnel.tunnel_directions.size.should eq 4

      corner_tunnels = circuit.components.select { |c| c.is_a? WC::Tunnel }.map(&.as(WC::Tunnel)).select { |t| t.tunnel_directions.size == 2 }
      corner_tunnels.size.should eq 4
      corner_tunnels.each { |t| t.connects.size.should eq 2; t.connect_directions.size.should eq 2 }

      side_tunnels = circuit.components.select { |c| c.is_a? WC::Tunnel }.map(&.as(WC::Tunnel)).select { |t| t.tunnel_directions.size == 3 }
      side_tunnels.size.should eq 4
      side_tunnels.each { |t| t.connects.size.should eq 2; t.connect_directions.size.should eq 2 }
    end
  end

  it "should be able to run pulse-test" do
    circuit = Wireland::Circuit.new("rsrc/pulse-test.png")
    start = circuit.components.find!(&.is_a? WC::Start)
    pause = circuit.components.find!(&.is_a? WC::Pause).as(WC::Pause)

    circuit.active_pulses[start.id]?.should be_falsey
    circuit.active_pulses[pause.id]?.should be_falsey

    circuit.tick

    circuit.active_pulses[start.id]?.should be_truthy
    circuit.active_pulses[pause.id]?.should be_falsey

    circuit.tick

    circuit.active_pulses[start.id]?.should be_falsey
    circuit.active_pulses[pause.id]?.should be_truthy

    circuit.tick

    circuit.active_pulses[start.id]?.should be_falsey
    circuit.active_pulses[pause.id]?.should be_falsey
  end
end
