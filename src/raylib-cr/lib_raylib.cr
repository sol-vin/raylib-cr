@[Link("raylib")]
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
    x : LibC::Float
    y : LibC::Float
  end

  struct Vector3
    x : LibC::Float
    y : LibC::Float
    z : LibC::Float
  end

  struct Vector4
    x : LibC::Float
    y : LibC::Float
    z : LibC::Float
    w : LibC::Float
  end

  struct Matrix
    m0 : LibC::Float
    m4 : LibC::Float
    m8 : LibC::Float
    m12 : LibC::Float
    m1 : LibC::Float
    m5 : LibC::Float
    m9 : LibC::Float
    m13 : LibC::Float
    m2 : LibC::Float
    m6 : LibC::Float
    m10 : LibC::Float
    m14 : LibC::Float
    m3 : LibC::Float
    m7 : LibC::Float
    m11 : LibC::Float
    m15 : LibC::Float
  end

  struct Color
    r : LibC::UChar
    g : LibC::UChar
    b : LibC::UChar
    a : LibC::UChar
  end

  struct Rectangle
    x : LibC::Float
    y : LibC::Float
    width : LibC::Float
    height : LibC::Float
  end

  struct Image
    data : Void*
    width : LibC::Int
    height : LibC::Int
    mipmaps : LibC::Int
    format : LibC::Int
  end

  struct Texture2D
    id : LibC::UInt
    width : LibC::Int
    height : LibC::Int
    mipmaps : LibC::Int
    format : LibC::Int
  end

  struct RenderTexture2D
    id : LibC::UInt
    texture : Texture2D
    depth : Texture2D
  end

  struct NPatchInfo
    source : Rectangle
    left : LibC::Int
    top : LibC::Int
    right : LibC::Int
    bottom : LibC::Int
    layout : LibC::Int
  end

  struct GlyphInfo
    value : LibC::Int
    offset_x : LibC::Int
    offset_y : LibC::Int
    advance_x : LibC::Int
    image : Image
  end

  struct Font
    base_size : LibC::Int
    glyph_count : LibC::Int
    glyph_padding : LibC::Int
    texture : Texture2D
    recs : Rectangle*
    glyphs : GlyphInfo*
  end

  struct Camera3D
    position : Vector3
    target : Vector3
    up : Vector3
    fovy : LibC::Float
    projection : LibC::Int
  end

  struct Camera2D
    offest : Vector2
    target : Vector2
    rotation : LibC::Float
    zoom : LibC::Float
  end

  struct Mesh
    vertex_count : LibC::Int
    triangle_count : LibC::Int

    vertices : LibC::Float*
    texcoords : LibC::Float*
    texcoords2 : LibC::Float*
    normals : LibC::Float*
    tangents : LibC::Float*
    colors : LibC::UChar*
    indices : LibC::UShort*

    anim_vertices : LibC::Float*
    anim_normal : LibC::Float*
    bone_ids : LibC::UChar*
    bone_weights : LibC::Float*
    vaoId : LibC::UInt
    vboId : LibC::Int* # StaticArray(LibC::UInt, 7)
  end

  struct Shader
    id : LibC::UInt
    locs : LibC::Int* # StaticArray(LibC::Int, 32)
  end

  struct MaterialMap
    texture : Texture2D
    color : Color
    value : LibC::Float
  end

  struct Material
    shader : Shader
    maps : MaterialMap                   # StaticArray(MaterialMap, 12)
    params : StaticArray(LibC::Float, 4) # LibC::Float*
  end

  struct Transform
    translation : Vector3
    rotation : Vector4
    scale : Vector3
  end

  struct BoneInfo
    name : StaticArray(LibC::UChar, 32)
    parent : LibC::Int
  end

  struct Model
    transform : Matrix
    mesh_count : LibC::Int
    material_count : LibC::Int
    meshes : Mesh*
    mesh_material : LibC::Int
    bone_count : LibC::Int
    bones : BoneInfo*
    bind_pose : Transform*
  end

  struct ModelAnimation
    bone_count : LibC::Int
    frame_count : LibC::Int
    bones : BoneInfo*
    frame_poses : Transform**
  end

  struct Ray
    position : Vector3
    direction : Vector3
  end

  struct RayCollision
    hit : Bool
    distance : LibC::Float
    point : Vector3
    normal : Vector3
  end

  struct BoundingBox
    min : Vector3
    max : Vector3
  end

  struct Wave
    frame_count : LibC::UInt
    sample_rate : LibC::UInt
    sample_size : LibC::UInt
    channels : LibC::UInt
    data : Void*
  end

  struct AudioStream
    audioBuffer : Void*
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
    frame_count : LibC::Int
    looping : Bool

    ctx_type : LibC::Int
    ctx_data : Void*
  end

  struct VrDeviceInfo
    h_resolution : LibC::Int
    v_resolution : LibC::Int
    h_screenSize : LibC::Float
    v_screenSize : LibC::Float
    v_screenCenter : LibC::Float
    eye_to_screen_distance : LibC::Float
    lens_separation_distance : LibC::Float
    interpupillary_distance : LibC::Float
    lens_distortion_values : StaticArray(LibC::Float, 4)
    chroma_ab_correction : StaticArray(LibC::Float, 4)
  end

  struct VrStereoConfig
    projection : StaticArray(Matrix, 2)
    view_offset : StaticArray(Matrix, 2)
    left_lens_center : StaticArray(LibC::Float, 2)
    right_lens_center : StaticArray(LibC::Float, 2)
    left_screen_center : StaticArray(LibC::Float, 2)
    right_screen_center : StaticArray(LibC::Float, 2)
    scale : StaticArray(LibC::Float, 2)
    scale_in : StaticArray(LibC::Float, 2)
  end

  fun init_window = InitWindow(width : LibC::Int, height : LibC::Int, title : LibC::Char*)
  fun close_window? = WindowShouldClose : Bool
  fun close_window = CloseWindow
  fun window_ready? = IsWindowReady : Bool
  fun window_minimized? = IsWindowMinimized : Bool
  fun window_maximized? = IsWindowMaximized : Bool
  fun window_focused? = IsWindowFocused : Bool
  fun window_resized? = IsWindowResized : Bool
  fun window_state? = IsWindowState(flag : LibC::UInt) : Bool
  fun set_window_state = SetWindowState(flag : LibC::UInt)
  fun clear_window_state = ClearWindowState(flag : LibC::UInt)
  fun toggle_fullscreen = ToggleFullscreen
  fun maximize_window = MaximizeWindow
  fun minimize_window = MinimizeWindow
  fun restore_window = RestoreWindow
  fun set_window_icon = SetWindowIcon(image : Image)
  fun set_window_title = SetWindowTitle(title : LibC::Char*)
  fun set_window_position = SetWindowPosition(x : LibC::Int, y : LibC::Int)
  fun set_window_monitor = SetWindowMonitor(monitor : LibC::Int)
  fun set_window_min_size = SetWindowMinSize(width : LibC::Int, height : LibC::Int)
  fun set_window_size = SetWindowSize(width : LibC::Int, height : LibC::Int)
  fun get_window_handle = GetWindowHandle : Void*
  fun get_screen_width = GetScreenWidth : LibC::Int
  fun set_window_height = GetScreenHeight : LibC::Int
  fun get_monitor_count = GetMonitorCount : LibC::Int
  fun get_current_monitor = GetCurrentMonitor : LibC::Int
  fun get_monitor_position = GetMonitorPosition(monitor : LibC::Int) : Vector2
  fun get_monitor_width = GetMonitorWidth(monitor : LibC::Int) : LibC::Int
  fun get_monitor_height = GetMonitorHeight(monitor : LibC::Int) : LibC::Int
  fun get_monitor_physical_width = GetMonitorPhysicalWidth(monitor : LibC::Int) : LibC::Int
  fun get_monitor_physical_height = GetMonitorPhysicalHeight(monitor : LibC::Int) : LibC::Int
  fun get_monitor_refresh_rate = GetMonitorPhysicalHeight(monitor : LibC::Int) : LibC::Int
  fun get_window_position = GetWindowPosition : Vector2
  fun get_window_scale_dpi = GetWindowScaleDPI : Vector2
  fun get_monitor_name = GetMonitorName(monitor : LibC::Int) : Char*
  fun set_clipboard_text = SetClipboardText(text : LibC::Char*)
  fun get_clipboard_text = GetClipboardText : Char*

  fun swap_screen_buffer = SwapScreenBuffer
  fun poll_input_events = PollInputEvents
  fun wait_time = WaitTime(ms : LibC::Float)

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
  fun begin_blend_mode = BeginBlendMode(mode : LibC::Int)
  fun end_blend_mode = EndBlendMode
  fun begin_scissor_mode = BeginScissorMode(x : LibC::Int, y : LibC::Int, width : LibC::Int, height : LibC::Int)
  fun end_scissor_mode = EndScissorMode
  fun begin_vr_stereo_mode = BeginVrStereoMode(vr_stereo_config : VrStereoConfig)
  fun end_vr_stereo_mode = EndVrStereoMode
  fun load_vr_stereo_config = LoadVrStereoConfig(device : VrDeviceInfo) : VrStereoConfig
  fun unload_vr_stereo_config = UnloadVrStereoConfig(config : VrStereoConfig)

  fun load_shader = LoadShader(vs_file_name : LibC::Char*, fs_file_name : LibC::Char*) : Shader
  fun load_shader_from_memory = LoadShaderFromMemory(vs_code : LibC::Char*, fs_code : LibC::Char*) : Shader
  fun get_shader_location = GetShaderLocation(shader : Shader, uniform_name : LibC::Char*) : LibC::Int
  fun get_shader_location_attrib = GetShaderLocationAttrib(shader : Shader, attrib_name : LibC::Char*) : LibC::Int
  fun set_shader_value = SetShaderValue(shader : Shader, loc_index : LibC::Int, value : Void*, uniform_type : LibC::Int)
  fun set_shader_value_v = SetShaderValueV(shader : Shader, loc_index : LibC::Int, value : Void*, uniform_type : LibC::Int, count : LibC::Int)
  fun set_shader_value_matrix = SetShaderValueMatrix(shader : Shader, loc_index : LibC::Int, mat : Matrix)
  fun set_shader_value_texture = SetShaderValueTexture(shader : Shader, loc_index : LibC::Int, texture : Texture2D)
  fun unload_shader = UnloadShader(shader : Shader)
  fun get_mouse_ray = GetMouseRay(mouse_position : Vector2, camera : Camera) : Ray
  fun get_camera_matrix = GetCameraMatrix(camera : Camera) : Matrix
  fun get_camera_matrix2_d = GetCameraMatrix2D(camera : Camera2D) : Matrix
  fun get_world_to_screen = GetWorldToScreen(position : Vector3, camera : Camera) : Vector2
  fun get_world_to_screen_ex = GetWorldToScreenEx(position : Vector3, camera : Camera, width : LibC::Int, height : LibC::Int) : Vector2
  fun get_world_to_screen2_d = GetWorldToScreen2D(position : Vector2, camera : Camera2D) : Vector2
  fun get_screen_to_world2_d = GetScreenToWorld2D(position : Vector2, camera : Camera2D) : Vector2
  fun set_target_fps = SetTargetFPS(fps : LibC::Int)
  fun get_fps = GetFPS : LibC::Int
  fun get_frame_time = GetFrameTime : LibC::Float
  fun get_time = GetTime : LibC::Double
  fun get_random_value = GetRandomValue(min : LibC::Int, max : LibC::Int) : LibC::Int
  fun set_random_seed = SetRandomSeed(seed : LibC::UInt)
  fun take_screenshot = TakeScreenshot(file_name : LibC::Char*)
  fun set_config_flags = SetConfigFlags(flags : LibC::UInt)
  fun trace_log = TraceLog(log_level : LibC::Int, text : LibC::Char*, ...)
  fun set_trace_log_level = SetTraceLogLevel(log_level : LibC::Int)
  fun mem_alloc = MemAlloc(size : LibC::Int) : Void*
  fun mem_realloc = MemRealloc(ptr : Void*, size : LibC::Int) : Void*
  fun mem_free = MemFree(ptr : Void*)
  fun load_file_data = LoadFileData(file_name : LibC::Char*, bytes_read : LibC::UInt*) : LibC::UChar*
  fun unload_file_data = UnloadFileData(data : LibC::UChar*)
  fun save_file_data? = SaveFileData(file_name : LibC::Char*, data : Void*, bytes_to_write : LibC::UInt) : Bool
  fun load_file_text = LoadFileText(file_name : LibC::Char*) : LibC::Char*
  fun unload_file_text = UnloadFileText(text : LibC::Char*)
  fun save_file_text? = SaveFileText(file_name : LibC::Char*, text : LibC::Char*) : Bool
  fun file_exists? = FileExists(file_name : LibC::Char*) : Bool
  fun directory_exists? = DirectoryExists(dir_path : LibC::Char*) : Bool
  fun file_extension? = IsFileExtension(file_name : LibC::Char*, ext : LibC::Char*) : Bool
  fun get_file_extension = GetFileExtension(file_name : LibC::Char*) : LibC::Char*
  fun get_file_name = GetFileName(file_path : LibC::Char*) : LibC::Char*
  fun get_file_name_without_ext = GetFileNameWithoutExt(file_path : LibC::Char*) : LibC::Char*
  fun get_directory_path = GetDirectoryPath(file_path : LibC::Char*) : LibC::Char*
  fun get_prev_directory_path = GetPrevDirectoryPath(dir_path : LibC::Char*) : LibC::Char*
  fun get_working_directory = GetWorkingDirectory : LibC::Char*
  fun get_directory_files = GetDirectoryFiles(dir_path : LibC::Char*, count : LibC::Int*) : LibC::Char**
  fun clear_directory_files = ClearDirectoryFiles
  fun change_directory? = ChangeDirectory(dir : LibC::Char*) : Bool
  fun file_dropped? = IsFileDropped : Bool
  fun get_dropped_files = GetDroppedFiles(count : LibC::Int*) : LibC::Char**
  fun clear_dropped_files = ClearDroppedFiles
  fun get_file_mod_time = GetFileModTime(file_name : LibC::Char*) : LibC::Long
  fun compress_data = CompressData(data : LibC::UChar*, data_length : LibC::Int, comp_data_length : LibC::Int*) : LibC::UChar*
  fun decompress_data = DecompressData(comp_data : LibC::UChar*, comp_data_length : LibC::Int, data_length : LibC::Int*) : LibC::UChar*
  fun encode_data_base64 = EncodeDataBase64(data : LibC::UChar*, data_length : LibC::Int, output_length : LibC::Int*) : LibC::Char*
  fun decode_data_base64 = DecodeDataBase64(data : LibC::UChar*, output_length : LibC::Int*) : LibC::UChar*
  fun save_storage_value? = SaveStorageValue(position : LibC::UInt, value : LibC::Int) : Bool
  fun load_storage_value = LoadStorageValue(position : LibC::UInt) : LibC::Int
  fun open_url = OpenURL(url : LibC::Char*)
  fun key_pressed? = IsKeyPressed(key : LibC::Int) : Bool
  fun key_down? = IsKeyDown(key : LibC::Int) : Bool
  fun key_released? = IsKeyReleased(key : LibC::Int) : Bool
  fun key_up? = IsKeyUp(key : LibC::Int) : Bool
  fun set_exit_key = SetExitKey(key : LibC::Int)
  fun get_key_pressed = GetKeyPressed : LibC::Int
  fun get_char_pressed = GetCharPressed : LibC::Int
  fun gamepad_available? = IsGamepadAvailable(gamepad : LibC::Int) : Bool
  fun get_gamepad_name = GetGamepadName(gamepad : LibC::Int) : LibC::Char*
  fun gamepad_button_pressed? = IsGamepadButtonPressed(gamepad : LibC::Int, button : LibC::Int) : Bool
  fun gamepad_button_down? = IsGamepadButtonDown(gamepad : LibC::Int, button : LibC::Int) : Bool
  fun gamepad_button_released? = IsGamepadButtonReleased(gamepad : LibC::Int, button : LibC::Int) : Bool
  fun gamepad_button_up? = IsGamepadButtonUp(gamepad : LibC::Int, button : LibC::Int) : Bool
  fun get_gamepad_button_pressed = GetGamepadButtonPressed : LibC::Int
  fun get_gamepad_axis_count = GetGamepadAxisCount(gamepad : LibC::Int) : LibC::Int
  fun get_gamepad_axis_movement = GetGamepadAxisMovement(gamepad : LibC::Int, axis : LibC::Int) : LibC::Float
  fun set_gamepad_mappings = SetGamepadMappings(mappings : LibC::Char*) : LibC::Int
  fun mouse_button_pressed? = IsMouseButtonPressed(button : LibC::Int) : Bool
  fun mouse_button_down? = IsMouseButtonDown(button : LibC::Int) : Bool
  fun mouse_button_released? = IsMouseButtonReleased(button : LibC::Int) : Bool
  fun mouse_button_up? = IsMouseButtonUp(button : LibC::Int) : Bool
  fun get_mouse_x = GetMouseX : LibC::Int
  fun get_mouse_y = GetMouseY : LibC::Int
  fun get_mouse_position = GetMousePosition : Vector2
  fun get_mouse_delta = GetMouseDelta : Vector2
  fun set_mouse_position = SetMousePosition(x : LibC::Int, y : LibC::Int)
  fun set_mouse_offset = SetMouseOffset(offset_x : LibC::Int, offset_y : LibC::Int)
  fun set_mouse_scale = SetMouseScale(scale_x : LibC::Float, scale_y : LibC::Float)
  fun get_mouse_wheel_move = GetMouseWheelMove : LibC::Float
  fun set_mouse_cursor = SetMouseCursor(cursor : LibC::Int)
  fun get_touch_x = GetTouchX : LibC::Int
  fun get_touch_y = GetTouchY : LibC::Int
  fun get_touch_position = GetTouchPosition(index : LibC::Int) : Vector2
  fun get_touch_point_id = GetTouchPointId(index : LibC::Int) : LibC::Int
  fun get_touch_point_count = GetTouchPointCount : LibC::Int
  fun set_gestures_enabled = SetGesturesEnabled(flags : LibC::UInt)
  fun gesture_detected? = IsGestureDetected(gesture : LibC::Int) : Bool
  fun get_gesture_detected = GetGestureDetected : LibC::Int
  fun get_gesture_hold_duration = GetGestureHoldDuration : LibC::Float
  fun get_gesture_drag_vector = GetGestureDragVector : Vector2
  fun get_gesture_drag_angle = GetGestureDragAngle : LibC::Float
  fun get_gesture_pinch_vector = GetGesturePinchVector : Vector2
  fun get_gesture_pinch_angle = GetGesturePinchAngle : LibC::Float
  fun set_camera_mode = SetCameraMode(camera : Camera, mode : LibC::Int)
  fun update_camera = UpdateCamera(camera : Camera*)
  fun set_camera_pan_control = SetCameraPanControl(key_pan : LibC::Int)
  fun set_camera_alt_control = SetCameraAltControl(key_alt : LibC::Int)
  fun set_camera_smooth_zoom_control = SetCameraSmoothZoomControl(key_smooth_zoom : LibC::Int)
  fun set_camera_move_controls = SetCameraMoveControls(key_front : LibC::Int, key_back : LibC::Int, key_right : LibC::Int, key_left : LibC::Int, key_up : LibC::Int, key_down : LibC::Int)
  fun set_shapes_texture = SetShapesTexture(texture : Texture2D, source : Rectangle)
  fun draw_pixel = DrawPixel(pos_x : LibC::Int, pos_y : LibC::Int, color : Color)
  fun draw_pixel_v = DrawPixelV(position : Vector2, color : Color)
  fun draw_line = DrawLine(start_pos_x : LibC::Int, start_pos_y : LibC::Int, end_pos_x : LibC::Int, end_pos_y : LibC::Int, color : Color)
  fun draw_line_v = DrawLineV(start_pos : Vector2, end_pos : Vector2, color : Color)
  fun draw_line_ex = DrawLineEx(start_pos : Vector2, end_pos : Vector2, thick : LibC::Float, color : Color)
  fun draw_line_bezier = DrawLineBezier(start_pos : Vector2, end_pos : Vector2, thick : LibC::Float, color : Color)
  fun draw_line_bezier_quad = DrawLineBezierQuad(start_pos : Vector2, end_pos : Vector2, control_pos : Vector2, thick : LibC::Float, color : Color)
  fun draw_line_bezier_cubic = DrawLineBezierCubic(start_pos : Vector2, end_pos : Vector2, start_control_pos : Vector2, end_control_pos : Vector2, thick : LibC::Float, color : Color)
  fun draw_line_strip = DrawLineStrip(points : Vector2*, point_count : LibC::Int, color : Color)
  fun draw_circle = DrawCircle(center_x : LibC::Int, center_y : LibC::Int, radius : LibC::Float, color : Color)
  fun draw_circle_sector = DrawCircleSector(center : Vector2, radius : LibC::Float, start_angle : LibC::Float, end_angle : LibC::Float, segments : LibC::Int, color : Color)
  fun draw_circle_sector_lines = DrawCircleSectorLines(center : Vector2, radius : LibC::Float, start_angle : LibC::Float, end_angle : LibC::Float, segments : LibC::Int, color : Color)
  fun draw_circle_gradient = DrawCircleGradient(center_x : LibC::Int, center_y : LibC::Int, radius : LibC::Float, color1 : Color, color2 : Color)
  fun draw_circle_v = DrawCircleV(center : Vector2, radius : LibC::Float, color : Color)
  fun draw_circle_lines = DrawCircleLines(center_x : LibC::Int, center_y : LibC::Int, radius : LibC::Float, color : Color)
  fun draw_ellipse = DrawEllipse(center_x : LibC::Int, center_y : LibC::Int, radius_h : LibC::Float, radius_v : LibC::Float, color : Color)
  fun draw_ellipse_lines = DrawEllipseLines(center_x : LibC::Int, center_y : LibC::Int, radius_h : LibC::Float, radius_v : LibC::Float, color : Color)
  fun draw_ring = DrawRing(center : Vector2, inner_radius : LibC::Float, outer_radius : LibC::Float, start_angle : LibC::Float, end_angle : LibC::Float, segments : LibC::Int, color : Color)
  fun draw_ring_lines = DrawRingLines(center : Vector2, inner_radius : LibC::Float, outer_radius : LibC::Float, start_angle : LibC::Float, end_angle : LibC::Float, segments : LibC::Int, color : Color)
  fun draw_rectangle = DrawRectangle(pos_x : LibC::Int, pos_y : LibC::Int, width : LibC::Int, height : LibC::Int, color : Color)
  fun draw_rectangle_v = DrawRectangleV(position : Vector2, size : Vector2, color : Color)
  fun draw_rectangle_rec = DrawRectangleRec(rec : Rectangle, color : Color)
  fun draw_rectangle_pro = DrawRectanglePro(rec : Rectangle, origin : Vector2, rotation : LibC::Float, color : Color)
  fun draw_rectangle_gradient_v = DrawRectangleGradientV(pos_x : LibC::Int, pos_y : LibC::Int, width : LibC::Int, height : LibC::Int, color1 : Color, color2 : Color)
  fun draw_rectangle_gradient_h = DrawRectangleGradientH(pos_x : LibC::Int, pos_y : LibC::Int, width : LibC::Int, height : LibC::Int, color1 : Color, color2 : Color)
  fun draw_rectangle_gradient_ex = DrawRectangleGradientEx(rec : Rectangle, col1 : Color, col2 : Color, col3 : Color, col4 : Color)
  fun draw_rectangle_lines = DrawRectangleLines(pos_x : LibC::Int, pos_y : LibC::Int, width : LibC::Int, height : LibC::Int, color : Color)
  fun draw_rectangle_lines_ex = DrawRectangleLinesEx(rec : Rectangle, line_thick : LibC::Float, color : Color)
  fun draw_rectangle_rounded = DrawRectangleRounded(rec : Rectangle, roundness : LibC::Float, segments : LibC::Int, color : Color)
  fun draw_rectangle_rounded_lines = DrawRectangleRoundedLines(rec : Rectangle, roundness : LibC::Float, segments : LibC::Int, line_thick : LibC::Float, color : Color)
  fun draw_triangle = DrawTriangle(v1 : Vector2, v2 : Vector2, v3 : Vector2, color : Color)
  fun draw_triangle_lines = DrawTriangleLines(v1 : Vector2, v2 : Vector2, v3 : Vector2, color : Color)
  fun draw_triangle_fan = DrawTriangleFan(points : Vector2*, point_count : LibC::Int, color : Color)
  fun draw_triangle_strip = DrawTriangleStrip(points : Vector2*, point_count : LibC::Int, color : Color)
  fun draw_poly = DrawPoly(center : Vector2, sides : LibC::Int, radius : LibC::Float, rotation : LibC::Float, color : Color)
  fun draw_poly_lines = DrawPolyLines(center : Vector2, sides : LibC::Int, radius : LibC::Float, rotation : LibC::Float, color : Color)
  fun draw_poly_lines_ex = DrawPolyLinesEx(center : Vector2, sides : LibC::Int, radius : LibC::Float, rotation : LibC::Float, line_thick : LibC::Float, color : Color)
  fun check_collision_recs? = CheckCollisionRecs(rec1 : Rectangle, rec2 : Rectangle) : Bool
  fun check_collision_circles? = CheckCollisionCircles(center1 : Vector2, radius1 : LibC::Float, center2 : Vector2, radius2 : LibC::Float) : Bool
  fun check_collision_circle_rec? = CheckCollisionCircleRec(center : Vector2, radius : LibC::Float, rec : Rectangle) : Bool
  fun check_collision_point_rec? = CheckCollisionPointRec(point : Vector2, rec : Rectangle) : Bool
  fun check_collision_point_circle? = CheckCollisionPointCircle(point : Vector2, center : Vector2, radius : LibC::Float) : Bool
  fun check_collision_point_triangle? = CheckCollisionPointTriangle(point : Vector2, p1 : Vector2, p2 : Vector2, p3 : Vector2) : Bool
  fun check_collision_lines? = CheckCollisionLines(start_pos1 : Vector2, end_pos1 : Vector2, start_pos2 : Vector2, end_pos2 : Vector2, collision_point : Vector2*) : Bool
  fun check_collision_point_line? = CheckCollisionPointLine(point : Vector2, p1 : Vector2, p2 : Vector2, threshold : LibC::Int) : Bool
  fun get_collision_rec = GetCollisionRec(rec1 : Rectangle, rec2 : Rectangle) : Rectangle
  fun load_image = LoadImage(file_name : LibC::Char*) : Image
  fun load_image_raw = LoadImageRaw(file_name : LibC::Char*, width : LibC::Int, height : LibC::Int, format : LibC::Int, header_size : LibC::Int) : Image
  fun load_image_anim = LoadImageAnim(file_name : LibC::Char*, frames : LibC::Int*) : Image
  fun load_image_from_memory = LoadImageFromMemory(file_type : LibC::Char*, file_data : LibC::UChar*, data_size : LibC::Int) : Image
  fun load_image_from_texture = LoadImageFromTexture(texture : Texture2D) : Image
  fun load_image_from_screen = LoadImageFromScreen : Image
  fun unload_image = UnloadImage(image : Image)
  fun export_image? = ExportImage(image : Image, file_name : LibC::Char*) : Bool
  fun export_image_as_code? = ExportImageAsCode(image : Image, file_name : LibC::Char*) : Bool
  fun gen_image_color = GenImageColor(width : LibC::Int, height : LibC::Int, color : Color) : Image
  fun gen_image_gradient_v = GenImageGradientV(width : LibC::Int, height : LibC::Int, top : Color, bottom : Color) : Image
  fun gen_image_gradient_h = GenImageGradientH(width : LibC::Int, height : LibC::Int, left : Color, right : Color) : Image
  fun gen_image_gradient_radial = GenImageGradientRadial(width : LibC::Int, height : LibC::Int, density : LibC::Float, inner : Color, outer : Color) : Image
  fun gen_image_checked = GenImageChecked(width : LibC::Int, height : LibC::Int, checks_x : LibC::Int, checks_y : LibC::Int, col1 : Color, col2 : Color) : Image
  fun gen_image_white_noise = GenImageWhiteNoise(width : LibC::Int, height : LibC::Int, factor : LibC::Float) : Image
  fun gen_image_cellular = GenImageCellular(width : LibC::Int, height : LibC::Int, tile_size : LibC::Int) : Image
  fun image_copy = ImageCopy(image : Image) : Image
  fun image_from_image = ImageFromImage(image : Image, rec : Rectangle) : Image
  fun image_text = ImageText(text : LibC::Char*, font_size : LibC::Int, color : Color) : Image
  fun image_text_ex = ImageTextEx(font : Font, text : LibC::Char*, font_size : LibC::Float, spacing : LibC::Float, tint : Color) : Image
  fun image_format = ImageFormat(image : Image*, new_format : LibC::Int)
  fun image_to_pot = ImageToPOT(image : Image*, fill : Color)
  fun image_crop = ImageCrop(image : Image*, crop : Rectangle)
  fun image_alpha_crop = ImageAlphaCrop(image : Image*, threshold : LibC::Float)
  fun image_alpha_clear = ImageAlphaClear(image : Image*, color : Color, threshold : LibC::Float)
  fun image_alpha_mask = ImageAlphaMask(image : Image*, alpha_mask : Image)
  fun image_alpha_premultiply = ImageAlphaPremultiply(image : Image*)
  fun image_resize = ImageResize(image : Image*, new_width : LibC::Int, new_height : LibC::Int)
  fun image_resize_nn = ImageResizeNN(image : Image*, new_width : LibC::Int, new_height : LibC::Int)
  fun image_resize_canvas = ImageResizeCanvas(image : Image*, new_width : LibC::Int, new_height : LibC::Int, offset_x : LibC::Int, offset_y : LibC::Int, fill : Color)
  fun image_mipmaps = ImageMipmaps(image : Image*)
  fun image_dither = ImageDither(image : Image*, r_bpp : LibC::Int, g_bpp : LibC::Int, b_bpp : LibC::Int, a_bpp : LibC::Int)
  fun image_flip_vertical = ImageFlipVertical(image : Image*)
  fun image_flip_horizontal = ImageFlipHorizontal(image : Image*)
  fun image_rotate_cw = ImageRotateCW(image : Image*)
  fun image_rotate_ccw = ImageRotateCCW(image : Image*)
  fun image_color_tint = ImageColorTint(image : Image*, color : Color)
  fun image_color_invert = ImageColorInvert(image : Image*)
  fun image_color_grayscale = ImageColorGrayscale(image : Image*)
  fun image_color_contrast = ImageColorContrast(image : Image*, contrast : LibC::Float)
  fun image_color_brightness = ImageColorBrightness(image : Image*, brightness : LibC::Int)
  fun image_color_replace = ImageColorReplace(image : Image*, color : Color, replace : Color)
  fun load_image_colors = LoadImageColors(image : Image) : Color*
  fun load_image_palette = LoadImagePalette(image : Image, max_palette_size : LibC::Int, color_count : LibC::Int*) : Color*
  fun unload_image_colors = UnloadImageColors(colors : Color*)
  fun unload_image_palette = UnloadImagePalette(colors : Color*)
  fun get_image_alpha_border = GetImageAlphaBorder(image : Image, threshold : LibC::Float) : Rectangle
  fun get_image_color = GetImageColor(image : Image, x : LibC::Int, y : LibC::Int) : Color
  fun image_clear_background = ImageClearBackground(dst : Image*, color : Color)
  fun image_draw_pixel = ImageDrawPixel(dst : Image*, pos_x : LibC::Int, pos_y : LibC::Int, color : Color)
  fun image_draw_pixel_v = ImageDrawPixelV(dst : Image*, position : Vector2, color : Color)
  fun image_draw_line = ImageDrawLine(dst : Image*, start_pos_x : LibC::Int, start_pos_y : LibC::Int, end_pos_x : LibC::Int, end_pos_y : LibC::Int, color : Color)
  fun image_draw_line_v = ImageDrawLineV(dst : Image*, start : Vector2, end : Vector2, color : Color)
  fun image_draw_circle = ImageDrawCircle(dst : Image*, center_x : LibC::Int, center_y : LibC::Int, radius : LibC::Int, color : Color)
  fun image_draw_circle_v = ImageDrawCircleV(dst : Image*, center : Vector2, radius : LibC::Int, color : Color)
  fun image_draw_rectangle = ImageDrawRectangle(dst : Image*, pos_x : LibC::Int, pos_y : LibC::Int, width : LibC::Int, height : LibC::Int, color : Color)
  fun image_draw_rectangle_v = ImageDrawRectangleV(dst : Image*, position : Vector2, size : Vector2, color : Color)
  fun image_draw_rectangle_rec = ImageDrawRectangleRec(dst : Image*, rec : Rectangle, color : Color)
  fun image_draw_rectangle_lines = ImageDrawRectangleLines(dst : Image*, rec : Rectangle, thick : LibC::Int, color : Color)
  fun image_draw = ImageDraw(dst : Image*, src : Image, src_rec : Rectangle, dst_rec : Rectangle, tint : Color)
  fun image_draw_text = ImageDrawText(dst : Image*, text : LibC::Char*, pos_x : LibC::Int, pos_y : LibC::Int, font_size : LibC::Int, color : Color)
  fun image_draw_text_ex = ImageDrawTextEx(dst : Image*, font : Font, text : LibC::Char*, position : Vector2, font_size : LibC::Float, spacing : LibC::Float, tint : Color)
  fun load_texture = LoadTexture(file_name : LibC::Char*) : Texture2D
  fun load_texture_from_image = LoadTextureFromImage(image : Image) : Texture2D
  fun load_texture_cubemap = LoadTextureCubemap(image : Image, layout : LibC::Int) : TextureCubemap
  fun load_render_texture = LoadRenderTexture(width : LibC::Int, height : LibC::Int) : RenderTexture2D
  fun unload_texture = UnloadTexture(texture : Texture2D)
  fun unload_render_texture = UnloadRenderTexture(target : RenderTexture2D)
  fun update_texture = UpdateTexture(texture : Texture2D, pixels : Void*)
  fun update_texture_rec = UpdateTextureRec(texture : Texture2D, rec : Rectangle, pixels : Void*)
  fun gen_texture_mipmaps = GenTextureMipmaps(texture : Texture2D*)
  fun set_texture_filter = SetTextureFilter(texture : Texture2D, filter : LibC::Int)
  fun set_texture_wrap = SetTextureWrap(texture : Texture2D, wrap : LibC::Int)
  fun draw_texture = DrawTexture(texture : Texture2D, pos_x : LibC::Int, pos_y : LibC::Int, tint : Color)
  fun draw_texture_v = DrawTextureV(texture : Texture2D, position : Vector2, tint : Color)
  fun draw_texture_ex = DrawTextureEx(texture : Texture2D, position : Vector2, rotation : LibC::Float, scale : LibC::Float, tint : Color)
  fun draw_texture_rec = DrawTextureRec(texture : Texture2D, source : Rectangle, position : Vector2, tint : Color)
  fun draw_texture_quad = DrawTextureQuad(texture : Texture2D, tiling : Vector2, offset : Vector2, quad : Rectangle, tint : Color)
  fun draw_texture_tiled = DrawTextureTiled(texture : Texture2D, source : Rectangle, dest : Rectangle, origin : Vector2, rotation : LibC::Float, scale : LibC::Float, tint : Color)
  fun draw_texture_pro = DrawTexturePro(texture : Texture2D, source : Rectangle, dest : Rectangle, origin : Vector2, rotation : LibC::Float, tint : Color)
  fun draw_texture_n_patch = DrawTextureNPatch(texture : Texture2D, n_patch_info : NPatchInfo, dest : Rectangle, origin : Vector2, rotation : LibC::Float, tint : Color)
  fun draw_texture_poly = DrawTexturePoly(texture : Texture2D, center : Vector2, points : Vector2*, texcoords : Vector2*, point_count : LibC::Int, tint : Color)
  fun fade = Fade(color : Color, alpha : LibC::Float) : Color
  fun color_to_int = ColorToInt(color : Color) : LibC::Int
  fun color_normalize = ColorNormalize(color : Color) : Vector4
  fun color_from_normalized = ColorFromNormalized(normalized : Vector4) : Color
  fun color_to_hsv = ColorToHSV(color : Color) : Vector3
  fun color_from_hsv = ColorFromHSV(hue : LibC::Float, saturation : LibC::Float, value : LibC::Float) : Color
  fun color_alpha = ColorAlpha(color : Color, alpha : LibC::Float) : Color
  fun color_alpha_blend = ColorAlphaBlend(dst : Color, src : Color, tint : Color) : Color
  fun get_color = GetColor(hex_value : LibC::UInt) : Color
  fun get_pixel_color = GetPixelColor(src_ptr : Void*, format : LibC::Int) : Color
  fun set_pixel_color = SetPixelColor(dst_ptr : Void*, color : Color, format : LibC::Int)
  fun get_pixel_data_size = GetPixelDataSize(width : LibC::Int, height : LibC::Int, format : LibC::Int) : LibC::Int
  fun get_font_default = GetFontDefault : Font
  fun load_font = LoadFont(file_name : LibC::Char*) : Font
  fun load_font_ex = LoadFontEx(file_name : LibC::Char*, font_size : LibC::Int, font_chars : LibC::Int*, glyph_count : LibC::Int) : Font
  fun load_font_from_image = LoadFontFromImage(image : Image, key : Color, first_char : LibC::Int) : Font
  fun load_font_from_memory = LoadFontFromMemory(file_type : LibC::Char*, file_data : LibC::UChar*, data_size : LibC::Int, font_size : LibC::Int, font_chars : LibC::Int*, glyph_count : LibC::Int) : Font
  fun load_font_data = LoadFontData(file_data : LibC::UChar*, data_size : LibC::Int, font_size : LibC::Int, font_chars : LibC::Int*, glyph_count : LibC::Int, type : LibC::Int) : GlyphInfo*
  fun gen_image_font_atlas = GenImageFontAtlas(chars : GlyphInfo*, recs : Rectangle**, glyph_count : LibC::Int, font_size : LibC::Int, padding : LibC::Int, pack_method : LibC::Int) : Image
  fun unload_font_data = UnloadFontData(chars : GlyphInfo*, glyph_count : LibC::Int)
  fun unload_font = UnloadFont(font : Font)
  fun draw_fps = DrawFPS(pos_x : LibC::Int, pos_y : LibC::Int)
  fun draw_text = DrawText(text : LibC::Char*, pos_x : LibC::Int, pos_y : LibC::Int, font_size : LibC::Int, color : Color)
  fun draw_text_ex = DrawTextEx(font : Font, text : LibC::Char*, position : Vector2, font_size : LibC::Float, spacing : LibC::Float, tint : Color)
  fun draw_text_pro = DrawTextPro(font : Font, text : LibC::Char*, position : Vector2, origin : Vector2, rotation : LibC::Float, font_size : LibC::Float, spacing : LibC::Float, tint : Color)
  fun draw_text_codepoint = DrawTextCodepoint(font : Font, codepoint : LibC::Int, position : Vector2, font_size : LibC::Float, tint : Color)
  fun measure_text = MeasureText(text : LibC::Char*, font_size : LibC::Int) : LibC::Int
  fun measure_text_ex = MeasureTextEx(font : Font, text : LibC::Char*, font_size : LibC::Float, spacing : LibC::Float) : Vector2
  fun get_glyph_index = GetGlyphIndex(font : Font, codepoint : LibC::Int) : LibC::Int
  fun get_glyph_info = GetGlyphInfo(font : Font, codepoint : LibC::Int) : GlyphInfo
  fun get_glyph_atlas_rec = GetGlyphAtlasRec(font : Font, codepoint : LibC::Int) : Rectangle
  fun load_codepoints = LoadCodepoints(text : LibC::Char*, count : LibC::Int*) : LibC::Int*
  fun unload_codepoints = UnloadCodepoints(codepoints : LibC::Int*)
  fun get_codepoint_count = GetCodepointCount(text : LibC::Char*) : LibC::Int
  fun get_codepoint = GetCodepoint(text : LibC::Char*, bytes_processed : LibC::Int*) : LibC::Int
  fun codepoint_to_utf8 = CodepointToUTF8(codepoint : LibC::Int, byte_size : LibC::Int*) : LibC::Char*
  fun text_codepoints_to_utf8 = TextCodepointsToUTF8(codepoints : LibC::Int*, length : LibC::Int) : LibC::Char*
  fun text_copy = TextCopy(dst : LibC::Char*, src : LibC::Char*) : LibC::Int
  fun text_is_equal? = TextIsEqual(text1 : LibC::Char*, text2 : LibC::Char*) : Bool
  fun text_length = TextLength(text : LibC::Char*) : LibC::UInt
  fun text_format = TextFormat(text : LibC::Char*, ...) : LibC::Char*
  fun text_subtext = TextSubtext(text : LibC::Char*, position : LibC::Int, length : LibC::Int) : LibC::Char*
  fun text_replace = TextReplace(text : LibC::Char*, replace : LibC::Char*, by : LibC::Char*) : LibC::Char*
  fun text_insert = TextInsert(text : LibC::Char*, insert : LibC::Char*, position : LibC::Int) : LibC::Char*
  fun text_join = TextJoin(text_list : LibC::Char**, count : LibC::Int, delimiter : LibC::Char*) : LibC::Char*
  fun text_split = TextSplit(text : LibC::Char*, delimiter : LibC::Char, count : LibC::Int*) : LibC::Char**
  fun text_append = TextAppend(text : LibC::Char*, append : LibC::Char*, position : LibC::Int*)
  fun text_find_index = TextFindIndex(text : LibC::Char*, find : LibC::Char*) : LibC::Int
  fun text_to_upper = TextToUpper(text : LibC::Char*) : LibC::Char*
  fun text_to_lower = TextToLower(text : LibC::Char*) : LibC::Char*
  fun text_to_pascal = TextToPascal(text : LibC::Char*) : LibC::Char*
  fun text_to_integer = TextToInteger(text : LibC::Char*) : LibC::Int
  fun draw_line3_d = DrawLine3D(start_pos : Vector3, end_pos : Vector3, color : Color)
  fun draw_point3_d = DrawPoint3D(position : Vector3, color : Color)
  fun draw_circle3_d = DrawCircle3D(center : Vector3, radius : LibC::Float, rotation_axis : Vector3, rotation_angle : LibC::Float, color : Color)
  fun draw_triangle3_d = DrawTriangle3D(v1 : Vector3, v2 : Vector3, v3 : Vector3, color : Color)
  fun draw_triangle_strip3_d = DrawTriangleStrip3D(points : Vector3*, point_count : LibC::Int, color : Color)
  fun draw_cube = DrawCube(position : Vector3, width : LibC::Float, height : LibC::Float, length : LibC::Float, color : Color)
  fun draw_cube_v = DrawCubeV(position : Vector3, size : Vector3, color : Color)
  fun draw_cube_wires = DrawCubeWires(position : Vector3, width : LibC::Float, height : LibC::Float, length : LibC::Float, color : Color)
  fun draw_cube_wires_v = DrawCubeWiresV(position : Vector3, size : Vector3, color : Color)
  fun draw_cube_texture = DrawCubeTexture(texture : Texture2D, position : Vector3, width : LibC::Float, height : LibC::Float, length : LibC::Float, color : Color)
  fun draw_cube_texture_rec = DrawCubeTextureRec(texture : Texture2D, source : Rectangle, position : Vector3, width : LibC::Float, height : LibC::Float, length : LibC::Float, color : Color)
  fun draw_sphere = DrawSphere(center_pos : Vector3, radius : LibC::Float, color : Color)
  fun draw_sphere_ex = DrawSphereEx(center_pos : Vector3, radius : LibC::Float, rings : LibC::Int, slices : LibC::Int, color : Color)
  fun draw_sphere_wires = DrawSphereWires(center_pos : Vector3, radius : LibC::Float, rings : LibC::Int, slices : LibC::Int, color : Color)
  fun draw_cylinder = DrawCylinder(position : Vector3, radius_top : LibC::Float, radius_bottom : LibC::Float, height : LibC::Float, slices : LibC::Int, color : Color)
  fun draw_cylinder_ex = DrawCylinderEx(start_pos : Vector3, end_pos : Vector3, start_radius : LibC::Float, end_radius : LibC::Float, sides : LibC::Int, color : Color)
  fun draw_cylinder_wires = DrawCylinderWires(position : Vector3, radius_top : LibC::Float, radius_bottom : LibC::Float, height : LibC::Float, slices : LibC::Int, color : Color)
  fun draw_cylinder_wires_ex = DrawCylinderWiresEx(start_pos : Vector3, end_pos : Vector3, start_radius : LibC::Float, end_radius : LibC::Float, sides : LibC::Int, color : Color)
  fun draw_plane = DrawPlane(center_pos : Vector3, size : Vector2, color : Color)
  fun draw_ray = DrawRay(ray : Ray, color : Color)
  fun draw_grid = DrawGrid(slices : LibC::Int, spacing : LibC::Float)
  fun load_model = LoadModel(file_name : LibC::Char*) : Model
  fun load_model_from_mesh = LoadModelFromMesh(mesh : Mesh) : Model
  fun unload_model = UnloadModel(model : Model)
  fun unload_model_keep_meshes = UnloadModelKeepMeshes(model : Model)
  fun get_model_bounding_box = GetModelBoundingBox(model : Model) : BoundingBox
  fun draw_model = DrawModel(model : Model, position : Vector3, scale : LibC::Float, tint : Color)
  fun draw_model_ex = DrawModelEx(model : Model, position : Vector3, rotation_axis : Vector3, rotation_angle : LibC::Float, scale : Vector3, tint : Color)
  fun draw_model_wires = DrawModelWires(model : Model, position : Vector3, scale : LibC::Float, tint : Color)
  fun draw_model_wires_ex = DrawModelWiresEx(model : Model, position : Vector3, rotation_axis : Vector3, rotation_angle : LibC::Float, scale : Vector3, tint : Color)
  fun draw_bounding_box = DrawBoundingBox(box : BoundingBox, color : Color)
  fun draw_billboard = DrawBillboard(camera : Camera, texture : Texture2D, position : Vector3, size : LibC::Float, tint : Color)
  fun draw_billboard_rec = DrawBillboardRec(camera : Camera, texture : Texture2D, source : Rectangle, position : Vector3, size : Vector2, tint : Color)
  fun draw_billboard_pro = DrawBillboardPro(camera : Camera, texture : Texture2D, source : Rectangle, position : Vector3, up : Vector3, size : Vector2, origin : Vector2, rotation : LibC::Float, tint : Color)
  fun upload_mesh = UploadMesh(mesh : Mesh*, dynamic : Bool)
  fun update_mesh_buffer = UpdateMeshBuffer(mesh : Mesh, index : LibC::Int, data : Void*, data_size : LibC::Int, offset : LibC::Int)
  fun unload_mesh = UnloadMesh(mesh : Mesh)
  fun draw_mesh = DrawMesh(mesh : Mesh, material : Material, transform : Matrix)
  fun draw_mesh_instanced = DrawMeshInstanced(mesh : Mesh, material : Material, transforms : Matrix*, instances : LibC::Int)
  fun export_mesh? = ExportMesh(mesh : Mesh, file_name : LibC::Char*) : Bool
  fun get_mesh_bounding_box = GetMeshBoundingBox(mesh : Mesh) : BoundingBox
  fun gen_mesh_tangents = GenMeshTangents(mesh : Mesh*)
  fun gen_mesh_binormals = GenMeshBinormals(mesh : Mesh*)
  fun gen_mesh_poly = GenMeshPoly(sides : LibC::Int, radius : LibC::Float) : Mesh
  fun gen_mesh_plane = GenMeshPlane(width : LibC::Float, length : LibC::Float, res_x : LibC::Int, res_z : LibC::Int) : Mesh
  fun gen_mesh_cube = GenMeshCube(width : LibC::Float, height : LibC::Float, length : LibC::Float) : Mesh
  fun gen_mesh_sphere = GenMeshSphere(radius : LibC::Float, rings : LibC::Int, slices : LibC::Int) : Mesh
  fun gen_mesh_hemi_sphere = GenMeshHemiSphere(radius : LibC::Float, rings : LibC::Int, slices : LibC::Int) : Mesh
  fun gen_mesh_cylinder = GenMeshCylinder(radius : LibC::Float, height : LibC::Float, slices : LibC::Int) : Mesh
  fun gen_mesh_cone = GenMeshCone(radius : LibC::Float, height : LibC::Float, slices : LibC::Int) : Mesh
  fun gen_mesh_torus = GenMeshTorus(radius : LibC::Float, size : LibC::Float, rad_seg : LibC::Int, sides : LibC::Int) : Mesh
  fun gen_mesh_knot = GenMeshKnot(radius : LibC::Float, size : LibC::Float, rad_seg : LibC::Int, sides : LibC::Int) : Mesh
  fun gen_mesh_heightmap = GenMeshHeightmap(heightmap : Image, size : Vector3) : Mesh
  fun gen_mesh_cubicmap = GenMeshCubicmap(cubicmap : Image, cube_size : Vector3) : Mesh
  fun load_materials = LoadMaterials(file_name : LibC::Char*, material_count : LibC::Int*) : Material*
  fun load_material_default = LoadMaterialDefault : Material
  fun unload_material = UnloadMaterial(material : Material)
  fun set_material_texture = SetMaterialTexture(material : Material*, map_type : LibC::Int, texture : Texture2D)
  fun set_model_mesh_material = SetModelMeshMaterial(model : Model*, mesh_id : LibC::Int, material_id : LibC::Int)
  fun load_model_animations = LoadModelAnimations(file_name : LibC::Char*, anim_count : LibC::UInt*) : ModelAnimation*
  fun update_model_animation = UpdateModelAnimation(model : Model, anim : ModelAnimation, frame : LibC::Int)
  fun unload_model_animation = UnloadModelAnimation(anim : ModelAnimation)
  fun unload_model_animations = UnloadModelAnimations(animations : ModelAnimation*, count : LibC::UInt)
  fun model_animation_valid? = IsModelAnimationValid(model : Model, anim : ModelAnimation) : Bool
  fun check_collision_spheres? = CheckCollisionSpheres(center1 : Vector3, radius1 : LibC::Float, center2 : Vector3, radius2 : LibC::Float) : Bool
  fun check_collision_boxes? = CheckCollisionBoxes(box1 : BoundingBox, box2 : BoundingBox) : Bool
  fun check_collision_box_sphere? = CheckCollisionBoxSphere(box : BoundingBox, center : Vector3, radius : LibC::Float) : Bool
  fun get_ray_collision_sphere = GetRayCollisionSphere(ray : Ray, center : Vector3, radius : LibC::Float) : RayCollision
  fun get_ray_collision_box = GetRayCollisionBox(ray : Ray, box : BoundingBox) : RayCollision
  fun get_ray_collision_model = GetRayCollisionModel(ray : Ray, model : Model) : RayCollision
  fun get_ray_collision_mesh = GetRayCollisionMesh(ray : Ray, mesh : Mesh, transform : Matrix) : RayCollision
  fun get_ray_collision_triangle = GetRayCollisionTriangle(ray : Ray, p1 : Vector3, p2 : Vector3, p3 : Vector3) : RayCollision
  fun get_ray_collision_quad = GetRayCollisionQuad(ray : Ray, p1 : Vector3, p2 : Vector3, p3 : Vector3, p4 : Vector3) : RayCollision
  fun init_audio_device = InitAudioDevice
  fun close_audio_device = CloseAudioDevice
  fun audio_device_ready? = IsAudioDeviceReady : Bool
  fun set_master_volume = SetMasterVolume(volume : LibC::Float)
  fun load_wave = LoadWave(file_name : LibC::Char*) : Wave
  fun load_wave_from_memory = LoadWaveFromMemory(file_type : LibC::Char*, file_data : LibC::UChar*, data_size : LibC::Int) : Wave
  fun load_sound = LoadSound(file_name : LibC::Char*) : Sound
  fun load_sound_from_wave = LoadSoundFromWave(wave : Wave) : Sound
  fun update_sound = UpdateSound(sound : Sound, data : Void*, sample_count : LibC::Int)
  fun unload_wave = UnloadWave(wave : Wave)
  fun unload_sound = UnloadSound(sound : Sound)
  fun export_wave? = ExportWave(wave : Wave, file_name : LibC::Char*) : Bool
  fun export_wave_as_code? = ExportWaveAsCode(wave : Wave, file_name : LibC::Char*) : Bool
  fun play_sound = PlaySound(sound : Sound)
  fun stop_sound = StopSound(sound : Sound)
  fun pause_sound = PauseSound(sound : Sound)
  fun resume_sound = ResumeSound(sound : Sound)
  fun play_sound_multi = PlaySoundMulti(sound : Sound)
  fun stop_sound_multi = StopSoundMulti
  fun get_sounds_playing = GetSoundsPlaying : LibC::Int
  fun sound_playing? = IsSoundPlaying(sound : Sound) : Bool
  fun set_sound_volume = SetSoundVolume(sound : Sound, volume : LibC::Float)
  fun set_sound_pitch = SetSoundPitch(sound : Sound, pitch : LibC::Float)
  fun wave_format = WaveFormat(wave : Wave*, sample_rate : LibC::Int, sample_size : LibC::Int, channels : LibC::Int)
  fun wave_copy = WaveCopy(wave : Wave) : Wave
  fun wave_crop = WaveCrop(wave : Wave*, init_sample : LibC::Int, final_sample : LibC::Int)
  fun load_wave_samples = LoadWaveSamples(wave : Wave) : LibC::Float*
  fun unload_wave_samples = UnloadWaveSamples(samples : LibC::Float*)
  fun load_music_stream = LoadMusicStream(file_name : LibC::Char*) : Music
  fun load_music_stream_from_memory = LoadMusicStreamFromMemory(file_type : LibC::Char*, data : LibC::UChar*, data_size : LibC::Int) : Music
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
  fun get_music_time_length = GetMusicTimeLength(music : Music) : LibC::Float
  fun get_music_time_played = GetMusicTimePlayed(music : Music) : LibC::Float
  fun load_audio_stream = LoadAudioStream(sample_rate : LibC::UInt, sample_size : LibC::UInt, channels : LibC::UInt) : AudioStream
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
  fun set_audio_stream_buffer_size_default = SetAudioStreamBufferSizeDefault(size : LibC::Int)
end
