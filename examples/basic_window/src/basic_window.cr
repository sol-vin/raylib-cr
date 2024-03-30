require "./basic_window/app"

module BasicWindow
  VERSION = {{ `shards version #{__DIR__}`.strip.stringify }}

  basic_window = App.new(name: "Basic Window")
  basic_window.run!
end
