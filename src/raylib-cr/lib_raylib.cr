require "./link"

link_flag

lib LibRaylib
  PI      =    3.141592653589793
  DEG2RAD = 0.017453292519943295
  RAD2DEG =    57.29577951308232

  alias Camera = Camera3D
  alias TextureCubemap = Texture2D

  enum ConfigFlags
    FlagVSyncHint         = 0x00000040
    FlagFullscreenMode    = 0x00000002
    FlagWindowResizable   = 0x00000004
    FlagWindowUndecorated = 0x00000008
    FlagWindowHidden      = 0x00000080
    FlagWindowMinimized   = 0x00000200
    FlagWindowMaximized   = 0x00000400
    FlagWindowUnfocused   = 0x00000800
    FlagWindowTopmost     = 0x00001000
    FlagWindowAlwaysRun   = 0x00000100
    FlagWindowTransparent = 0x00000010
    FlagWindowHighdpi     = 0x00002000
    FlagMsaa4xHint        = 0x00000020
    FlagInterlacedHint    = 0x00010000
  end

  enum TraceLogLevel
    LogAll     = 0
    LogTrace   = 1
    LogDebug   = 2
    LogInfo    = 3
    LogWarning = 4
    LogError   = 5
    LogFatal   = 6
  end

  enum KeyboardKey
    KeyNull         =   0
    KeyApostrophe   =  39
    KeyComma        =  44
    KeyMinus        =  45
    KeyPeriod       =  46
    KeySlash        =  47
    KeyZero         =  48
    KeyOne          =  49
    KeyTwo          =  50
    KeyThree        =  51
    KeyFour         =  52
    KeyFive         =  53
    KeySix          =  54
    KeySeven        =  55
    KeyEight        =  56
    KeyNine         =  57
    KeySemicolon    =  59
    KeyEqual        =  61
    KeyA            =  65
    KeyB            =  66
    KeyC            =  67
    KeyD            =  68
    KeyE            =  69
    KeyF            =  70
    KeyG            =  71
    KeyH            =  72
    KeyI            =  73
    KeyJ            =  74
    KeyK            =  75
    KeyL            =  76
    KeyM            =  77
    KeyN            =  78
    KeyO            =  79
    KeyP            =  80
    KeyQ            =  81
    KeyR            =  82
    KeyS            =  83
    KeyT            =  84
    KeyU            =  85
    KeyV            =  86
    KeyW            =  87
    KeyX            =  88
    KeyY            =  89
    KeyZ            =  90
    KeyLeftBracket  =  91
    KeyBackslash    =  92
    KeyRightBracket =  93
    KeyGrave        =  96
    KeySpace        =  32
    KeyEscape       = 256
    KeyEnter        = 257
    KeyTab          = 258
    KeyBackspace    = 259
    KeyInsert       = 260
    KeyDelete       = 261
    KeyRight        = 262
    KeyLeft         = 263
    KeyDown         = 264
    KeyUp           = 265
    KeyPageUp       = 266
    KeyPageDown     = 267
    KeyHome         = 268
    KeyEnd          = 269
    KeyCapsLock     = 280
    KeyScrollLock   = 281
    KeyNumLock      = 282
    KeyPrintScreen  = 283
    KeyPause        = 284
    KeyF1           = 290
    KeyF2           = 291
    KeyF3           = 292
    KeyF4           = 293
    KeyF5           = 294
    KeyF6           = 295
    KeyF7           = 296
    KeyF8           = 297
    KeyF9           = 298
    KeyF10          = 299
    KeyF11          = 300
    KeyF12          = 301
    KeyLeftShift    = 340
    KeyLeftControl  = 341
    KeyLeftAlt      = 342
    KeyLeftSuper    = 343
    KeyRightShift   = 344
    KeyRightControl = 345
    KeyRightAlt     = 346
    KeyRightSuper   = 347
    KeyKbMenu       = 348
    KeyKp0          = 320
    KeyKp1          = 321
    KeyKp2          = 322
    KeyKp3          = 323
    KeyKp4          = 324
    KeyKp5          = 325
    KeyKp6          = 326
    KeyKp7          = 327
    KeyKp8          = 328
    KeyKp9          = 329
    KeyKpDecimal    = 330
    KeyKpDivide     = 331
    KeyKpMultiply   = 332
    KeyKpSubtract   = 333
    KeyKpAdd        = 334
    KeyKpEnter      = 335
    KeyKpEqual      = 336
    KeyBack         =   4
    KeyMenu         =  82
    KeyVolumeUp     =  24
    KeyVolumeDown   =  25
  end

  enum MouseButton
    MouseButtonLeft    = 0
    MouseButtonRight   = 1
    MouseButtonMiddle  = 2
    MouseButtonSide    = 3
    MouseButtonExtra   = 4
    MouseButtonForward = 5
    MouseButtonBack    = 6
  end

  enum MouseCursor
    MouseCursorDefault      =  0
    MouseCursorArrow        =  1
    MouseCursorIbeam        =  2
    MouseCursorCrosshair    =  3
    MouseCursorPointingHand =  4
    MouseCursorResizeEw     =  5
    MouseCursorResizeNs     =  6
    MouseCursorResizeNwse   =  7
    MouseCursorResizeNesw   =  8
    MouseCursorResizeAll    =  9
    MouseCursorNotAllowed   = 10
  end

  enum GamepadButton
    GamepadButtonUnknown        =  0
    GamepadButtonLeftFaceUp     =  1
    GamepadButtonLeftFaceRight  =  2
    GamepadButtonLeftFaceDown   =  3
    GamepadButtonLeftFaceLeft   =  4
    GamepadButtonRightFaceUp    =  5
    GamepadButtonRightFaceRight =  6
    GamepadButtonRightFaceDown  =  7
    GamepadButtonRightFaceLeft  =  8
    GamepadButtonLeftTrigger1   =  9
    GamepadButtonLeftTrigger2   = 10
    GamepadButtonRightTrigger1  = 11
    GamepadButtonRightTrigger2  = 12
    GamepadButtonMiddleLeft     = 13
    GamepadButtonMiddle         = 14
    GamepadButtonMiddleRight    = 15
    GamepadButtonLeftThumb      = 16
    GamepadButtonRightThumb     = 17
  end

  enum GamepadAxis
    GamepadAxisLeftX        = 0
    GamepadAxisLeftY        = 1
    GamepadAxisRightX       = 2
    GamepadAxisRightY       = 3
    GamepadAxisLeftTrigger  = 4
    GamepadAxisRightTrigger = 5
  end

  enum MaterialMapIndex
    MaterialMapAlbedo     =  0
    MaterialMapMetalness  =  1
    MaterialMapNormal     =  2
    MaterialMapRoughness  =  3
    MaterialMapOcclusion  =  4
    MaterialMapEmission   =  5
    MaterialMapHeight     =  6
    MaterialMapCubemap    =  7
    MaterialMapIrradiance =  8
    MaterialMapPrefilter  =  9
    MaterialMapBrdf       = 10
  end

  enum ShaderLocationIndex
    ShaderLocVertexPosition   =  0
    ShaderLocVertexTexcoord01 =  1
    ShaderLocVertexTexcoord02 =  2
    ShaderLocVertexNormal     =  3
    ShaderLocVertexTangent    =  4
    ShaderLocVertexColor      =  5
    ShaderLocMatrixMvp        =  6
    ShaderLocMatrixView       =  7
    ShaderLocMatrixProjection =  8
    ShaderLocMatrixModel      =  9
    ShaderLocMatrixNormal     = 10
    ShaderLocVectorView       = 11
    ShaderLocColorDiffuse     = 12
    ShaderLocColorSpecular    = 13
    ShaderLocColorAmbient     = 14
    ShaderLocMapAlbedo        = 15
    ShaderLocMapMetalness     = 16
    ShaderLocMapNormal        = 17
    ShaderLocMapRoughness     = 18
    ShaderLocMapOcclusion     = 19
    ShaderLocMapEmission      = 20
    ShaderLocMapHeight        = 21
    ShaderLocMapCubemap       = 22
    ShaderLocMapIrradiance    = 23
    ShaderLocMapPrefilter     = 24
    ShaderLocMapBrdf          = 25
  end

  enum ShaderUniformDataType
    ShaderUniformFloat     = 0
    ShaderUniformVec2      = 1
    ShaderUniformVec3      = 2
    ShaderUniformVec4      = 3
    ShaderUniformInt       = 4
    ShaderUniformIvec2     = 5
    ShaderUniformIvec3     = 6
    ShaderUniformIvec4     = 7
    ShaderUniformSampler2d = 8
  end

  enum ShaderAttributeDataType
    ShaderAttribFloat = 0
    ShaderAttribVec2  = 1
    ShaderAttribVec3  = 2
    ShaderAttribVec4  = 3
  end

  enum PixelFormat
    PixelFormatUncompressedGrayscale    =  1
    PixelFormatUncompressedGrayAlpha    =  2
    PixelFormatUncompressedR5g6b5       =  3
    PixelFormatUncompressedR8g8b8       =  4
    PixelFormatUncompressedR5g5b5a1     =  5
    PixelFormatUncompressedR4g4b4a4     =  6
    PixelFormatUncompressedR8g8b8a8     =  7
    PixelFormatUncompressedR32          =  8
    PixelFormatUncompressedR32g32b32    =  9
    PixelFormatUncompressedR32g32b32a32 = 10
    PixelFormatCompressedDxt1Rgb        = 11
    PixelFormatCompressedDxt1Rgba       = 12
    PixelFormatCompressedDxt3Rgba       = 13
    PixelFormatCompressedDxt5Rgba       = 14
    PixelFormatCompressedEtc1Rgb        = 15
    PixelFormatCompressedEtc2Rgb        = 16
    PixelFormatCompressedEtc2EacRgba    = 17
    PixelFormatCompressedPvrtRgb        = 18
    PixelFormatCompressedPvrtRgba       = 19
    PixelFormatCompressedAstc4x4Rgba    = 20
  end

  enum TextureFilter
    TextureFilterPoint          = 0
    TextureFilterBilinear       = 1
    TextureFilterTrilinear      = 2
    TextureFilterAnisotropic4x  = 3
    TextureFilterAnisotropic8x  = 4
    TextureFilterAnisotropic16x = 5
  end

  enum TextureWrap
    TextureWrapRepeat       = 0
    TextureWrapClamp        = 1
    TextureWrapMirrorRepeat = 2
    TextureWrapMirrorClamp  = 3
  end

  enum CubemapLayout
    CubemapLayoutAutoDetect       = 0
    CubemapLayoutLineVertical     = 1
    CubemapLayoutLineHorizontal   = 2
    CubemapLayoutCrossThreeByFour = 3
    CubemapLayoutCrossFourByThree = 4
  end

  enum FontType
    FontDefault = 0
    FontBitmap  = 1
    FontSdf     = 2
  end

  enum BlendMode
    BlendAlpha          = 0
    BlendAdditive       = 1
    BlendMultiplied     = 2
    BlendAddColors      = 3
    BlendSubtractColors = 4
    BlendCustom         = 5
  end

  enum Gesture
    GestureNone       =   0
    GestureTap        =   1
    GestureDoubletap  =   2
    GestureHold       =   4
    GestureDrag       =   8
    GestureSwipeRight =  16
    GestureSwipeLeft  =  32
    GestureSwipeUp    =  64
    GestureSwipeDown  = 128
    GesturePinchIn    = 256
    GesturePinchOut   = 512
  end

  enum CameraMode
    CameraCustom      = 0
    CameraFree        = 1
    CameraOrbital     = 2
    CameraFirstPerson = 3
    CameraThirdPerson = 4
  end

  enum CameraProjection
    CameraPerspective  = 0
    CameraOrthographic = 1
  end

  enum NPatchLayout
    NpatchNinePatch            = 0
    NpatchThreePatchVertical   = 1
    NpatchThreePatchHorizontal = 2
  end

  LIGHTGRAY  = Color.new r: 200, g: 200, b: 200, a: 255
  GRAY       = Color.new r: 130, g: 130, b: 130, a: 255
  DARKGRAY   = Color.new r: 80, g: 80, b: 80, a: 255
  YELLOW     = Color.new r: 253, g: 249, b: 0, a: 255
  GOLD       = Color.new r: 255, g: 203, b: 0, a: 255
  ORANGE     = Color.new r: 255, g: 161, b: 0, a: 255
  PINK       = Color.new r: 255, g: 109, b: 194, a: 255
  RED        = Color.new r: 230, g: 41, b: 55, a: 255
  MAROON     = Color.new r: 190, g: 33, b: 55, a: 255
  GREEN      = Color.new r: 0, g: 228, b: 48, a: 255
  LIME       = Color.new r: 0, g: 158, b: 47, a: 255
  DARKGREEN  = Color.new r: 0, g: 117, b: 44, a: 255
  SKYBLUE    = Color.new r: 102, g: 191, b: 255, a: 255
  BLUE       = Color.new r: 0, g: 121, b: 241, a: 255
  DARKBLUE   = Color.new r: 0, g: 82, b: 172, a: 255
  PURPLE     = Color.new r: 200, g: 122, b: 255, a: 255
  VIOLET     = Color.new r: 135, g: 60, b: 190, a: 255
  DARKPURPLE = Color.new r: 112, g: 31, b: 126, a: 255
  BEIGE      = Color.new r: 211, g: 176, b: 131, a: 255
  BROWN      = Color.new r: 127, g: 106, b: 79, a: 255
  DARKBROWN  = Color.new r: 76, g: 63, b: 47, a: 255
  WHITE      = Color.new r: 255, g: 255, b: 255, a: 255
  BLACK      = Color.new r: 0, g: 0, b: 0, a: 255
  BLANK      = Color.new r: 0, g: 0, b: 0, a: 0
  MAGENTA    = Color.new r: 255, g: 0, b: 255, a: 255
  RAYWHITE   = Color.new r: 245, g: 245, b: 245, a: 255

  alias Texture = Texture2D
  alias Quaternion = Vector4

  struct Vector2
    x : Float32
    y : Float32
  end

  struct Vector3
    x : Float32
    y : Float32
    z : Float32
  end

  struct Vector4
    x : Float32
    y : Float32
    z : Float32
    w : Float32
  end

  struct Matrix
    m0 : Float32
    m4 : Float32
    m8 : Float32
    m12 : Float32
    m1 : Float32
    m5 : Float32
    m9 : Float32
    m13 : Float32
    m2 : Float32
    m6 : Float32
    m10 : Float32
    m14 : Float32
    m3 : Float32
    m7 : Float32
    m11 : Float32
    m15 : Float32
  end

  struct Color
    r : UInt8
    g : UInt8
    b : UInt8
    a : UInt8
  end

  struct Rectangle
    x : Float32
    y : Float32
    width : Float32
    height : Float32
  end

  struct Image
    data : Void*
    width : Int32
    height : Int32
    mipmaps : Int32
    format : Int32
  end

  struct Texture2D
    id : UInt32
    width : Int32
    height : Int32
    mipmaps : Int32
    format : Int32
  end

  struct RenderTexture2D
    id : UInt32
    texture : Texture2D
    depth : Texture2D
  end

  struct NPatchInfo
    source : Rectangle
    left : Int32
    top : Int32
    right : Int32
    bottom : Int32
    layout : Int32
  end

  struct GlyphInfo
    value : Int32
    offset_x : Int32
    offset_y : Int32
    advance_x : Int32
    image : Image
  end

  struct Font
    base_size : Int32
    glyph_count : Int32
    glyph_padding : Int32
    texture : Texture2D
    recs : Rectangle*
    glyphs : GlyphInfo*
  end

  struct Camera3D
    position : Vector3
    target : Vector3
    up : Vector3
    fovy : Float32
    projection : Int32
  end

  struct Camera2D
    offest : Vector2
    target : Vector2
    rotation : Float32
    zoom : Float32
  end

  struct Mesh
    vertex_count : Int32
    triangle_count : Int32

    vertices : Float32*
    texcoords : Float32*
    texcoords2 : Float32*
    normals : Float32*
    tangents : Float32*
    colors : UInt8*
    indices : UInt16*

    anim_vertices : Float32*
    anim_normal : Float32*
    bone_ids : UInt8*
    bone_weights : Float32*
    vaoId : UInt32
    vboId : Int32* # StaticArray(UInt32, 7)
  end

  struct Shader
    id : UInt32
    locs : Int32* # StaticArray(Int32, 32)
  end

  struct MaterialMap
    texture : Texture2D
    color : Color
    value : Float32
  end

  struct Material
    shader : Shader
    maps : MaterialMap               # StaticArray(MaterialMap, 12)
    params : StaticArray(Float32, 4) # Float32*
  end

  struct Transform
    translation : Vector3
    rotation : Vector4
    scale : Vector3
  end

  struct BoneInfo
    name : StaticArray(UInt8, 32)
    parent : Int32
  end

  struct Model
    transform : Matrix
    mesh_count : Int32
    material_count : Int32
    meshes : Mesh*
    mesh_material : Int32
    bone_count : Int32
    bones : BoneInfo*
    bind_pose : Transform*
  end

  struct ModelAnimation
    bone_count : Int32
    frame_count : Int32
    bones : BoneInfo*
    frame_poses : Transform**
  end

  struct Ray
    position : Vector3
    direction : Vector3
  end

  struct RayCollision
    hit : Bool
    distance : Float32
    point : Vector3
    normal : Vector3
  end

  struct BoundingBox
    min : Vector3
    max : Vector3
  end

  struct Wave
    frame_count : UInt32
    sample_rate : UInt32
    sample_size : UInt32
    channels : UInt32
    data : Void*
  end

  struct AudioBuffer
  end

  struct AudioStream
    audioBuffer : AudioBuffer*
    sample_rate : UInt32
    sample_size : UInt32
    channels : UInt32
  end

  struct Sound
    stream : AudioStream
    frame_count : UInt32
  end

  struct Music
    stream : AudioStream
    frame_count : Int32
    looping : Bool

    ctx_type : Int32
    ctx_data : Void*
  end

  struct VrDeviceInfo
    h_resolution : Int32
    v_resolution : Int32
    h_screenSize : Float32
    v_screenSize : Float32
    v_screenCenter : Float32
    eye_to_screen_distance : Float32
    lens_separation_distance : Float32
    interpupillary_distance : Float32
    lens_distortion_values : StaticArray(Float32, 4)
    chroma_ab_correction : StaticArray(Float32, 4)
  end

  struct VrStereoConfig
    projection : StaticArray(Matrix, 2)
    view_offset : StaticArray(Matrix, 2)
    left_lens_center : StaticArray(Float32, 2)
    right_lens_center : StaticArray(Float32, 2)
    left_screen_center : StaticArray(Float32, 2)
    right_screen_center : StaticArray(Float32, 2)
    scale : StaticArray(Float32, 2)
    scale_in : StaticArray(Float32, 2)
  end

  fun init_window = InitWindow(width : Int32, height : Int32, title : UInt8*)
  fun close_window? = WindowShouldClose : Bool
  fun close_window = CloseWindow
  fun window_ready? = IsWindowReady : Bool
  fun window_minimized? = IsWindowMinimized : Bool
  fun window_maximized? = IsWindowMaximized : Bool
  fun window_focused? = IsWindowFocused : Bool
  fun window_resized? = IsWindowResized : Bool
  fun window_state? = IsWindowState(flag : UInt32) : Bool
  fun set_window_state = SetWindowState(flag : UInt32)
  fun clear_window_state = ClearWindowState(flag : UInt32)
  fun toggle_fullscreen = ToggleFullscreen
  fun maximize_window = MaximizeWindow
  fun minimize_window = MinimizeWindow
  fun restore_window = RestoreWindow
  fun set_window_icon = SetWindowIcon(image : Image)
  fun set_window_title = SetWindowTitle(title : UInt8*)
  fun set_window_position = SetWindowPosition(x : Int32, y : Int32)
  fun set_window_monitor = SetWindowMonitor(monitor : Int32)
  fun set_window_min_size = SetWindowMinSize(width : Int32, height : Int32)
  fun set_window_size = SetWindowSize(width : Int32, height : Int32)
  fun get_window_handle = GetWindowHandle : Void*
  fun get_screen_width = GetScreenWidth : Int32
  fun set_window_height = GetScreenHeight : Int32
  fun get_monitor_count = GetMonitorCount : Int32
  fun get_current_monitor = GetCurrentMonitor : Int32
  fun get_monitor_position = GetMonitorPosition(monitor : Int32) : Vector2
  fun get_monitor_width = GetMonitorWidth(monitor : Int32) : Int32
  fun get_monitor_height = GetMonitorHeight(monitor : Int32) : Int32
  fun get_monitor_physical_width = GetMonitorPhysicalWidth(monitor : Int32) : Int32
  fun get_monitor_physical_height = GetMonitorPhysicalHeight(monitor : Int32) : Int32
  fun get_monitor_refresh_rate = GetMonitorPhysicalHeight(monitor : Int32) : Int32
  fun get_window_position = GetWindowPosition : Vector2
  fun get_window_scale_dpi = GetWindowScaleDPI : Vector2
  fun get_monitor_name = GetMonitorName(monitor : Int32) : Char*
  fun set_clipboard_text = SetClipboardText(text : UInt8*)
  fun get_clipboard_text = GetClipboardText : Char*

  fun swap_screen_buffer = SwapScreenBuffer
  fun poll_input_events = PollInputEvents
  fun wait_time = WaitTime(ms : Float32)

  fun show_cursor = ShowCursor
  fun hide_cursor = HideCursor
  fun cursor_hidden? = IsCursorHidden : Bool
  fun enable_cursor = EnableCursor
  fun disable_cursor = DisableCursor
  fun cursor_on_screen? = IsCursorOnScreen

  fun clear_background = ClearBackground(color : Color)
  fun begin_drawing = BeginDrawing
  fun end_drawing = EndDrawing
  fun begin_mode_2d = BeginMode2D(camera : Camera2D)
  fun end_mode_2d = EndMode2D
  fun begin_mode_3d = BeginMode3D(camera : Camera3D)
  fun end_mode_3d = EndMode3D
  fun begin_texture_mode = BeginTextureMode(target : RenderTexture2D)
  fun end_texture_mode = EndTextureMode
  fun begin_shader_mode = BeginShaderMode(shader : Shader)
  fun end_shader_mode = EndShaderMode
  fun begin_blend_mode = BeginBlendMode(mode : Int32)
  fun end_blend_mode = EndBlendMode
  fun begin_scissor_mode = BeginScissorMode(x : Int32, y : Int32, width : Int32, height : Int32)
  fun end_scissor_mode = EndScissorMode
  fun begin_vr_stereo_mode = BeginVrStereoMode(vr_stereo_config : VrStereoConfig)
  fun end_vr_stereo_mode = EndVrStereoMode
  fun load_vr_stereo_config = LoadVrStereoConfig(device : VrDeviceInfo) : VrStereoConfig
  fun unload_vr_stereo_config = UnloadVrStereoConfig(config : VrStereoConfig)
  fun load_shader = LoadShader(vs_file_name : Int8*, fs_file_name : Int8*) : Shader
  fun load_shader_from_memory = LoadShaderFromMemory(vs_code : Int8*, fs_code : Int8*) : Shader
  fun get_shader_location = GetShaderLocation(shader : Shader, uniform_name : Int8*) : Int16
  fun get_shader_location_attrib = GetShaderLocationAttrib(shader : Shader, attrib_name : Int8*) : Int16
  fun set_shader_value = SetShaderValue(shader : Shader, loc_index : Int16, value : Void*, uniform_type : Int16)
  fun set_shader_value_v = SetShaderValueV(shader : Shader, loc_index : Int16, value : Void*, uniform_type : Int16, count : Int16)
  fun set_shader_value_matrix = SetShaderValueMatrix(shader : Shader, loc_index : Int16, mat : Matrix)
  fun set_shader_value_texture = SetShaderValueTexture(shader : Shader, loc_index : Int16, texture : Texture2D)
  fun unload_shader = UnloadShader(shader : Shader)
  fun get_mouse_ray = GetMouseRay(mouse_position : Vector2, camera : Camera) : Ray
  fun get_camera_matrix = GetCameraMatrix(camera : Camera) : Matrix
  fun get_camera_matrix2_d = GetCameraMatrix2D(camera : Camera2D) : Matrix
  fun get_world_to_screen = GetWorldToScreen(position : Vector3, camera : Camera) : Vector2
  fun get_world_to_screen_ex = GetWorldToScreenEx(position : Vector3, camera : Camera, width : Int16, height : Int16) : Vector2
  fun get_world_to_screen2_d = GetWorldToScreen2D(position : Vector2, camera : Camera2D) : Vector2
  fun get_screen_to_world2_d = GetScreenToWorld2D(position : Vector2, camera : Camera2D) : Vector2
  fun set_target_fps = SetTargetFPS(fps : Int16)
  fun get_fps = GetFPS : Int16
  fun get_frame_time = GetFrameTime : Float32
  fun get_time = GetTime : Float64
  fun get_random_value = GetRandomValue(min : Int16, max : Int16) : Int16
  fun set_random_seed = SetRandomSeed(seed : UInt16)
  fun take_screenshot = TakeScreenshot(file_name : Int8*)
  fun set_config_flags = SetConfigFlags(flags : UInt16)
  # ##### fun trace_log = TraceLog(log_level : Int16, text : Int8*, ... : )
  fun set_trace_log_level = SetTraceLogLevel(log_level : Int16)
  fun mem_alloc = MemAlloc(size : Int16) : Void*
  fun mem_realloc = MemRealloc(ptr : Void*, size : Int16) : Void*
  fun mem_free = MemFree(ptr : Void*)
  fun load_file_data = LoadFileData(file_name : Int8*, bytes_read : UInt16*) : UInt8*
  fun unload_file_data = UnloadFileData(data : UInt8*)
  fun save_file_data? = SaveFileData(file_name : Int8*, data : Void*, bytes_to_write : UInt16) : Bool
  fun load_file_text = LoadFileText(file_name : Int8*) : Int8*
  fun unload_file_text = UnloadFileText(text : Int8*)
  fun save_file_text? = SaveFileText(file_name : Int8*, text : Int8*) : Bool
  fun file_exists? = FileExists(file_name : Int8*) : Bool
  fun directory_exists? = DirectoryExists(dir_path : Int8*) : Bool
  fun is_file_extension? = IsFileExtension(file_name : Int8*, ext : Int8*) : Bool
  fun get_file_extension = GetFileExtension(file_name : Int8*) : Int8*
  fun get_file_name = GetFileName(file_path : Int8*) : Int8*
  fun get_file_name_without_ext = GetFileNameWithoutExt(file_path : Int8*) : Int8*
  fun get_directory_path = GetDirectoryPath(file_path : Int8*) : Int8*
  fun get_prev_directory_path = GetPrevDirectoryPath(dir_path : Int8*) : Int8*
  fun get_working_directory = GetWorkingDirectory : Int8*
  fun get_directory_files = GetDirectoryFiles(dir_path : Int8*, count : Int16*) : Int8**
  fun clear_directory_files = ClearDirectoryFiles
  fun change_directory? = ChangeDirectory(dir : Int8*) : Bool
  fun is_file_dropped? = IsFileDropped : Bool
  fun get_dropped_files = GetDroppedFiles(count : Int16*) : Int8**
  fun clear_dropped_files = ClearDroppedFiles
  fun get_file_mod_time = GetFileModTime(file_name : Int8*) : Int32
  fun compress_data = CompressData(data : UInt8*, data_length : Int16, comp_data_length : Int16*) : UInt8*
  fun decompress_data = DecompressData(comp_data : UInt8*, comp_data_length : Int16, data_length : Int16*) : UInt8*
  fun encode_data_base64 = EncodeDataBase64(data : UInt8*, data_length : Int16, output_length : Int16*) : Int8*
  fun decode_data_base64 = DecodeDataBase64(data : UInt8*, output_length : Int16*) : UInt8*
  fun save_storage_value? = SaveStorageValue(position : UInt16, value : Int16) : Bool
  fun load_storage_value = LoadStorageValue(position : UInt16) : Int16
  fun open_url = OpenURL(url : Int8*)
  fun is_key_pressed? = IsKeyPressed(key : Int16) : Bool
  fun is_key_down? = IsKeyDown(key : Int16) : Bool
  fun is_key_released? = IsKeyReleased(key : Int16) : Bool
  fun is_key_up? = IsKeyUp(key : Int16) : Bool
  fun set_exit_key = SetExitKey(key : Int16)
  fun get_key_pressed = GetKeyPressed : Int16
  fun get_char_pressed = GetCharPressed : Int16
  fun is_gamepad_available? = IsGamepadAvailable(gamepad : Int16) : Bool
  fun get_gamepad_name = GetGamepadName(gamepad : Int16) : Int8*
  fun is_gamepad_button_pressed? = IsGamepadButtonPressed(gamepad : Int16, button : Int16) : Bool
  fun is_gamepad_button_down? = IsGamepadButtonDown(gamepad : Int16, button : Int16) : Bool
  fun is_gamepad_button_released? = IsGamepadButtonReleased(gamepad : Int16, button : Int16) : Bool
  fun is_gamepad_button_up? = IsGamepadButtonUp(gamepad : Int16, button : Int16) : Bool
  fun get_gamepad_button_pressed = GetGamepadButtonPressed : Int16
  fun get_gamepad_axis_count = GetGamepadAxisCount(gamepad : Int16) : Int16
  fun get_gamepad_axis_movement = GetGamepadAxisMovement(gamepad : Int16, axis : Int16) : Float32
  fun set_gamepad_mappings = SetGamepadMappings(mappings : Int8*) : Int16
  fun is_mouse_button_pressed? = IsMouseButtonPressed(button : Int16) : Bool
  fun is_mouse_button_down? = IsMouseButtonDown(button : Int16) : Bool
  fun is_mouse_button_released? = IsMouseButtonReleased(button : Int16) : Bool
  fun is_mouse_button_up? = IsMouseButtonUp(button : Int16) : Bool
  fun get_mouse_x = GetMouseX : Int16
  fun get_mouse_y = GetMouseY : Int16
  fun get_mouse_position = GetMousePosition : Vector2
  fun get_mouse_delta = GetMouseDelta : Vector2
  fun set_mouse_position = SetMousePosition(x : Int16, y : Int16)
  fun set_mouse_offset = SetMouseOffset(offset_x : Int16, offset_y : Int16)
  fun set_mouse_scale = SetMouseScale(scale_x : Float32, scale_y : Float32)
  fun get_mouse_wheel_move = GetMouseWheelMove : Float32
  fun set_mouse_cursor = SetMouseCursor(cursor : Int16)
  fun get_touch_x = GetTouchX : Int16
  fun get_touch_y = GetTouchY : Int16
  fun get_touch_position = GetTouchPosition(index : Int16) : Vector2
  fun get_touch_point_id = GetTouchPointId(index : Int16) : Int16
  fun get_touch_point_count = GetTouchPointCount : Int16
  fun set_gestures_enabled = SetGesturesEnabled(flags : UInt16)
  fun is_gesture_detected? = IsGestureDetected(gesture : Int16) : Bool
  fun get_gesture_detected = GetGestureDetected : Int16
  fun get_gesture_hold_duration = GetGestureHoldDuration : Float32
  fun get_gesture_drag_vector = GetGestureDragVector : Vector2
  fun get_gesture_drag_angle = GetGestureDragAngle : Float32
  fun get_gesture_pinch_vector = GetGesturePinchVector : Vector2
  fun get_gesture_pinch_angle = GetGesturePinchAngle : Float32
  fun set_camera_mode = SetCameraMode(camera : Camera, mode : Int16)
  fun update_camera = UpdateCamera(camera : Camera*)
  fun set_camera_pan_control = SetCameraPanControl(key_pan : Int16)
  fun set_camera_alt_control = SetCameraAltControl(key_alt : Int16)
  fun set_camera_smooth_zoom_control = SetCameraSmoothZoomControl(key_smooth_zoom : Int16)
  fun set_camera_move_controls = SetCameraMoveControls(key_front : Int16, key_back : Int16, key_right : Int16, key_left : Int16, key_up : Int16, key_down : Int16)
  fun set_shapes_texture = SetShapesTexture(texture : Texture2D, source : Rectangle)
  fun draw_pixel = DrawPixel(pos_x : Int16, pos_y : Int16, color : Color)
  fun draw_pixel_v = DrawPixelV(position : Vector2, color : Color)
  fun draw_line = DrawLine(start_pos_x : Int16, start_pos_y : Int16, end_pos_x : Int16, end_pos_y : Int16, color : Color)
  fun draw_line_v = DrawLineV(start_pos : Vector2, end_pos : Vector2, color : Color)
  fun draw_line_ex = DrawLineEx(start_pos : Vector2, end_pos : Vector2, thick : Float32, color : Color)
  fun draw_line_bezier = DrawLineBezier(start_pos : Vector2, end_pos : Vector2, thick : Float32, color : Color)
  fun draw_line_bezier_quad = DrawLineBezierQuad(start_pos : Vector2, end_pos : Vector2, control_pos : Vector2, thick : Float32, color : Color)
  fun draw_line_bezier_cubic = DrawLineBezierCubic(start_pos : Vector2, end_pos : Vector2, start_control_pos : Vector2, end_control_pos : Vector2, thick : Float32, color : Color)
  fun draw_line_strip = DrawLineStrip(points : Vector2*, point_count : Int16, color : Color)
  fun draw_circle = DrawCircle(center_x : Int16, center_y : Int16, radius : Float32, color : Color)
  fun draw_circle_sector = DrawCircleSector(center : Vector2, radius : Float32, start_angle : Float32, end_angle : Float32, segments : Int16, color : Color)
  fun draw_circle_sector_lines = DrawCircleSectorLines(center : Vector2, radius : Float32, start_angle : Float32, end_angle : Float32, segments : Int16, color : Color)
  fun draw_circle_gradient = DrawCircleGradient(center_x : Int16, center_y : Int16, radius : Float32, color1 : Color, color2 : Color)
  fun draw_circle_v = DrawCircleV(center : Vector2, radius : Float32, color : Color)
  fun draw_circle_lines = DrawCircleLines(center_x : Int16, center_y : Int16, radius : Float32, color : Color)
  fun draw_ellipse = DrawEllipse(center_x : Int16, center_y : Int16, radius_h : Float32, radius_v : Float32, color : Color)
  fun draw_ellipse_lines = DrawEllipseLines(center_x : Int16, center_y : Int16, radius_h : Float32, radius_v : Float32, color : Color)
  fun draw_ring = DrawRing(center : Vector2, inner_radius : Float32, outer_radius : Float32, start_angle : Float32, end_angle : Float32, segments : Int16, color : Color)
  fun draw_ring_lines = DrawRingLines(center : Vector2, inner_radius : Float32, outer_radius : Float32, start_angle : Float32, end_angle : Float32, segments : Int16, color : Color)
  fun draw_rectangle = DrawRectangle(pos_x : Int16, pos_y : Int16, width : Int16, height : Int16, color : Color)
  fun draw_rectangle_v = DrawRectangleV(position : Vector2, size : Vector2, color : Color)
  fun draw_rectangle_rec = DrawRectangleRec(rec : Rectangle, color : Color)
  fun draw_rectangle_pro = DrawRectanglePro(rec : Rectangle, origin : Vector2, rotation : Float32, color : Color)
  fun draw_rectangle_gradient_v = DrawRectangleGradientV(pos_x : Int16, pos_y : Int16, width : Int16, height : Int16, color1 : Color, color2 : Color)
  fun draw_rectangle_gradient_h = DrawRectangleGradientH(pos_x : Int16, pos_y : Int16, width : Int16, height : Int16, color1 : Color, color2 : Color)
  fun draw_rectangle_gradient_ex = DrawRectangleGradientEx(rec : Rectangle, col1 : Color, col2 : Color, col3 : Color, col4 : Color)
  fun draw_rectangle_lines = DrawRectangleLines(pos_x : Int16, pos_y : Int16, width : Int16, height : Int16, color : Color)
  fun draw_rectangle_lines_ex = DrawRectangleLinesEx(rec : Rectangle, line_thick : Float32, color : Color)
  fun draw_rectangle_rounded = DrawRectangleRounded(rec : Rectangle, roundness : Float32, segments : Int16, color : Color)
  fun draw_rectangle_rounded_lines = DrawRectangleRoundedLines(rec : Rectangle, roundness : Float32, segments : Int16, line_thick : Float32, color : Color)
  fun draw_triangle = DrawTriangle(v1 : Vector2, v2 : Vector2, v3 : Vector2, color : Color)
  fun draw_triangle_lines = DrawTriangleLines(v1 : Vector2, v2 : Vector2, v3 : Vector2, color : Color)
  fun draw_triangle_fan = DrawTriangleFan(points : Vector2*, point_count : Int16, color : Color)
  fun draw_triangle_strip = DrawTriangleStrip(points : Vector2*, point_count : Int16, color : Color)
  fun draw_poly = DrawPoly(center : Vector2, sides : Int16, radius : Float32, rotation : Float32, color : Color)
  fun draw_poly_lines = DrawPolyLines(center : Vector2, sides : Int16, radius : Float32, rotation : Float32, color : Color)
  fun draw_poly_lines_ex = DrawPolyLinesEx(center : Vector2, sides : Int16, radius : Float32, rotation : Float32, line_thick : Float32, color : Color)
  fun check_collision_recs? = CheckCollisionRecs(rec1 : Rectangle, rec2 : Rectangle) : Bool
  fun check_collision_circles? = CheckCollisionCircles(center1 : Vector2, radius1 : Float32, center2 : Vector2, radius2 : Float32) : Bool
  fun check_collision_circle_rec? = CheckCollisionCircleRec(center : Vector2, radius : Float32, rec : Rectangle) : Bool
  fun check_collision_point_rec? = CheckCollisionPointRec(point : Vector2, rec : Rectangle) : Bool
  fun check_collision_point_circle? = CheckCollisionPointCircle(point : Vector2, center : Vector2, radius : Float32) : Bool
  fun check_collision_point_triangle? = CheckCollisionPointTriangle(point : Vector2, p1 : Vector2, p2 : Vector2, p3 : Vector2) : Bool
  fun check_collision_lines? = CheckCollisionLines(start_pos1 : Vector2, end_pos1 : Vector2, start_pos2 : Vector2, end_pos2 : Vector2, collision_point : Vector2*) : Bool
  fun check_collision_point_line? = CheckCollisionPointLine(point : Vector2, p1 : Vector2, p2 : Vector2, threshold : Int16) : Bool
  fun get_collision_rec = GetCollisionRec(rec1 : Rectangle, rec2 : Rectangle) : Rectangle
  fun load_image = LoadImage(file_name : Int8*) : Image
  fun load_image_raw = LoadImageRaw(file_name : Int8*, width : Int16, height : Int16, format : Int16, header_size : Int16) : Image
  fun load_image_anim = LoadImageAnim(file_name : Int8*, frames : Int16*) : Image
  fun load_image_from_memory = LoadImageFromMemory(file_type : Int8*, file_data : UInt8*, data_size : Int16) : Image
  fun load_image_from_texture = LoadImageFromTexture(texture : Texture2D) : Image
  fun load_image_from_screen = LoadImageFromScreen : Image
  fun unload_image = UnloadImage(image : Image)
  fun export_image? = ExportImage(image : Image, file_name : Int8*) : Bool
  fun export_image_as_code? = ExportImageAsCode(image : Image, file_name : Int8*) : Bool
  fun gen_image_color = GenImageColor(width : Int16, height : Int16, color : Color) : Image
  fun gen_image_gradient_v = GenImageGradientV(width : Int16, height : Int16, top : Color, bottom : Color) : Image
  fun gen_image_gradient_h = GenImageGradientH(width : Int16, height : Int16, left : Color, right : Color) : Image
  fun gen_image_gradient_radial = GenImageGradientRadial(width : Int16, height : Int16, density : Float32, inner : Color, outer : Color) : Image
  fun gen_image_checked = GenImageChecked(width : Int16, height : Int16, checks_x : Int16, checks_y : Int16, col1 : Color, col2 : Color) : Image
  fun gen_image_white_noise = GenImageWhiteNoise(width : Int16, height : Int16, factor : Float32) : Image
  fun gen_image_cellular = GenImageCellular(width : Int16, height : Int16, tile_size : Int16) : Image
  fun image_copy = ImageCopy(image : Image) : Image
  fun image_from_image = ImageFromImage(image : Image, rec : Rectangle) : Image
  fun image_text = ImageText(text : Int8*, font_size : Int16, color : Color) : Image
  fun image_text_ex = ImageTextEx(font : Font, text : Int8*, font_size : Float32, spacing : Float32, tint : Color) : Image
  fun image_format = ImageFormat(image : Image*, new_format : Int16)
  fun image_to_pot = ImageToPOT(image : Image*, fill : Color)
  fun image_crop = ImageCrop(image : Image*, crop : Rectangle)
  fun image_alpha_crop = ImageAlphaCrop(image : Image*, threshold : Float32)
  fun image_alpha_clear = ImageAlphaClear(image : Image*, color : Color, threshold : Float32)
  fun image_alpha_mask = ImageAlphaMask(image : Image*, alpha_mask : Image)
  fun image_alpha_premultiply = ImageAlphaPremultiply(image : Image*)
  fun image_resize = ImageResize(image : Image*, new_width : Int16, new_height : Int16)
  fun image_resize_nn = ImageResizeNN(image : Image*, new_width : Int16, new_height : Int16)
  fun image_resize_canvas = ImageResizeCanvas(image : Image*, new_width : Int16, new_height : Int16, offset_x : Int16, offset_y : Int16, fill : Color)
  fun image_mipmaps = ImageMipmaps(image : Image*)
  fun image_dither = ImageDither(image : Image*, r_bpp : Int16, g_bpp : Int16, b_bpp : Int16, a_bpp : Int16)
  fun image_flip_vertical = ImageFlipVertical(image : Image*)
  fun image_flip_horizontal = ImageFlipHorizontal(image : Image*)
  fun image_rotate_cw = ImageRotateCW(image : Image*)
  fun image_rotate_ccw = ImageRotateCCW(image : Image*)
  fun image_color_tint = ImageColorTint(image : Image*, color : Color)
  fun image_color_invert = ImageColorInvert(image : Image*)
  fun image_color_grayscale = ImageColorGrayscale(image : Image*)
  fun image_color_contrast = ImageColorContrast(image : Image*, contrast : Float32)
  fun image_color_brightness = ImageColorBrightness(image : Image*, brightness : Int16)
  fun image_color_replace = ImageColorReplace(image : Image*, color : Color, replace : Color)
  fun load_image_colors = LoadImageColors(image : Image) : Color*
  fun load_image_palette = LoadImagePalette(image : Image, max_palette_size : Int16, color_count : Int16*) : Color*
  fun unload_image_colors = UnloadImageColors(colors : Color*)
  fun unload_image_palette = UnloadImagePalette(colors : Color*)
  fun get_image_alpha_border = GetImageAlphaBorder(image : Image, threshold : Float32) : Rectangle
  fun get_image_color = GetImageColor(image : Image, x : Int16, y : Int16) : Color
  fun image_clear_background = ImageClearBackground(dst : Image*, color : Color)
  fun image_draw_pixel = ImageDrawPixel(dst : Image*, pos_x : Int16, pos_y : Int16, color : Color)
  fun image_draw_pixel_v = ImageDrawPixelV(dst : Image*, position : Vector2, color : Color)
  fun image_draw_line = ImageDrawLine(dst : Image*, start_pos_x : Int16, start_pos_y : Int16, end_pos_x : Int16, end_pos_y : Int16, color : Color)
  fun image_draw_line_v = ImageDrawLineV(dst : Image*, start : Vector2, end : Vector2, color : Color)
  fun image_draw_circle = ImageDrawCircle(dst : Image*, center_x : Int16, center_y : Int16, radius : Int16, color : Color)
  fun image_draw_circle_v = ImageDrawCircleV(dst : Image*, center : Vector2, radius : Int16, color : Color)
  fun image_draw_rectangle = ImageDrawRectangle(dst : Image*, pos_x : Int16, pos_y : Int16, width : Int16, height : Int16, color : Color)
  fun image_draw_rectangle_v = ImageDrawRectangleV(dst : Image*, position : Vector2, size : Vector2, color : Color)
  fun image_draw_rectangle_rec = ImageDrawRectangleRec(dst : Image*, rec : Rectangle, color : Color)
  fun image_draw_rectangle_lines = ImageDrawRectangleLines(dst : Image*, rec : Rectangle, thick : Int16, color : Color)
  fun image_draw = ImageDraw(dst : Image*, src : Image, src_rec : Rectangle, dst_rec : Rectangle, tint : Color)
  fun image_draw_text = ImageDrawText(dst : Image*, text : Int8*, pos_x : Int16, pos_y : Int16, font_size : Int16, color : Color)
  fun image_draw_text_ex = ImageDrawTextEx(dst : Image*, font : Font, text : Int8*, position : Vector2, font_size : Float32, spacing : Float32, tint : Color)
  fun load_texture = LoadTexture(file_name : Int8*) : Texture2D
  fun load_texture_from_image = LoadTextureFromImage(image : Image) : Texture2D
  fun load_texture_cubemap = LoadTextureCubemap(image : Image, layout : Int16) : TextureCubemap
  fun load_render_texture = LoadRenderTexture(width : Int16, height : Int16) : RenderTexture2D
  fun unload_texture = UnloadTexture(texture : Texture2D)
  fun unload_render_texture = UnloadRenderTexture(target : RenderTexture2D)
  fun update_texture = UpdateTexture(texture : Texture2D, pixels : Void*)
  fun update_texture_rec = UpdateTextureRec(texture : Texture2D, rec : Rectangle, pixels : Void*)
  fun gen_texture_mipmaps = GenTextureMipmaps(texture : Texture2D*)
  fun set_texture_filter = SetTextureFilter(texture : Texture2D, filter : Int16)
  fun set_texture_wrap = SetTextureWrap(texture : Texture2D, wrap : Int16)
  fun draw_texture = DrawTexture(texture : Texture2D, pos_x : Int16, pos_y : Int16, tint : Color)
  fun draw_texture_v = DrawTextureV(texture : Texture2D, position : Vector2, tint : Color)
  fun draw_texture_ex = DrawTextureEx(texture : Texture2D, position : Vector2, rotation : Float32, scale : Float32, tint : Color)
  fun draw_texture_rec = DrawTextureRec(texture : Texture2D, source : Rectangle, position : Vector2, tint : Color)
  fun draw_texture_quad = DrawTextureQuad(texture : Texture2D, tiling : Vector2, offset : Vector2, quad : Rectangle, tint : Color)
  fun draw_texture_tiled = DrawTextureTiled(texture : Texture2D, source : Rectangle, dest : Rectangle, origin : Vector2, rotation : Float32, scale : Float32, tint : Color)
  fun draw_texture_pro = DrawTexturePro(texture : Texture2D, source : Rectangle, dest : Rectangle, origin : Vector2, rotation : Float32, tint : Color)
  fun draw_texture_n_patch = DrawTextureNPatch(texture : Texture2D, n_patch_info : NPatchInfo, dest : Rectangle, origin : Vector2, rotation : Float32, tint : Color)
  fun draw_texture_poly = DrawTexturePoly(texture : Texture2D, center : Vector2, points : Vector2*, texcoords : Vector2*, point_count : Int16, tint : Color)
  fun fade = Fade(color : Color, alpha : Float32) : Color
  fun color_to_int = ColorToInt(color : Color) : Int16
  fun color_normalize = ColorNormalize(color : Color) : Vector4
  fun color_from_normalized = ColorFromNormalized(normalized : Vector4) : Color
  fun color_to_hsv = ColorToHSV(color : Color) : Vector3
  fun color_from_hsv = ColorFromHSV(hue : Float32, saturation : Float32, value : Float32) : Color
  fun color_alpha = ColorAlpha(color : Color, alpha : Float32) : Color
  fun color_alpha_blend = ColorAlphaBlend(dst : Color, src : Color, tint : Color) : Color
  fun get_color = GetColor(hex_value : UInt16) : Color
  fun get_pixel_color = GetPixelColor(src_ptr : Void*, format : Int16) : Color
  fun set_pixel_color = SetPixelColor(dst_ptr : Void*, color : Color, format : Int16)
  fun get_pixel_data_size = GetPixelDataSize(width : Int16, height : Int16, format : Int16) : Int16
  fun get_font_default = GetFontDefault : Font
  fun load_font = LoadFont(file_name : Int8*) : Font
  fun load_font_ex = LoadFontEx(file_name : Int8*, font_size : Int16, font_chars : Int16*, glyph_count : Int16) : Font
  fun load_font_from_image = LoadFontFromImage(image : Image, key : Color, first_char : Int16) : Font
  fun load_font_from_memory = LoadFontFromMemory(file_type : Int8*, file_data : UInt8*, data_size : Int16, font_size : Int16, font_chars : Int16*, glyph_count : Int16) : Font
  fun load_font_data = LoadFontData(file_data : UInt8*, data_size : Int16, font_size : Int16, font_chars : Int16*, glyph_count : Int16, type : Int16) : GlyphInfo*
  fun gen_image_font_atlas = GenImageFontAtlas(chars : GlyphInfo*, recs : Rectangle**, glyph_count : Int16, font_size : Int16, padding : Int16, pack_method : Int16) : Image
  fun unload_font_data = UnloadFontData(chars : GlyphInfo*, glyph_count : Int16)
  fun unload_font = UnloadFont(font : Font)
  fun draw_fps = DrawFPS(pos_x : Int16, pos_y : Int16)
  fun draw_text = DrawText(text : Int8*, pos_x : Int16, pos_y : Int16, font_size : Int16, color : Color)
  fun draw_text_ex = DrawTextEx(font : Font, text : Int8*, position : Vector2, font_size : Float32, spacing : Float32, tint : Color)
  fun draw_text_pro = DrawTextPro(font : Font, text : Int8*, position : Vector2, origin : Vector2, rotation : Float32, font_size : Float32, spacing : Float32, tint : Color)
  fun draw_text_codepoint = DrawTextCodepoint(font : Font, codepoint : Int16, position : Vector2, font_size : Float32, tint : Color)
  fun measure_text = MeasureText(text : Int8*, font_size : Int16) : Int16
  fun measure_text_ex = MeasureTextEx(font : Font, text : Int8*, font_size : Float32, spacing : Float32) : Vector2
  fun get_glyph_index = GetGlyphIndex(font : Font, codepoint : Int16) : Int16
  fun get_glyph_info = GetGlyphInfo(font : Font, codepoint : Int16) : GlyphInfo
  fun get_glyph_atlas_rec = GetGlyphAtlasRec(font : Font, codepoint : Int16) : Rectangle
  fun load_codepoints = LoadCodepoints(text : Int8*, count : Int16*) : Int16*
  fun unload_codepoints = UnloadCodepoints(codepoints : Int16*)
  fun get_codepoint_count = GetCodepointCount(text : Int8*) : Int16
  fun get_codepoint = GetCodepoint(text : Int8*, bytes_processed : Int16*) : Int16
  fun codepoint_to_utf8 = CodepointToUTF8(codepoint : Int16, byte_size : Int16*) : Int8*
  fun text_codepoints_to_utf8 = TextCodepointsToUTF8(codepoints : Int16*, length : Int16) : Int8*
  fun text_copy = TextCopy(dst : Int8*, src : Int8*) : Int16
  fun text_is_equal? = TextIsEqual(text1 : Int8*, text2 : Int8*) : Bool
  fun text_length = TextLength(text : Int8*) : UInt16
  # ##### fun text_format = TextFormat(text : Int8*, ... : ) : Int8*
  fun text_subtext = TextSubtext(text : Int8*, position : Int16, length : Int16) : Int8*
  fun text_replace = TextReplace(text : Int8*, replace : Int8*, by : Int8*) : Int8*
  fun text_insert = TextInsert(text : Int8*, insert : Int8*, position : Int16) : Int8*
  fun text_join = TextJoin(text_list : Int8**, count : Int16, delimiter : Int8*) : Int8*
  fun text_split = TextSplit(text : Int8*, delimiter : Int8, count : Int16*) : Int8**
  fun text_append = TextAppend(text : Int8*, append : Int8*, position : Int16*)
  fun text_find_index = TextFindIndex(text : Int8*, find : Int8*) : Int16
  fun text_to_upper = TextToUpper(text : Int8*) : Int8*
  fun text_to_lower = TextToLower(text : Int8*) : Int8*
  fun text_to_pascal = TextToPascal(text : Int8*) : Int8*
  fun text_to_integer = TextToInteger(text : Int8*) : Int16
  fun draw_line3_d = DrawLine3D(start_pos : Vector3, end_pos : Vector3, color : Color)
  fun draw_point3_d = DrawPoint3D(position : Vector3, color : Color)
  fun draw_circle3_d = DrawCircle3D(center : Vector3, radius : Float32, rotation_axis : Vector3, rotation_angle : Float32, color : Color)
  fun draw_triangle3_d = DrawTriangle3D(v1 : Vector3, v2 : Vector3, v3 : Vector3, color : Color)
  fun draw_triangle_strip3_d = DrawTriangleStrip3D(points : Vector3*, point_count : Int16, color : Color)
  fun draw_cube = DrawCube(position : Vector3, width : Float32, height : Float32, length : Float32, color : Color)
  fun draw_cube_v = DrawCubeV(position : Vector3, size : Vector3, color : Color)
  fun draw_cube_wires = DrawCubeWires(position : Vector3, width : Float32, height : Float32, length : Float32, color : Color)
  fun draw_cube_wires_v = DrawCubeWiresV(position : Vector3, size : Vector3, color : Color)
  fun draw_cube_texture = DrawCubeTexture(texture : Texture2D, position : Vector3, width : Float32, height : Float32, length : Float32, color : Color)
  fun draw_cube_texture_rec = DrawCubeTextureRec(texture : Texture2D, source : Rectangle, position : Vector3, width : Float32, height : Float32, length : Float32, color : Color)
  fun draw_sphere = DrawSphere(center_pos : Vector3, radius : Float32, color : Color)
  fun draw_sphere_ex = DrawSphereEx(center_pos : Vector3, radius : Float32, rings : Int16, slices : Int16, color : Color)
  fun draw_sphere_wires = DrawSphereWires(center_pos : Vector3, radius : Float32, rings : Int16, slices : Int16, color : Color)
  fun draw_cylinder = DrawCylinder(position : Vector3, radius_top : Float32, radius_bottom : Float32, height : Float32, slices : Int16, color : Color)
  fun draw_cylinder_ex = DrawCylinderEx(start_pos : Vector3, end_pos : Vector3, start_radius : Float32, end_radius : Float32, sides : Int16, color : Color)
  fun draw_cylinder_wires = DrawCylinderWires(position : Vector3, radius_top : Float32, radius_bottom : Float32, height : Float32, slices : Int16, color : Color)
  fun draw_cylinder_wires_ex = DrawCylinderWiresEx(start_pos : Vector3, end_pos : Vector3, start_radius : Float32, end_radius : Float32, sides : Int16, color : Color)
  fun draw_plane = DrawPlane(center_pos : Vector3, size : Vector2, color : Color)
  fun draw_ray = DrawRay(ray : Ray, color : Color)
  fun draw_grid = DrawGrid(slices : Int16, spacing : Float32)
  fun load_model = LoadModel(file_name : Int8*) : Model
  fun load_model_from_mesh = LoadModelFromMesh(mesh : Mesh) : Model
  fun unload_model = UnloadModel(model : Model)
  fun unload_model_keep_meshes = UnloadModelKeepMeshes(model : Model)
  fun get_model_bounding_box = GetModelBoundingBox(model : Model) : BoundingBox
  fun draw_model = DrawModel(model : Model, position : Vector3, scale : Float32, tint : Color)
  fun draw_model_ex = DrawModelEx(model : Model, position : Vector3, rotation_axis : Vector3, rotation_angle : Float32, scale : Vector3, tint : Color)
  fun draw_model_wires = DrawModelWires(model : Model, position : Vector3, scale : Float32, tint : Color)
  fun draw_model_wires_ex = DrawModelWiresEx(model : Model, position : Vector3, rotation_axis : Vector3, rotation_angle : Float32, scale : Vector3, tint : Color)
  fun draw_bounding_box = DrawBoundingBox(box : BoundingBox, color : Color)
  fun draw_billboard = DrawBillboard(camera : Camera, texture : Texture2D, position : Vector3, size : Float32, tint : Color)
  fun draw_billboard_rec = DrawBillboardRec(camera : Camera, texture : Texture2D, source : Rectangle, position : Vector3, size : Vector2, tint : Color)
  fun draw_billboard_pro = DrawBillboardPro(camera : Camera, texture : Texture2D, source : Rectangle, position : Vector3, up : Vector3, size : Vector2, origin : Vector2, rotation : Float32, tint : Color)
  fun upload_mesh = UploadMesh(mesh : Mesh*, dynamic : Bool)
  fun update_mesh_buffer = UpdateMeshBuffer(mesh : Mesh, index : Int16, data : Void*, data_size : Int16, offset : Int16)
  fun unload_mesh = UnloadMesh(mesh : Mesh)
  fun draw_mesh = DrawMesh(mesh : Mesh, material : Material, transform : Matrix)
  fun draw_mesh_instanced = DrawMeshInstanced(mesh : Mesh, material : Material, transforms : Matrix*, instances : Int16)
  fun export_mesh? = ExportMesh(mesh : Mesh, file_name : Int8*) : Bool
  fun get_mesh_bounding_box = GetMeshBoundingBox(mesh : Mesh) : BoundingBox
  fun gen_mesh_tangents = GenMeshTangents(mesh : Mesh*)
  fun gen_mesh_binormals = GenMeshBinormals(mesh : Mesh*)
  fun gen_mesh_poly = GenMeshPoly(sides : Int16, radius : Float32) : Mesh
  fun gen_mesh_plane = GenMeshPlane(width : Float32, length : Float32, res_x : Int16, res_z : Int16) : Mesh
  fun gen_mesh_cube = GenMeshCube(width : Float32, height : Float32, length : Float32) : Mesh
  fun gen_mesh_sphere = GenMeshSphere(radius : Float32, rings : Int16, slices : Int16) : Mesh
  fun gen_mesh_hemi_sphere = GenMeshHemiSphere(radius : Float32, rings : Int16, slices : Int16) : Mesh
  fun gen_mesh_cylinder = GenMeshCylinder(radius : Float32, height : Float32, slices : Int16) : Mesh
  fun gen_mesh_cone = GenMeshCone(radius : Float32, height : Float32, slices : Int16) : Mesh
  fun gen_mesh_torus = GenMeshTorus(radius : Float32, size : Float32, rad_seg : Int16, sides : Int16) : Mesh
  fun gen_mesh_knot = GenMeshKnot(radius : Float32, size : Float32, rad_seg : Int16, sides : Int16) : Mesh
  fun gen_mesh_heightmap = GenMeshHeightmap(heightmap : Image, size : Vector3) : Mesh
  fun gen_mesh_cubicmap = GenMeshCubicmap(cubicmap : Image, cube_size : Vector3) : Mesh
  fun load_materials = LoadMaterials(file_name : Int8*, material_count : Int16*) : Material*
  fun load_material_default = LoadMaterialDefault : Material
  fun unload_material = UnloadMaterial(material : Material)
  fun set_material_texture = SetMaterialTexture(material : Material*, map_type : Int16, texture : Texture2D)
  fun set_model_mesh_material = SetModelMeshMaterial(model : Model*, mesh_id : Int16, material_id : Int16)
  fun load_model_animations = LoadModelAnimations(file_name : Int8*, anim_count : UInt16*) : ModelAnimation*
  fun update_model_animation = UpdateModelAnimation(model : Model, anim : ModelAnimation, frame : Int16)
  fun unload_model_animation = UnloadModelAnimation(anim : ModelAnimation)
  fun unload_model_animations = UnloadModelAnimations(animations : ModelAnimation*, count : UInt16)
  fun is_model_animation_valid? = IsModelAnimationValid(model : Model, anim : ModelAnimation) : Bool
  fun check_collision_spheres? = CheckCollisionSpheres(center1 : Vector3, radius1 : Float32, center2 : Vector3, radius2 : Float32) : Bool
  fun check_collision_boxes? = CheckCollisionBoxes(box1 : BoundingBox, box2 : BoundingBox) : Bool
  fun check_collision_box_sphere? = CheckCollisionBoxSphere(box : BoundingBox, center : Vector3, radius : Float32) : Bool
  fun get_ray_collision_sphere = GetRayCollisionSphere(ray : Ray, center : Vector3, radius : Float32) : RayCollision
  fun get_ray_collision_box = GetRayCollisionBox(ray : Ray, box : BoundingBox) : RayCollision
  fun get_ray_collision_model = GetRayCollisionModel(ray : Ray, model : Model) : RayCollision
  fun get_ray_collision_mesh = GetRayCollisionMesh(ray : Ray, mesh : Mesh, transform : Matrix) : RayCollision
  fun get_ray_collision_triangle = GetRayCollisionTriangle(ray : Ray, p1 : Vector3, p2 : Vector3, p3 : Vector3) : RayCollision
  fun get_ray_collision_quad = GetRayCollisionQuad(ray : Ray, p1 : Vector3, p2 : Vector3, p3 : Vector3, p4 : Vector3) : RayCollision
  fun init_audio_device = InitAudioDevice
  fun close_audio_device = CloseAudioDevice
  fun is_audio_device_ready? = IsAudioDeviceReady : Bool
  fun set_master_volume = SetMasterVolume(volume : Float32)
  fun load_wave = LoadWave(file_name : Int8*) : Wave
  fun load_wave_from_memory = LoadWaveFromMemory(file_type : Int8*, file_data : UInt8*, data_size : Int16) : Wave
  fun load_sound = LoadSound(file_name : Int8*) : Sound
  fun load_sound_from_wave = LoadSoundFromWave(wave : Wave) : Sound
  fun update_sound = UpdateSound(sound : Sound, data : Void*, sample_count : Int16)
  fun unload_wave = UnloadWave(wave : Wave)
  fun unload_sound = UnloadSound(sound : Sound)
  fun export_wave? = ExportWave(wave : Wave, file_name : Int8*) : Bool
  fun export_wave_as_code? = ExportWaveAsCode(wave : Wave, file_name : Int8*) : Bool
  fun play_sound = PlaySound(sound : Sound)
  fun stop_sound = StopSound(sound : Sound)
  fun pause_sound = PauseSound(sound : Sound)
  fun resume_sound = ResumeSound(sound : Sound)
  fun play_sound_multi = PlaySoundMulti(sound : Sound)
  fun stop_sound_multi = StopSoundMulti
  fun get_sounds_playing = GetSoundsPlaying : Int16
  fun is_sound_playing? = IsSoundPlaying(sound : Sound) : Bool
  fun set_sound_volume = SetSoundVolume(sound : Sound, volume : Float32)
  fun set_sound_pitch = SetSoundPitch(sound : Sound, pitch : Float32)
  fun wave_format = WaveFormat(wave : Wave*, sample_rate : Int16, sample_size : Int16, channels : Int16)
  fun wave_copy = WaveCopy(wave : Wave) : Wave
  fun wave_crop = WaveCrop(wave : Wave*, init_sample : Int16, final_sample : Int16)
  fun load_wave_samples = LoadWaveSamples(wave : Wave) : Float32*
  fun unload_wave_samples = UnloadWaveSamples(samples : Float32*)
  fun load_music_stream = LoadMusicStream(file_name : Int8*) : Music
  fun load_music_stream_from_memory = LoadMusicStreamFromMemory(file_type : Int8*, data : UInt8*, data_size : Int16) : Music
  fun unload_music_stream = UnloadMusicStream(music : Music)
  fun play_music_stream = PlayMusicStream(music : Music)
  fun is_music_stream_playing? = IsMusicStreamPlaying(music : Music) : Bool
  fun update_music_stream = UpdateMusicStream(music : Music)
  fun stop_music_stream = StopMusicStream(music : Music)
  fun pause_music_stream = PauseMusicStream(music : Music)
  fun resume_music_stream = ResumeMusicStream(music : Music)
  fun seek_music_stream = SeekMusicStream(music : Music, position : Float32)
  fun set_music_volume = SetMusicVolume(music : Music, volume : Float32)
  fun set_music_pitch = SetMusicPitch(music : Music, pitch : Float32)
  fun get_music_time_length = GetMusicTimeLength(music : Music) : Float32
  fun get_music_time_played = GetMusicTimePlayed(music : Music) : Float32
  fun load_audio_stream = LoadAudioStream(sample_rate : UInt16, sample_size : UInt16, channels : UInt16) : AudioStream
  fun unload_audio_stream = UnloadAudioStream(stream : AudioStream)
  fun update_audio_stream = UpdateAudioStream(stream : AudioStream, data : Void*, frame_count : Int16)
  fun is_audio_stream_processed? = IsAudioStreamProcessed(stream : AudioStream) : Bool
  fun play_audio_stream = PlayAudioStream(stream : AudioStream)
  fun pause_audio_stream = PauseAudioStream(stream : AudioStream)
  fun resume_audio_stream = ResumeAudioStream(stream : AudioStream)
  fun is_audio_stream_playing? = IsAudioStreamPlaying(stream : AudioStream) : Bool
  fun stop_audio_stream = StopAudioStream(stream : AudioStream)
  fun set_audio_stream_volume = SetAudioStreamVolume(stream : AudioStream, volume : Float32)
  fun set_audio_stream_pitch = SetAudioStreamPitch(stream : AudioStream, pitch : Float32)
  fun set_audio_stream_buffer_size_default = SetAudioStreamBufferSizeDefault(size : Int16)
end
