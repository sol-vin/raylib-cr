require "spec"
require "raylib-cr"
require "../src/wireland/direction"
require "../src/wireland/circuit"
require "../src/wireland/component"
require "../src/wireland/components/**"
require "../src/wireland/colors"

alias R = Raylib
alias WC = Wireland::Component

R.set_trace_log_level R::TraceLogLevel::Fatal
