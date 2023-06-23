@[Link("raylib")]
lib RAudio
  alias AudioCallback = Proc(Void*, LibC::UInt)

  # MINIAUDIO DUMMY STRUCTS
  struct MADataConverter
    data : StaticArray(UInt8, 312)
  end

  struct MAContext
    data : StaticArray(UInt8, 664)
  end

  struct MADevice
    data : StaticArray(UInt8, 3208)
  end

  struct MAMutex
    data : StaticArray(UInt8, 8)
  end
  # END DUMMY

  struct Wave
    frame_count : LibC::UInt
    sample_rate : LibC::UInt
    sample_size : LibC::UInt
    channels : LibC::UInt
    data : Void*
  end

  struct AudioBuffer
    converter : MADataConverter
    callback : AudioCallback
    processor : AudioProcessor*

    volume : LibC::Float
    pitch : LibC::Float
    pan : LibC::Float

    bool : Bool
    paused : Bool
    looping : Bool
    usage : LibC::Int

    is_subbuffer_processed : StaticArray(Bool, 2)
    size_in_frames : LibC::UInt
    frame_cursor_pos : LibC::UInt
    frames_processed : LibC::UInt

    data : LibC::UChar*

    next : AudioBuffer*
    prev : AudioBuffer*
  end

  struct AudioProcessor
    process : AudioCallback
    next : AudioProcessor*
    prev : AudioProcessor*
  end

  struct AudioDataSystem
    context : MAContext
    device : MADevice
    lock : MAMutex
    is_ready : Bool
    pcm_buffer_size : UInt64 # TODO: Fix foe 32 bit, should be a `size_t`
    pcm_buffer : Void*
  end

  struct AudioDataBuffer
    first : AudioBuffer*
    last : AudioBuffer*
    default_size : LibC::Int
  end

  struct AudioDataMultiChannel
    pool_counter : LibC::UInt
    pool : StaticArray(AudioBuffer, 16)
    channels : StaticArray(LibC::UInt, 16)
  end

  struct AudioData
    system : AudioDataSystem
    buffer : AudioDataBuffer
    multi_channel : AudioDataMultiChannel
  end

  struct AudioStream
    audio_buffer : AudioBuffer*
    audio_processor : AudioProcessor*
    sample_rate : LibC::UInt
    sample_size : LibC::UInt
    channels : LibC::UInt
  end

  struct Sound
    stream : AudioStream
    frame_count : LibC::UInt
  end

  struct Music
    stream : AudioStream
    frame_count : LibC::UInt
    looping : Bool

    ctx_type : LibC::Int
    ctx_data : Void*
  end

  fun init_audio_device = InitAudioDevice
  fun close_audio_device = CloseAudioDevice
  fun audio_device_ready? = IsAudioDeviceReady : Bool
  fun set_master_volume = SetMasterVolume(volume : LibC::Float)
  fun load_wave = LoadWave(file_name : LibC::Char*) : Wave
  fun wave_ready? = IsWaveReady(wave : Wave) : Bool
  fun load_wave_from_memory = LoadWaveFromMemory(file_type : LibC::Char*, file_data : LibC::UChar*, data_size : LibC::Int) : Wave
  fun load_sound = LoadSound(file_name : LibC::Char*) : Sound
  fun load_sound_from_wave = LoadSoundFromWave(wave : Wave) : Sound
  fun sound_ready? = IsSoundReady(sound : Sound) : Bool
  fun update_sound = UpdateSound(sound : Sound, data : Void*, sample_count : LibC::Int)
  fun unload_wave = UnloadWave(wave : Wave)
  fun unload_sound = UnloadSound(sound : Sound)
  fun export_wave? = ExportWave(wave : Wave, file_name : LibC::Char*) : Bool
  fun export_wave_as_code? = ExportWaveAsCode(wave : Wave, file_name : LibC::Char*) : Bool
  fun play_sound = PlaySound(sound : Sound)
  fun stop_sound = StopSound(sound : Sound)
  fun pause_sound = PauseSound(sound : Sound)
  fun resume_sound = ResumeSound(sound : Sound)
  fun sound_playing? = IsSoundPlaying(sound : Sound) : Bool
  fun set_sound_volume = SetSoundVolume(sound : Sound, volume : LibC::Float)
  fun set_sound_pitch = SetSoundPitch(sound : Sound, pitch : LibC::Float)
  fun set_sound_pan = SetSoundPan(sound : Sound, pan : LibC::Float)
  fun wave_copy = WaveCopy(wave : Wave) : Wave
  fun wave_crop = WaveCrop(wave : Wave*, init_sample : LibC::Int, final_sample : LibC::Int)
  fun wave_format = WaveFormat(wave : Wave*, sample_rate : LibC::Int, sample_size : LibC::Int, channels : LibC::Int)
  fun load_wave_samples = LoadWaveSamples(wave : Wave) : LibC::Float*
  fun unload_wave_samples = UnloadWaveSamples(samples : LibC::Float*)
  fun load_music_stream = LoadMusicStream(file_name : LibC::Char*) : Music
  fun load_music_stream_from_memory = LoadMusicStreamFromMemory(file_type : LibC::Char*, data : LibC::UChar*, data_size : LibC::Int) : Music
  fun music_ready? = IsMusicReady(music : Music) : Bool
  fun unload_music_stream = UnloadMusicStream(music : Music)
  fun play_music_stream = PlayMusicStream(music : Music)
  fun music_stream_playing? = IsMusicStreamPlaying(music : Music) : Bool
  fun update_music_stream = UpdateMusicStream(music : Music)
  fun stop_music_stream = StopMusicStream(music : Music)
  fun pause_music_stream = PauseMusicStream(music : Music)
  fun resume_music_stream = ResumeMusicStream(music : Music)
  fun seek_music_stream = SeekMusicStream(music : Music, position : LibC::Float)
  fun set_music_volume = SetMusicVolume(music : Music, volume : LibC::Float)
  fun set_music_pitch = SetMusicPitch(music : Music, pitch : LibC::Float)
  fun set_music_pan = SetMusicPan(music : Music, pan : LibC::Float)
  fun get_music_time_length = GetMusicTimeLength(music : Music) : LibC::Float
  fun get_music_time_played = GetMusicTimePlayed(music : Music) : LibC::Float
  fun load_audio_stream = LoadAudioStream(sample_rate : LibC::UInt, sample_size : LibC::UInt, channels : LibC::UInt) : AudioStream
  fun audio_stream_ready? = IsAudioStreamReady(stream : AudioStream) : Bool
  fun unload_audio_stream = UnloadAudioStream(stream : AudioStream)
  fun update_audio_stream = UpdateAudioStream(stream : AudioStream, data : Void*, frame_count : LibC::Int)
  fun audio_stream_processed? = IsAudioStreamProcessed(stream : AudioStream) : Bool
  fun play_audio_stream = PlayAudioStream(stream : AudioStream)
  fun pause_audio_stream = PauseAudioStream(stream : AudioStream)
  fun resume_audio_stream = ResumeAudioStream(stream : AudioStream)
  fun audio_stream_playing? = IsAudioStreamPlaying(stream : AudioStream) : Bool
  fun stop_audio_stream = StopAudioStream(stream : AudioStream)
  fun set_audio_stream_volume = SetAudioStreamVolume(stream : AudioStream, volume : LibC::Float)
  fun set_audio_stream_pitch = SetAudioStreamPitch(stream : AudioStream, pitch : LibC::Float)
  fun set_audio_stream_pan = SetAudioStreamPan(stream : AudioStream, pan : LibC::Float)

  fun set_audio_stream_buffer_size_default = SetAudioStreamBufferSizeDefault(size : LibC::Int)

  fun set_audio_stream_callback = SetAudioStreamCallback(stream : AudioStream, callback : AudioCallback)
  fun attach_audio_stream_processor = AttachAudioStreamProcessor(stream : AudioStream, processor : AudioCallback)
  fun detach_audio_stream_processor = DetachAudioStreamProcessor(stream : AudioStream, processor : AudioCallback)
  fun attach_audio_mixed_processor = AttachAudioMixedProcessor(processor : AudioCallback)
  fun detach_audio_mixed_processor = DetachAudioMixedProcessor(processor : AudioCallback)
end
