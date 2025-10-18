#!/usr/bin/env crystal

# This script runs at compile-time to generate Crystal struct definitions
# with platform-specific sizes for miniaudio structs.
#
# The problem: Raylib embeds miniaudio structs by value, but they're opaque.
# Crystal's FFI needs to know struct sizes at compile time.
#
# The solution: Compile and run a tiny C program at Crystal compile-time
# to query sizeof() for these platform-specific opaque types.
# NO C LIBRARY LINKING REQUIRED - just compile-time detection!

def get_miniaudio_sizes
  # Path to the size-check C program
  c_file = "#{__DIR__}/../../../rsrc/miniaudiohelpers/miniaudio-size-check.c"

  # Compile and run it, using a PID-specific temp file to avoid conflicts
  compile_cmd = "gcc -o /tmp/ma_check_$$ #{c_file} 2>/dev/null && /tmp/ma_check_$$ && rm -f /tmp/ma_check_$$"

  result = `sh -c '#{compile_cmd}'`.strip
  lines = result.split("\n")

  # Parse the output: "key: value" format
  sizes = {} of String => Int32
  lines.each do |line|
    parts = line.split(":")
    next unless parts.size == 2
    key = parts[0].strip
    value = parts[1].strip.to_i
    sizes[key] = value
  end

  sizes
rescue ex
  # Fallback to conservative sizes if compilation fails
  # This ensures builds don't break on unusual platforms
  STDERR.puts "Warning: Could not detect miniaudio struct sizes, using defaults"
  {
    "ma_data_converter" => 4096,
    "ma_context"        => 8192,
    "ma_device"         => 8192,
    "ma_mutex"          => 256,
  }
end

sizes = get_miniaudio_sizes

# Output Crystal code that will be inserted via {{ run }}
puts %Q[
# MINIAUDIO DUMMY STRUCTS
# Auto-generated at compile-time with platform-specific sizes
# Linux x64: ma_data_converter=312, ma_context=1016, ma_device=3776, ma_mutex=40
# Windows/Mac: Detected automatically during compilation
struct MADataConverter
  data : StaticArray(UInt8, #{sizes["ma_data_converter"]})
end

struct MAContext
  data : StaticArray(UInt8, #{sizes["ma_context"]})
end

struct MADevice
  data : StaticArray(UInt8, #{sizes["ma_device"]})
end

struct MAMutex
  data : StaticArray(UInt8, #{sizes["ma_mutex"]})
end
# END DUMMY
].gsub("\r\n", "\n")
