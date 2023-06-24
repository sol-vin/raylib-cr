require "./miniaudiohelpers"

puts %Q[
# MINIAUDIO DUMMY STRUCTS
struct MADataConverter
  data : StaticArray(UInt8, #{MiniAudioHelpers.ma_data_converter_size})
end

struct MAContext
  data : StaticArray(UInt8, #{MiniAudioHelpers.ma_context_size})
end

struct MADevice
  data : StaticArray(UInt8, #{MiniAudioHelpers.ma_device_size})
end

struct MAMutex
  data : StaticArray(UInt8, #{MiniAudioHelpers.ma_mutex_size})
end

# END DUMMY
].gsub("\r\n", "\n")
