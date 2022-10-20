@[Link("raylib")]
lib LibRaylib
  PI      =    3.141592653589793
  DEG2RAD = 0.017453292519943295
  RAD2DEG =    57.29577951308232

  alias Camera = Camera3D
  alias TextureCubemap = Texture2D
  alias AudioCallback = Proc(Void*, LibC::UInt)
  
  enum ConfigFlags
    VSyncHint         = 0x00000040
    FullscreenMode    = 0x00000002
    WindowResizable   = 0x00000004
    WindowUndecorated = 0x00000008
    WindowHidden      = 0x00000080
    WindowMinimized   = 0x00000200
    WindowMaximized   = 0x00000400
    WindowUnfocused   = 0x00000800
    WindowTopmost     = 0x00001000
    WindowAlwaysRun   = 0x00000100
    WindowTransparent = 0x00000010
    WindowHighdpi     = 0x00002000
    MSAA4xHint        = 0x00000020
    InterlacedHint    = 0x00010000
  end

  enum TraceLogLevel
    All     = 0
    Trace   = 1
    Debug   = 2
    Info    = 3
    Warning = 4
    Error   = 5
    Fatal   = 6
  end

  enum KeyboardKey
    Null         =   0
    Apostrophe   =  39
    Comma        =  44
    Minus        =  45
    Period       =  46
    Slash        =  47
    Zero         =  48
    One          =  49
    Two          =  50
    Three        =  51
    Four         =  52
    Five         =  53
    Six          =  54
    Seven        =  55
    Eight        =  56
    Nine         =  57
    Semicolon    =  59
    Equal        =  61
    A            =  65
    B            =  66
    C            =  67
    D            =  68
    E            =  69
    F            =  70
    G            =  71
    H            =  72
    I            =  73
    J            =  74
    K            =  75
    L            =  76
    M            =  77
    N            =  78
    O            =  79
    P            =  80
    Q            =  81
    R            =  82
    S            =  83
    T            =  84
    U            =  85
    V            =  86
    W            =  87
    X            =  88
    Y            =  89
    Z            =  90
    LeftBracket  =  91
    Backslash    =  92
    RightBracket =  93
    Grave        =  96
    Space        =  32
    Escape       = 256
    Enter        = 257
    Tab          = 258
    Backspace    = 259
    Insert       = 260
    Delete       = 261
    Right        = 262
    Left         = 263
    Down         = 264
    Up           = 265
    PageUp       = 266
    PageDown     = 267
    Home         = 268
    End          = 269
    CapsLock     = 280
    ScrollLock   = 281
    NumLock      = 282
    PrintScreen  = 283
    Pause        = 284
    F1           = 290
    F2           = 291
    F3           = 292
    F4           = 293
    F5           = 294
    F6           = 295
    F7           = 296
    F8           = 297
    F9           = 298
    F10          = 299
    F11          = 300
    F12          = 301
    LeftShift    = 340
    LeftControl  = 341
    LeftAlt      = 342
    LeftSuper    = 343
    RightShift   = 344
    RightControl = 345
    RightAlt     = 346
    RightSuper   = 347
    KbMenu       = 348
    Kp0          = 320
    Kp1          = 321
    Kp2          = 322
    Kp3          = 323
    Kp4          = 324
    Kp5          = 325
    Kp6          = 326
    Kp7          = 327
    Kp8          = 328
    Kp9          = 329
    KpDecimal    = 330
    KpDivide     = 331
    KpMultiply   = 332
    KpSubtract   = 333
    KpAdd        = 334
    KpEnter      = 335
    KpEqual      = 336
    Back         =   4
    Menu         =  82
    VolumeUp     =  24
    VolumeDown   =  25
  end

  enum MouseButton
    Left    = 0
    Right   = 1
    Middle  = 2
    Side    = 3
    Extra   = 4
    Forward = 5
    Back    = 6
  end

  enum MouseCursor
    Default      =  0
    Arrow        =  1
    Ibeam        =  2
    Crosshair    =  3
    PointingHand =  4
    ResizeEw     =  5
    ResizeNs     =  6
    ResizeNwse   =  7
    ResizeNesw   =  8
    ResizeAll    =  9
    NotAllowed   = 10
  end

  enum GamepadButton
    Unknown        =  0
    LeftFaceUp     =  1
    LeftFaceRight  =  2
    LeftFaceDown   =  3
    LeftFaceLeft   =  4
    RightFaceUp    =  5
    RightFaceRight =  6
    RightFaceDown  =  7
    RightFaceLeft  =  8
    LeftTrigger1   =  9
    LeftTrigger2   = 10
    RightTrigger1  = 11
    RightTrigger2  = 12
    MiddleLeft     = 13
    Middle         = 14
    MiddleRight    = 15
    LeftThumb      = 16
    RightThumb     = 17
  end

  enum GamepadAxis
    LeftX        = 0
    LeftY        = 1
    RightX       = 2
    RightY       = 3
    LeftTrigger  = 4
    RightTrigger = 5
  end

  enum MaterialMapIndex
    Albedo     =  0
    Metalness  =  1
    Normal     =  2
    Roughness  =  3
    Occlusion  =  4
    Emission   =  5
    Height     =  6
    Cubemap    =  7
    Irradiance =  8
    Prefilter  =  9
    Brdf       = 10
  end

  enum ShaderLocationIndex
    VertexPosition   =  0
    VertexTexcoord01 =  1
    VertexTexcoord02 =  2
    VertexNormal     =  3
    VertexTangent    =  4
    VertexColor      =  5
    MatrixMvp        =  6
    MatrixView       =  7
    MatrixProjection =  8
    MatrixModel      =  9
    MatrixNormal     = 10
    VectorView       = 11
    ColorDiffuse     = 12
    ColorSpecular    = 13
    ColorAmbient     = 14
    MapAlbedo        = 15
    MapMetalness     = 16
    MapNormal        = 17
    MapRoughness     = 18
    MapOcclusion     = 19
    MapEmission      = 20
    MapHeight        = 21
    MapCubemap       = 22
    MapIrradiance    = 23
    MapPrefilter     = 24
    MapBrdf          = 25
  end

  enum ShaderUniformDataType
    Float     = 0
    Vec2      = 1
    Vec3      = 2
    Vec4      = 3
    Int       = 4
    Ivec2     = 5
    Ivec3     = 6
    Ivec4     = 7
    Sampler2d = 8
  end

  enum ShaderAttributeDataType
    Float = 0
    Vec2  = 1
    Vec3  = 2
    Vec4  = 3
  end

  enum PixelFormat
    UncompressedGrayscale    =  1
    UncompressedGrayAlpha    =  2
    UncompressedR5g6b5       =  3
    UncompressedR8g8b8       =  4
    UncompressedR5g5b5a1     =  5
    UncompressedR4g4b4a4     =  6
    UncompressedR8g8b8a8     =  7
    UncompressedR32          =  8
    UncompressedR32g32b32    =  9
    UncompressedR32g32b32a32 = 10
    CompressedDxt1Rgb        = 11
    CompressedDxt1Rgba       = 12
    CompressedDxt3Rgba       = 13
    CompressedDxt5Rgba       = 14
    CompressedEtc1Rgb        = 15
    CompressedEtc2Rgb        = 16
    CompressedEtc2EacRgba    = 17
    CompressedPvrtRgb        = 18
    CompressedPvrtRgba       = 19
    CompressedAstc4x4Rgba    = 20
  end

  enum TextureFilter
    Point          = 0
    Bilinear       = 1
    Trilinear      = 2
    Anisotropic4x  = 3
    Anisotropic8x  = 4
    Anisotropic16x = 5
  end

  enum TextureWrap
    Repeat       = 0
    Clamp        = 1
    MirrorRepeat = 2
    MirrorClamp  = 3
  end

  enum CubemapLayout
    AutoDetect       = 0
    LineVertical     = 1
    LineHorizontal   = 2
    CrossThreeByFour = 3
    CrossFourByThree = 4
  end

  enum FontType
    Default = 0
    Bitmap  = 1
    Sdf     = 2
  end

  enum BlendMode
    Alpha          = 0
    Additive       = 1
    Multiplied     = 2
    AddColors      = 3
    SubtractColors = 4
    Custom         = 5
  end

  enum Gesture
    None       =   0
    Tap        =   1
    Doubletap  =   2
    Hold       =   4
    Drag       =   8
    SwipeRight =  16
    SwipeLeft  =  32
    SwipeUp    =  64
    SwipeDown  = 128
    PinchIn    = 256
    PinchOut   = 512
  end

  enum CameraMode
    Custom      = 0
    Free        = 1
    Orbital     = 2
    FirstPerson = 3
    ThirdPerson = 4
  end

  enum CameraProjection
    Perspective  = 0
    Orthographic = 1
  end

  enum NPatchLayout
    NinePatch            = 0
    ThreePatchVertical   = 1
    ThreePatchHorizontal = 2
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
    offset : Vector2
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
    vboId : LibC::Int*
  end

  struct Shader
    id : LibC::UInt
    locs : LibC::Int*
  end

  struct MaterialMap
    texture : Texture2D
    color : Color
    value : LibC::Float
  end

  struct Material
    shader : Shader
    maps : MaterialMap*
    params : StaticArray(LibC::Float, 4)
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
    materials : Material*
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

  struct MADataConverter
  end

  struct MAContext
  end
  
  struct MADevice
  end

  struct MAMutex
  end

  struct AudioBuffer
    converter : MADataConverter
    callback : AudioCallback
    processor : AudioProcessor*

    volume : LibC::Float
    pitch : LibC::Float
    pan : LibC::Float

    bool : LibC::Bool
    paused : Bool
    looping : Bool
    usage : LibC::Int

    is_subbuffer_processed : StaticArray(LibC::Bool, 2)
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
    lock : MALock
    is_ready : Bool
    pcm_buffer_size : Void
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
    audio_buffer : AudioBuffer
    audio_processor : AudioProcessor
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
  fun get_screen_height = GetScreenHeight : LibC::Int
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
  fun get_camera_matrix_2d = GetCameraMatrix2D(camera : Camera2D) : Matrix
  fun get_world_to_screen = GetWorldToScreen(position : Vector3, camera : Camera) : Vector2
  fun get_world_to_screen_ex = GetWorldToScreenEx(position : Vector3, camera : Camera, width : LibC::Int, height : LibC::Int) : Vector2
  fun get_world_to_screen_2d = GetWorldToScreen2D(position : Vector2, camera : Camera2D) : Vector2
  fun get_screen_to_world_2d = GetScreenToWorld2D(position : Vector2, camera : Camera2D) : Vector2
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
  fun draw_line_3d = DrawLine3D(start_pos : Vector3, end_pos : Vector3, color : Color)
  fun draw_point_3d = DrawPoint3D(position : Vector3, color : Color)
  fun draw_circle_3d = DrawCircle3D(center : Vector3, radius : LibC::Float, rotation_axis : Vector3, rotation_angle : LibC::Float, color : Color)
  fun draw_triangle_3d = DrawTriangle3D(v1 : Vector3, v2 : Vector3, v3 : Vector3, color : Color)
  fun draw_triangle_strip_3d = DrawTriangleStrip3D(points : Vector3*, point_count : LibC::Int, color : Color)
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

  fun attach_audio_stream_processor = AttachAudioStreamProcessor(stream : AudioStream, processor : AudioCallback)
  fun detach_audio_stream_processor = DetachAudioStreamProcessor(stream : AudioStream, processor : AudioCallback)


  fun clamp = Clamp(value : LibC::Float, min : LibC::Float, max : LibC::Float) : LibC::Float
  fun lerp = Lerp(start : LibC::Float, finsh : LibC::Float, amount : LibC::Float) : LibC::Float
  fun normalize = Normalize(value : LibC::Float, start : LibC::Float, finish : LibC::Float) : LibC::Float
  fun remap = Remap(value : LibC::Float, input_start : LibC::Float, input_end : LibC::Float, output_start : LibC::Float, output_end : LibC::Float) : LibC::Float
  fun vector2_zero = Vector2Zero : Vector2
  fun vector2_one = Vector2One : Vector2
  fun vector2_add = Vector2Add(v1 : Vector2, v2 : Vector2) : Vector2
  fun vector2_add_value = Vector2AddValue(v : Vector2, add : LibC::Float) : Vector2
  fun vector2_subtract = Vector2Subtract(v1 : Vector2, v2 : Vector2) : Vector2
  fun vector2_subtract_value = Vector2SubtractValue(v : Vector2, sub : LibC::Float) : Vector2
  fun vector2_length = Vector2Length(v : Vector2) : LibC::Float
  fun vector2_length_sqr = Vector2LengthSqr(v : Vector2) : LibC::Float
  fun vector2_dot_product = Vector2DotProduct(v1 : Vector2, v2 : Vector2) : LibC::Float
  fun vector2_distance = Vector2Distance(v1 : Vector2, v2 : Vector2) : LibC::Float
  fun vector2_angle = Vector2Angle(v1 : Vector2, v2 : Vector2) : LibC::Float
  fun vector2_scale = Vector2Scale(v : Vector2, scale : LibC::Float) : Vector2
  fun vector2_multiply = Vector2Multiply(v1 : Vector2, v2 : Vector2) : Vector2
  fun vector2_negate = Vector2Negate(v : Vector2) : Vector2
  fun vector2_divide = Vector2Divide(v1 : Vector2, v2 : Vector2) : Vector2
  fun vector2_normalize = Vector2Normalize(v : Vector2) : Vector2
  fun vector2_transform = Vector2Transform(v : Vector2, mat : Matrix) : Vector2
  fun vector2_lerp = Vector2Lerp(v1 : Vector2, v2 : Vector2, amount : LibC::Float) : Vector2
  fun vector2_reflect = Vector2Reflect(v : Vector2, normal : Vector2) : Vector2
  fun vector2_rotate = Vector2Rotate(v : Vector2, angle : LibC::Float) : Vector2
  fun vector2_move_towards = Vector2MoveTowards(v : Vector2, target : Vector2, max_distance : LibC::Float) : Vector2
  fun vector3_zero = Vector3Zero : Vector3
  fun vector3_one = Vector3One : Vector3
  fun vector3_add = Vector3Add(v1 : Vector3, v2 : Vector3) : Vector3
  fun vector3_add_value = Vector3AddValue(v : Vector3, add : LibC::Float) : Vector3
  fun vector3_subtract = Vector3Subtract(v1 : Vector3, v2 : Vector3) : Vector3
  fun vector3_subtract_value = Vector3SubtractValue(v : Vector3, sub : LibC::Float) : Vector3
  fun vector3_scale = Vector3Scale(v : Vector3, scalar : LibC::Float) : Vector3
  fun vector3_multiply = Vector3Multiply(v1 : Vector3, v2 : Vector3) : Vector3
  fun vector3_cross_product = Vector3CrossProduct(v1 : Vector3, v2 : Vector3) : Vector3
  fun vector3_perpendicular = Vector3Perpendicular(v : Vector3) : Vector3
  fun vector3_length = Vector3Length(v : Vector3) : LibC::Float
  fun vector3_length_sqr = Vector3LengthSqr(v : Vector3) : LibC::Float
  fun vector3_dot_product = Vector3DotProduct(v1 : Vector3, v2 : Vector3) : LibC::Float
  fun vector3_distance = Vector3Distance(v1 : Vector3, v2 : Vector3) : LibC::Float
  fun vector3_angle = Vector3Angle(v1 : Vector3, v2 : Vector3) : LibC::Float
  fun vector3_negate = Vector3Negate(v : Vector3) : Vector3
  fun vector3_divide = Vector3Divide(v1 : Vector3, v2 : Vector3) : Vector3
  fun vector3_normalize = Vector3Normalize(v : Vector3) : Vector3
  fun vector3_transform = Vector3Transform(v : Vector3, mat : Matrix) : Vector3
  fun vector3_rotate_by_quaternion = Vector3RotateByQuaternion(v : Vector3, q : Quaternion) : Vector3
  fun vector3_lerp = Vector3Lerp(v1 : Vector3, v2 : Vector3, amount : LibC::Float) : Vector3
  fun vector3_reflect = Vector3Reflect(v : Vector3, normal : Vector3) : Vector3
  fun vector3_min = Vector3Min(v1 : Vector3, v2 : Vector3) : Vector3
  fun vector3_max = Vector3Max(v1 : Vector3, v2 : Vector3) : Vector3
  fun vector3_barycenter = Vector3Barycenter(p : Vector3, a : Vector3, b : Vector3, c : Vector3) : Vector3
  fun vector3_unproject = Vector3Unproject(source : Vector3, projection : Matrix, view : Matrix) : Vector3
  fun matrix_determinant = MatrixDeterminant(mat : Matrix) : LibC::Float
  fun matrix_trace = MatrixTrace(mat : Matrix) : LibC::Float
  fun matrix_transpose = MatrixTranspose(mat : Matrix) : Matrix
  fun matrix_invert = MatrixInvert(mat : Matrix) : Matrix
  fun matrix_normalize = MatrixNormalize(mat : Matrix) : Matrix
  fun matrix_identity = MatrixIdentity : Matrix
  fun matrix_add = MatrixAdd(left : Matrix, right : Matrix) : Matrix
  fun matrix_subtract = MatrixSubtract(left : Matrix, right : Matrix) : Matrix
  fun matrix_multiply = MatrixMultiply(left : Matrix, right : Matrix) : Matrix
  fun matrix_translate = MatrixTranslate(x : LibC::Float, y : LibC::Float, z : LibC::Float) : Matrix
  fun matrix_rotate = MatrixRotate(axis : Vector3, angle : LibC::Float) : Matrix
  fun matrix_rotate_x = MatrixRotateX(angle : LibC::Float) : Matrix
  fun matrix_rotate_y = MatrixRotateY(angle : LibC::Float) : Matrix
  fun matrix_rotate_z = MatrixRotateZ(angle : LibC::Float) : Matrix
  fun matrix_rotate_xyz = MatrixRotateXYZ(ang : Vector3) : Matrix
  fun matrix_rotate_zyx = MatrixRotateZYX(ang : Vector3) : Matrix
  fun matrix_scale = MatrixScale(x : LibC::Float, y : LibC::Float, z : LibC::Float) : Matrix
  fun matrix_frustum = MatrixFrustum(left : LibC::Double, right : LibC::Double, bottom : LibC::Double, top : LibC::Double, near : LibC::Double, far : LibC::Double) : Matrix
  fun matrix_perspective = MatrixPerspective(fovy : LibC::Double, aspect : LibC::Double, near : LibC::Double, far : LibC::Double) : Matrix
  fun matrix_ortho = MatrixOrtho(left : LibC::Double, right : LibC::Double, bottom : LibC::Double, top : LibC::Double, near : LibC::Double, far : LibC::Double) : Matrix
  fun matrix_look_at = MatrixLookAt(eye : Vector3, target : Vector3, up : Vector3) : Matrix
  fun quaternion_add = QuaternionAdd(q1 : Quaternion, q2 : Quaternion) : Quaternion
  fun quaternion_add_value = QuaternionAddValue(q : Quaternion, add : LibC::Float) : Quaternion
  fun quaternion_subtract = QuaternionSubtract(q1 : Quaternion, q2 : Quaternion) : Quaternion
  fun quaternion_subtract_value = QuaternionSubtractValue(q : Quaternion, sub : LibC::Float) : Quaternion
  fun quaternion_identity = QuaternionIdentity : Quaternion
  fun quaternion_length = QuaternionLength(q : Quaternion) : LibC::Float
  fun quaternion_normalize = QuaternionNormalize(q : Quaternion) : Quaternion
  fun quaternion_invert = QuaternionInvert(q : Quaternion) : Quaternion
  fun quaternion_multiply = QuaternionMultiply(q1 : Quaternion, q2 : Quaternion) : Quaternion
  fun quaternion_scale = QuaternionScale(q : Quaternion, mul : LibC::Float) : Quaternion
  fun quaternion_divide = QuaternionDivide(q1 : Quaternion, q2 : Quaternion) : Quaternion
  fun quaternion_lerp = QuaternionLerp(q1 : Quaternion, q2 : Quaternion, amount : LibC::Float) : Quaternion
  fun quaternion_nlerp = QuaternionNlerp(q1 : Quaternion, q2 : Quaternion, amount : LibC::Float) : Quaternion
  fun quaternion_slerp = QuaternionSlerp(q1 : Quaternion, q2 : Quaternion, amount : LibC::Float) : Quaternion
  fun quaternion_from_vector3_to_vector3 = QuaternionFromVector3ToVector3(from : Vector3, to : Vector3) : Quaternion
  fun quaternion_from_matrix = QuaternionFromMatrix(mat : Matrix) : Quaternion
  fun quaternion_to_matrix = QuaternionToMatrix(q : Quaternion) : Matrix
  fun quaternion_from_axis_angle = QuaternionFromAxisAngle(axis : Vector3, angle : LibC::Float) : Quaternion
  fun quaternion_from_euler = QuaternionFromEuler(pitch : LibC::Float, yaw : LibC::Float, roll : LibC::Float) : Quaternion
  fun quaternion_to_euler = QuaternionToEuler(q : Quaternion) : Vector3
  fun quaternion_transform = QuaternionTransform(q : Quaternion, mat : Matrix) : Quaternion

  # TODO: unbound functions, resolve manually
  # {'name': 'Vector3ToFloatV', 'description': '', 'returnType': 'float3', 'params': [{'type': 'Vector3', 'name': 'v'}]}
  # {'name': 'MatrixToFloatV', 'description': '', 'returnType': 'float16', 'params': [{'type': 'Matrix', 'name': 'mat'}]}

  fun vector3_ortho_normalize = Vector3OrthoNormalize(v1 : Vector3*, v2 : Vector3*)
  fun quaternion_to_axis_angle = QuaterntionToAxisAngle(q : Quaternion, out_axis : Vector3*, out_angle : LibC::Float*)

  TEXTURE_WRAP_S                    = 0x2802
  TEXTURE_WRAP_T                    = 0x2803
  TEXTURE_MAG_FILTER                = 0x2800
  RL_TEXTURE_MIN_FILTER             = 0x2801
  TEXTURE_FILTER_NEAREST            = 0x2600
  TEXTURE_FILTER_LINEAR             = 0x2601
  TEXTURE_FILTER_MIP_NEAREST        = 0x2700
  TEXTURE_FILTER_NEAREST_MIP_LINEAR = 0x2702
  TEXTURE_FILTER_LINEAR_MIP_NEAREST = 0x2701
  TEXTURE_FILTER_MIP_LINEAR         = 0x2703
  TEXTURE_FILTER_ANISOTROPIC        = 0x3000

  TEXTURE_WRAP_REPEAT        = 0x2901
  TEXTURE_WRAP_CLAMP         = 0x812F
  TEXTURE_WRAP_MIRROR_REPEAT = 0x8370
  TEXTURE_WRAP_MIRROR_CLAMP  = 0x8742
  MODELVIEW                  = 0x1700
  PROJECTION                 = 0x1701
  TEXTURE                    = 0x1702

  LINES     = 0x0001
  TRIANGLES = 0x0004
  QUADS     = 0x0007

  UNSIGNED_BYTE = 0x1401
  FLOAT         = 0x1406

  STREAM_DRAW     = 0x88E0
  STREAM_READ     = 0x88E1
  STREAM_COPY     = 0x88E2
  STATIC_DRAW     = 0x88E4
  STATIC_READ     = 0x88E5
  STATIC_COPY     = 0x88E6
  DYNAMIC_DRAW    = 0x88E8
  DYNAMIC_READ    = 0x88E9
  DYNAMIC_COPY    = 0x88EA
  FRAGMENT_SHADER = 0x8B30
  VERTEX_SHADER   = 0x8B31
  COMPUTE_SHADER  = 0x91B9

  enum RLGLVersion
    OPENGL_11    = 1
    OPENGL_21
    OPENGL_33
    OPENGL_43
    OPENGL_ES_20
  end

  enum FramebufferAttachType
    AttachmentColorChannel0 = 0
    AttachmentColorChannel1
    AttachmentColorChannel2
    AttachmentColorChannel3
    AttachmentColorChannel4
    AttachmentColorChannel5
    AttachmentColorChannel6
    AttachmentColorChannel7
    AttachmentDepth         = 100
    AttachmentStencil       = 200
  end

  enum FramebufferAttachTextureType
    AttachmentCubemapPositiveX = 0
    AttachmentCubemapNegativeX
    AttachmentCubemapPositiveY
    AttachmentCubemapNegativeY
    AttachmentCubemapPositiveZ
    AttachmentCubemapNegativeZ
    AttachmentTexture2D        = 100
    AttachmentRenderbuffer     = 200
  end

  struct VertexBuffer
    element_count : LibC::Int
    vertices : LibC::Float*
    tex_coords : LibC::Float*
    colors : LibC::UChar*
    # TODO: FIX THIS IDK https://github.com/raysan5/raylib/blob/master/src/rlgl.h#L324
    indices : LibC::UInt*
    vao_id : LibC::UInt
    vbo_id : StaticArray(LibC::UInt*, 4)
  end

  struct DrawCall
    mode : LibC::Int
    vertex_count : LibC::Int
    vertex_alignment : LibC::Int
    texture_id : LibC::UInt
  end

  struct RenderBatch
    buffer_count : LibC::Int
    current_buffer : LibC::Int
    vertex_buffer : VertexBuffer
    draws : DrawCall
    draw_counter : LibC::Int
    current_depth : LibC::Float
  end

  fun matrix_mode = rlMatrixMode(mode : LibC::Int)
  fun push_matrix = rlPushMatrix
  fun pop_matrix = rlPopMatrix
  fun load_identity = rlLoadIdentity
  fun translate_f = rlTranslatef(x : LibC::Float, y : LibC::Float, z : LibC::Float)
  fun rotate_f = rlRotatef(angle : LibC::Float, x : LibC::Float, y : LibC::Float, z : LibC::Float)
  fun scale_f = rlScalef(x : LibC::Float, y : LibC::Float, z : LibC::Float)
  fun multi_matrix_f = rlMultMatrixf
  fun frustrum = rlFrustum(left : LibC::Double, right : LibC::Double, bottom : LibC::Double, top : LibC::Double, znear : LibC::Double, zfar : LibC::Double)
  fun ortho = rlOrtho(left : LibC::Double, right : LibC::Double, bottom : LibC::Double, top : LibC::Double, znear : LibC::Double, zfar : LibC::Double)
  fun viewport = rlViewport(x : LibC::Int, y : LibC::Int, width : LibC::Int, height : LibC::Int)

  fun begin = rlBegin(mode : LibC::Int)
  fun end = rlEnd
  fun vertex_2i = rlVertex2i(x : LibC::Int, y : LibC::Int)
  fun vertex_2f = rlVertex2f(x : LibC::Float, y : LibC::Float)
  fun vertex_3f = rlVertex3f(x : LibC::Float, y : LibC::Float, z : LibC::Float)
  fun texcoord_2f = rlTexCoord2f(x : LibC::Float, y : LibC::Float)
  fun normal_3f = rlNormal3f(x : LibC::Float, y : LibC::Float, z : LibC::Float)
  fun color_4ub = rlColor4ub(r : LibC::UChar, g : LibC::UChar, b : LibC::UChar, a : LibC::UChar)
  fun color_3f = rlColor3f(x : LibC::Float, y : LibC::Float, z : LibC::Float)
  fun color_4f = rlColor4f(x : LibC::Float, y : LibC::Float, z : LibC::Float, w : LibC::Float)

  fun enable_vertex_array = rlEnableVertexArray(vao_id : LibC::UInt) : Bool
  fun disable_vertex_array = rlDisableVertexArray
  fun enable_vertex_buffer = rlEnableVertexBuffer(id : LibC::UInt)
  fun disable_vertex_buffer = rlDisableVertexBuffer
  fun enable_vertex_buffer_element = rlEnableVertexBufferElement(id : LibC::UInt)
  fun disable_vertex_buffer_element = rlDisableVertexBufferElement
  fun enable_vertex_buffer_attribute = rlEnableVertexBufferAttribute(id : LibC::UInt)
  fun disable_vertex_buffer_attribute = rlDisableVertexBufferAttribute

  # TODO: Figure out what needs to be done to do this :(
  # https://github.com/raysan5/raylib/blob/master/src/rlgl.h#L542

  fun active_texture_slot = rlActiveTextureSlot(slot : LibC::Int)
  fun enable_texture = rlEnableTexture(id : LibC::UInt)
  fun disable_texture = rlDisableTexture
  fun enable_texture_cubemap = rlEnableTextureCubemap(id : LibC::UInt)
  fun disable_texture_cubemap = rlDisableTextureCubemap
  fun texture_parameters = rlTextureParameters(id : LibC::UInt, param : LibC::Int, value : LibC::Int)

  fun enable_shader = rlEnableShader(id : LibC::UInt)
  fun disable_shader = rlDisableShader

  fun enable_frame_buffer = rlEnableFrameBuffer(id : LibC::UInt)
  fun disable_frame_buffer = rlDisableFrameBuffer
  fun active_draw_buffers = rlActiveDrawBuffers(count : LibC::Int)
  fun enable_color_blend = rlEnableColorBlend
  fun disable_color_blend = rlDisableColorBlend
  fun enable_depth_test = rlEnableDepthTest
  fun disable_depth_test = rlDisableDepthTest

  fun enable_depth_mask = rlEnableDepthMask
  fun disable_depth_mask = rlDisableDepthMask

  fun enable_backface_culling = rlEnableBackfaceCulling
  fun disable_backface_culling = rlDisableBackfaceCulling

  fun enable_scissor_test = rlEnableScissorTest
  fun disable_scissor_test = rlDisableScissorTest

  fun scissor = rlScissor(x : LibC::Int, y : LibC::Int, w : LibC::Int, h : LibC::Int)
  fun enable_wire_mode = rlEnableWireMode
  fun disable_wire_mode = rlDisableWireMode
  fun set_line_width = rlSetLineWidth(width : LibC::Float)
  fun get_line_width = rlGetLineWidth : LibC::Float
  fun enable_smooth_lines = rlEnableSmoothLines
  fun disable_smooth_lines = rlDisableSmoothLines
  fun enable_stereo_render = rlEnableStereoRender
  fun disable_stereo_render = rlDisableStereoRender
  fun stereo_render_enabled? = rlIsStereoRenderEnabled : Bool
  fun clear_color = rlClearColor(r : LibC::UChar, g : LibC::UChar, b : LibC::UChar, a : LibC::UChar)
  fun clean_screen_buffers = rlClearScreenBuffers
  fun clear_errors = rlCheckErrors
  fun set_blend_mode = rlSetBlendMode(mode : LibC::Int)
  fun set_blend_factors = rlSetBlendFactors(gl_src_factor : LibC::Int, gl_dst_factor : LibC::Int, gl_equation : LibC::Int)

  fun init = rlglInit(width : LibC::Int, height : LibC::Int)
  fun close = rlglClose(width : LibC::Int, height : LibC::Int)
  fun load_extensions = rlLoadExtensions(loader : Void*)
  fun get_version = rlGetVersion : LibC::Int
  fun get_framebuffer_width = rlGetFramebufferWidth : LibC::Int
  fun get_framebuffer_height = rlGetFramebufferHeight : LibC::Int
  fun get_texture_id_default = rlGetTextureIdDefault : LibC::UInt
  fun get_shader_id_default = rlGetShaderIdDefault : LibC::UInt
  fun get_shader_locs_default = rlGetShaderLocsDefault : LibC::Int*

  fun load_render_batch = rlLoadRenderBatch(num_buffers : LibC::Int, buffer_elements : LibC::Int) : RenderBatch
  fun unload_render_batch = rlUnloadRenderBatch(batch : RenderBatch)
  fun draw_render_batch = rlDrawRenderBatch(batch : RenderBatch*)
  fun set_render_batch_active = rlDrawRenderBatch(batch : RenderBatch*)
  fun draw_render_batch_active = rlDrawRenderBatchActive
  fun check_render_batch_limit = rlCheckRenderBatchLimit(v_count : LibC::Int) : Bool
  fun set_texture = rlSetTexture(id : LibC::UInt)

  fun load_vertex_array = rlLoadVertexArray : LibC::UInt
  fun load_vertex_buffer = rlLoadVertexBuffer(buffer : Void*, size : LibC::Int, dynamic : Bool) : LibC::UInt
  fun load_vertex_buffer_element = rlLoadVertexBufferElement(buffer : Void*, size : LibC::Int, dynamic : Bool) : LibC::UInt
  fun update_vertex_buffer = rlUpdateVertexBuffer(buffer_id : LibC::UInt, data : Void*, data_size : LibC::Int, offset : LibC::Int)
  fun update_vertex_buffer_elements = rlUpdateVertexBufferElements(id : LibC::UInt, data : Void*, data_size : LibC::Int, offset : LibC::Int)
  fun unload_vertex_array = rlUnloadVertexArray(vao_id : LibC::UInt)
  fun unload_vertex_buffer = rlUnloadVertexBuffer(vbo_id : LibC::UInt)
  fun set_vertex_attribute = rlSetVertexAttribute(index : LibC::UInt, comp_size : LibC::Int, type : LibC::Int, normalized : Bool, stride : LibC::Int, pointer : Void*)
  fun set_vertex_attribute_divisor = rlSetVertexAttributeDivisor(index : LibC::UInt, divisor : LibC::Int)
  fun set_vertex_attribute_default = rlSetVertexAttributeDefault(loc_index : LibC::Int, value : Void*, attrib_type : LibC::Int, count : LibC::Int)
  fun draw_vertex_array = rlDrawVertexArray(offset : LibC::Int, count : LibC::Int)
  fun draw_vertex_array_elements = rlDrawVertexArrayElements(offset : LibC::Int, count : LibC::Int, buffer : Void*)
  fun draw_vertex_array_instanced = rlDrawVertexArrayInstanced(offset : LibC::Int, count : LibC::Int, buffer : Void*, instances : LibC::Int)
  fun draw_vertex_array_elements_instanced = rlDrawVertexArrayElementsInstanced(offset : LibC::Int, count : LibC::Int, buffer : Void*, instances : LibC::Int)

  fun load_texture_rlgl = rlLoadTexture(data : Void*, width : LibC::Int, height : LibC::Int, format : LibC::Int, mimmap_count : LibC::Int) : LibC::UInt
  fun load_texture_depth = rlLoadTextureDepth(width : LibC::Int, height : LibC::Int, use_render_buffer : Bool) : LibC::UInt
  fun load_texture_cubemap = rlLoadTextureCubemap(data : Void*, size : LibC::Int, format : LibC::Int) : LibC::UInt
  fun update_texture = rlUpdateTexture(id : LibC::UInt, offset_x : LibC::Int, offset_y : LibC::Int, width : LibC::Int, height : LibC::Int, format : LibC::Int, data : Void*)
  fun get_gl_texture_formats = rlGetGlTextureFormats(format : LibC::Int, gl_internal_format : LibC::Int*, gl_format : LibC::Int*, gl_type : LibC::Int*)
  fun get_pixel_format_name = rlGetPixelFormatName(format : LibC::UInt) : LibC::Char*
  fun unload_texture_rlgl = rlUnloadTexture(id : LibC::UInt)
  fun gen_texture_mipmaps = rlGenTextureMipmaps(id : LibC::UInt, width : LibC::Int, height : LibC::Int, format : LibC::Int, mipmaps : LibC::Int*)
  fun read_texture_pixels = rlReadTexturePixels(id : LibC::UInt, width : LibC::Int, height : LibC::Int, format : LibC::Int) : Void*
  fun read_screen_pixels = rlReadScreenPixels(width : LibC::Int, height : LibC::Int) : LibC::UChar*
  fun load_framebuffer = rlLoadFramebuffer(width : LibC::Int, height : LibC::Int) : LibC::UInt
  fun framebuffer_attach = rlFramebufferAttach(fbo_id : LibC::UInt, tex_id : LibC::UInt, attach_type : LibC::Int, text_type : LibC::Int, mip_level : LibC::Int)
  fun framebuffer_complete = rlFramebufferComplete(id : LibC::UInt) : Bool
  fun unload_framebuffer = rlUnloadFramebuffer(id : LibC::UInt)

  fun load_shader_code = rlLoadShaderCode(vscode : LibC::Char*, fscode : LibC::Char*) : LibC::UInt
  fun compile_shader = rlCompileShader(shader_code : LibC::Char*, type : LibC::Int) : LibC::UInt
  fun load_shader_program = rlLoadShaderProgram(v_shader_id : LibC::UInt, f_shader_id : LibC::UInt) : LibC::UInt
  fun unload_shader_program = rlUnloadShaderProgram(id : LibC::UInt)
  fun get_location_uniform = rlGetLocationUniform(shader_id : LibC::UInt, uniform_name : LibC::Char*) : LibC::Int
  fun get_location_attrib = rlGetLocationAttrib(shader_id : LibC::UInt, attrib_name : LibC::Char*)
  fun set_uniform = rlSetUniform(loc_index : LibC::Int, value : Void*, uniform_type : LibC::Int, count : LibC::Int)
  fun set_uniform_matrix = rlSetUniformMatrix(loc_index : LibC::Int, mat : Matrix)
  fun set_uniform_sampler = rlSetUniformSampler(loc_index : LibC::Int, texture_id : LibC::UInt)
  fun set_shader = rlSetShader(id : LibC::UInt, locs : LibC::Int*)

  fun load_compute_shader_program = rlLoadComputeShaderProgram(shader_id : LibC::UInt) : LibC::UInt
  fun compute_shader_dispatch = rlComputeShaderDispatch(group_x : LibC::UInt, group_y : LibC::UInt, group_z : LibC::UInt)

  fun load_shader_buffer = rlLoadShaderBuffer(size : LibC::LongLong, data : Void*, usage_hint : LibC::Int) : LibC::UInt
  fun unload_shader_buffer = rlUnoadShaderBuffer(ssbo_id : LibC::UInt)
  fun update_shader_buffer_elements = rlUpdateShaderBufferElements(id : LibC::UInt, data : Void*, data_size : LibC::ULongLong, offset : LibC::ULongLong)
  fun get_shader_buffer_size = rlGetShaderBufferSize(id : LibC::UInt) : LibC::ULongLong
  fun read_shader_buffer_elements = rlReadShaderBufferElements(id : LibC::UInt, dest : Void*, count : LibC::ULongLong, offset : LibC::ULongLong)
  fun bind_shader_buffer = rlBindShaderBuffer(id : LibC::UInt, index : LibC::UInt)

  fun copy_buffers_elements = rlCopyBuffersElements(dest_id : LibC::UInt, src_id : LibC::UInt, dest_offset : LibC::ULongLong, src_offset : LibC::ULongLong, count : LibC::ULongLong)
  fun bind_image_texture = rlBindImageTexture(id : LibC::UInt, index : LibC::UInt, format : LibC::UInt, readonly : LibC::Int)

  fun get_matrix_modelview = rlGetMatrixModelview : Matrix
  fun get_matrix_projection = rlGetMatrixProjection : Matrix
  fun get_matrix_transform = rlGetMatrixTransform : Matrix
  fun get_matrix_projection_stereo = rlGetMatrixProjectionStereo(eye : LibC::Int) : Matrix
  fun get_matrix_view_offset_stereo = rlGetMatrixViewOffsetStereo(eye : LibC::Int) : Matrix
  fun set_matrix_projection = rlSetMatrixProjection(proj : Matrix)
  fun set_matrix_modelview = rlSetMatrixModelview(view : Matrix)
  fun set_matrix_projection_stereo = rlSetMatrixProjectionStereo(right : Matrix, left : Matrix)
  fun set_matrix_view_offset_stereo = rlSetMatrixViewOffsetStereo(right : Matrix, left : Matrix)

  fun load_draw_cube = rlLoadDrawCube
  fun load_draw_quad = rlLoadDrawQuad
end

struct LibRaylib::Vector2
  def self.zero : Vector2
    LibRaylib.vector2_zero
  end

  def self.one : Vector2
    LibRaylib.vector2_one
  end

  def add(v2 : Vector2) : Vector2
    LibRaylib.vector2_add(self, v2)
  end

  def add_value(add : Number) : Vector2
    LibRaylib.vector2_add_value(self, add.to_f32)
  end

  def subtract(v2 : Vector2) : Vector2
    LibRaylib.vector2_subtract(self, v2)
  end

  def subtract_value(sub : Number) : Vector2
    LibRaylib.vector2_subtract_value(self, sub.to_f32)
  end

  def length : LibC::Float
    LibRaylib.vector2_length(self)
  end

  def length_sqr : LibC::Float
    LibRaylib.vector2_length_sqr(self)
  end

  def dot_product(v2 : Vector2) : LibC::Float
    LibRaylib.vector2_dot_product(self, v2)
  end

  def distance(v2 : Vector2) : LibC::Float
    LibRaylib.vector2_distance(self, v2)
  end

  def angle(v2 : Vector2) : LibC::Float
    LibRaylib.vector2_angle(self, v2)
  end

  def scale(scale : Number) : Vector2
    LibRaylib.vector2_scale(self, scale.to_f32)
  end

  def multiply(v2 : Vector2) : Vector2
    LibRaylib.vector2_multiply(self, v2)
  end

  def negate : Vector2
    LibRaylib.vector2_negate(self)
  end

  def divide(v2 : Vector2) : Vector2
    LibRaylib.vector2_divide(self, v2)
  end

  def normalize : Vector2
    LibRaylib.vector2_normalize(self)
  end

  def transform(mat : Matrix) : Vector2
    LibRaylib.vector2_transform(self, mat)
  end

  def lerp(v2 : Vector2, amount : Number) : Vector2
    LibRaylib.vector2_lerp(self, v2, amount.to_f32)
  end

  def reflect(normal : Vector2) : Vector2
    LibRaylib.vector2_reflect(self, normal)
  end

  def rotate(angle : Number) : Vector2
    LibRaylib.vector2_rotate(self, angle.to_f32)
  end

  def move_towards(target : Vector2, max_distance : Number) : Vector2
    LibRaylib.vector2_move_towards(self, target, max_distance.to_f32)
  end

  # Operators for convenience

  def +(other : self) : Vector2
    self.add(other)
  end

  def +(other : Number) : Vector2
    self.add_value(other)
  end

  def -(other : self) : Vector2
    self.subtract(other)
  end

  def -(other : Number) : Vector2
    self.subtract_value(other)
  end

  def *(other : self) : Vector2
    self.multiply(other)
  end

  def *(other : Number) : Vector2
    self.scale(other)
  end

  def /(other : self) : Vector2
    self.divide(other)
  end

  def /(other : Number) : Vector2
    self.scale((1/other).to_f32)
  end
end

struct LibRaylib::Vector3
  def self.zero : Vector3
    LibRaylib.vector3_zero
  end

  def self.one : Vector3
    LibRaylib.vector3_one
  end

  def add(v2 : Vector3) : Vector3
    LibRaylib.vector3_add(self, v2)
  end

  def add_value(add : Number) : Vector3
    LibRaylib.vector3_add_value(self, add.to_f32)
  end

  def subtract(v2 : Vector3) : Vector3
    LibRaylib.vector3_subtract(self, v2)
  end

  def subtract_value(sub : Number) : Vector3
    LibRaylib.vector3_subtract_value(self, sub.to_f32)
  end

  def scale(scalar : Number) : Vector3
    LibRaylib.vector3_scale(self, scalar.to_f32)
  end

  def multiply(v2 : Vector3) : Vector3
    LibRaylib.vector3_multiply(self, v2)
  end

  def cross_product(v2 : Vector3) : Vector3
    LibRaylib.vector3_cross_product(self, v2)
  end

  def perpendicular : Vector3
    LibRaylib.vector3_perpendicular(self)
  end

  def dot_product(v2 : Vector3) : LibC::Float
    LibRaylib.vector3_dot_product(self, v2)
  end

  def distance(v2 : Vector3) : LibC::Float
    LibRaylib.vector3_distance(self, v2)
  end

  def angle(v2 : Vector3) : LibC::Float
    LibRaylib.vector3_angle(self, v2)
  end

  def negate : Vector3
    LibRaylib.vector3_negate(self)
  end

  def divide(v2 : Vector3) : Vector3
    LibRaylib.vector3_divide(self, v2)
  end

  def normalize : Vector3
    LibRaylib.vector3_normalize(self)
  end

  def transform(mat : Matrix) : Vector3
    LibRaylib.vector3_transform(self, mat)
  end

  def rotate_by_quaternion(q : Quaternion) : Vector3
    LibRaylib.vector3_rotate_by_quaternion(self, q)
  end

  def lerp(v2 : Vector3, amount : Number) : Vector3
    LibRaylib.vector3_lerp(self, v2, amount.to_f32)
  end

  def reflect(normal : Vector3) : Vector3
    LibRaylib.vector3_reflect(self, normal)
  end

  def min(v2 : Vector3) : Vector3
    LibRaylib.vector3_min(self, v2)
  end

  def max(v2 : Vector3) : Vector3
    LibRaylib.vector3_max(self, v2)
  end

  def barycenter(a : Vector3, b : Vector3, c : Vector3) : Vector3
    LibRaylib.vector3_barycenter(self, a, b, c)
  end

  def unproject(projection : Matrix, view : Matrix) : Vector3
    LibRaylib.vector3_unproject(self, projection, view)
  end

  def self.rotate(axis : Vector3, angle : Number) : Matrix
    LibRaylib.matrix_rotate(axis, angle.to_f32)
  end

  def self.rotate_xyz(ang : Vector3) : Matrix
    LibRaylib.matrix_rotate_xyz(ang)
  end

  def self.rotate_zyx(ang : Vector3) : Matrix
    LibRaylib.matrix_rotate_zyx(ang)
  end

  def self.look_at(eye : Vector3, target : Vector3, up : Vector3) : Matrix
    LibRaylib.matrix_look_at(eye, target, up)
  end

  def self.from_vector3_to_vector3(from : Vector3, to : Vector3) : Quaternion
    LibRaylib.quaternion_from_vector3_to_vector3(from, to)
  end

  def self.from_axis_angle(axis : Vector3, angle : Number) : Quaternion
    LibRaylib.quaternion_from_axis_angle(axis, angle.to_f32)
  end

  def to_euler : Vector3
    LibRaylib.quaternion_to_euler(self)
  end

  # Operators for convenience

  def +(other : self) : Vector3
    self.add(other)
  end

  def +(other : Number) : Vector3
    self.add_value(other)
  end

  def -(other : self) : Vector3
    self.subtract(other)
  end

  def -(other : Number) : Vector3
    self.subtract_value(other)
  end

  def *(other : self) : Vector3
    self.multiply(other)
  end

  def *(other : Number) : Vector3
    self.scale(other)
  end

  def /(other : self) : Vector3
    self.divide(other)
  end

  def /(other : Number) : Vector3
    self.scale((1/other).to_f32)
  end
end

struct LibRaylib::Matrix
  def determinant : LibC::Float
    LibRaylib.matrix_determinant(self)
  end

  def trace : LibC::Float
    LibRaylib.matrix_trace(self)
  end

  def transpose : Matrix
    LibRaylib.matrix_transpose(self)
  end

  def invert : Matrix
    LibRaylib.matrix_invert(self)
  end

  def normalize : Matrix
    LibRaylib.matrix_normalize(self)
  end

  def self.identity : Matrix
    LibRaylib.matrix_identity
  end

  def add(right : Matrix) : Matrix
    LibRaylib.matrix_add(self, right)
  end

  def subtract(right : Matrix) : Matrix
    LibRaylib.matrix_subtract(self, right)
  end

  def multiply(right : Matrix) : Matrix
    LibRaylib.matrix_multiply(self, right)
  end

  def self.translate(x : Number, y : Number, z : Number) : Matrix
    LibRaylib.matrix_translate(x.to_f32, y.to_f32, z.to_f32)
  end

  def self.rotate(axis : Vector3, angle : Number) : Matrix
    LibRaylib.matrix_rotate(axis, angle.to_f32)
  end

  def self.rotate_x(angle : Number) : Matrix
    LibRaylib.matrix_rotate_x(angle.to_f32)
  end

  def self.rotate_y(angle : Number) : Matrix
    LibRaylib.matrix_rotate_y(angle.to_f32)
  end

  def self.rotate_z(angle : Number) : Matrix
    LibRaylib.matrix_rotate_z(angle.to_f32)
  end

  def self.rotate_xyz(ang : Vector3) : Matrix
    LibRaylib.matrix_rotate_xyz(ang)
  end

  def self.rotate_zyx(ang : Vector3) : Matrix
    LibRaylib.matrix_rotate_zyx(ang)
  end

  def self.scale(x : Number, y : Number, z : Number) : Matrix
    LibRaylib.matrix_scale(x.to_f32, y.to_f32, z.to_f32)
  end

  def self.frustum(left : Number, right : Number, bottom : Number, top : Number, near : Number, far : Number) : Matrix
    LibRaylib.matrix_frustum(left.to_f64, right.to_f64, bottom.to_f64, top.to_f64, near.to_f64, far.to_f64)
  end

  def self.perspective(fovy : Number, aspect : Number, near : Number, far : Number) : Matrix
    LibRaylib.matrix_perspective(fovy.to_f64, aspect.to_f64, near.to_f64, far.to_f64)
  end

  def self.ortho(left : Number, right : Number, bottom : Number, top : Number, near : Number, far : Number) : Matrix
    LibRaylib.matrix_ortho(left.to_f64, right.to_f64, bottom.to_f64, top.to_f64, near.to_f64, far.to_f64)
  end

  def self.look_at(eye : Vector3, target : Vector3, up : Vector3) : Matrix
    LibRaylib.matrix_look_at(eye, target, up)
  end

  def self.from_matrix(mat : Matrix) : Quaternion
    LibRaylib.quaternion_from_matrix(mat)
  end

  def to_matrix : Matrix
    LibRaylib.quaternion_to_matrix(self)
  end

  # Operators for convenience

  def +(other : self) : Matrix
    self.add(other)
  end

  def -(other : self) : Matrix
    self.subtract(other)
  end

  def *(other : self) : Matrix
    self.multiply(other)
  end
end

struct LibRaylib::Quaternion
  def add(q2 : Quaternion) : Quaternion
    LibRaylib.quaternion_add(self, q2)
  end

  def add_value(add : Number) : Quaternion
    LibRaylib.quaternion_add_value(self, add.to_f32)
  end

  def subtract(q2 : Quaternion) : Quaternion
    LibRaylib.quaternion_subtract(self, q2)
  end

  def subtract_value(sub : Number) : Quaternion
    LibRaylib.quaternion_subtract_value(self, sub.to_f32)
  end

  def self.identity : Quaternion
    LibRaylib.quaternion_identity
  end

  def length : LibC::Float
    LibRaylib.quaternion_length(self)
  end

  def normalize : Quaternion
    LibRaylib.quaternion_normalize(self)
  end

  def invert : Quaternion
    LibRaylib.quaternion_invert(self)
  end

  def multiply(q2 : Quaternion) : Quaternion
    LibRaylib.quaternion_multiply(self, q2)
  end

  def scale(mul : Number) : Quaternion
    LibRaylib.quaternion_scale(self, mul.to_f32)
  end

  def divide(q2 : Quaternion) : Quaternion
    LibRaylib.quaternion_divide(self, q2)
  end

  def lerp(q2 : Quaternion, amount : Number) : Quaternion
    LibRaylib.quaternion_lerp(self, q2, amount.to_f32)
  end

  def nlerp(q2 : Quaternion, amount : Number) : Quaternion
    LibRaylib.quaternion_nlerp(self, q2, amount.to_f32)
  end

  def slerp(q2 : Quaternion, amount : Number) : Quaternion
    LibRaylib.quaternion_slerp(self, q2, amount.to_f32)
  end

  def self.from_vector3_to_vector3(from : Vector3, to : Vector3) : Quaternion
    LibRaylib.quaternion_from_vector3_to_vector3(from, to)
  end

  def self.from_matrix(mat : Matrix) : Quaternion
    LibRaylib.quaternion_from_matrix(mat)
  end

  def to_matrix : Matrix
    LibRaylib.quaternion_to_matrix(self)
  end

  def self.from_axis_angle(axis : Vector3, angle : Number) : Quaternion
    LibRaylib.quaternion_from_axis_angle(axis, angle.to_f32)
  end

  def to_axis_angle(out_axis : Vector3*, out_angle : LibC::Float*)
    LibRaylib.quaternion_to_axis_angle(self, out_axis, out_angle)
  end

  def self.from_euler(pitch : Number, yaw : Number, roll : Number) : Quaternion
    LibRaylib.quaternion_from_euler(pitch.to_f32, yaw.to_f32, roll.to_f32)
  end

  def to_euler : Vector3
    LibRaylib.quaternion_to_euler(self)
  end

  def transform(mat : Matrix) : Quaternion
    LibRaylib.quaternion_transform(self, mat)
  end

  # Operators for convenience

  def +(other : self) : Quaternion
    self.add(other)
  end

  def +(other : Number) : Quaternion
    self.add_value(other)
  end

  def -(other : self) : Quaternion
    self.subtract(other)
  end

  def -(other : Number) : Quaternion
    self.subtract_value(other)
  end

  def *(other : self) : Quaternion
    self.multiply(other)
  end

  def *(other : Number) : Quaternion
    self.scale(other)
  end

  def /(other : self) : Quaternion
    self.divide(other)
  end

  def /(other : Number) : Quaternion
    self.scale((1/other).to_f32)
  end
end

struct LibRaylib::Light
  type : Lights::Type
  position : Vector3
  target : Vector3
  color : Color
  enabled : Bool

  enabled_loc : LibC::Int
  type_loc : LibC::Int
  pos_loc : LibC::Int
  target_loc : LibC::Int
  color_loc : LibC::Int
end

module LibRaylib::Lights
  MAX = 4

  class_getter count = 0 

  enum Type
    Directional
    Point
  end

  def self.create(type : Type, position : Vector3, target : Vector3, color : Color, shader : Shader) : Light
    light = Light.new

    if @@count < MAX
      light.enabled = true
      light.type = type
      light.position = position
      light.target = target
      light.color = color

      light.enabled_loc = LibRaylib.get_shader_location(shader, "lights[0#{@@count}].enabled")
      light.type_loc = LibRaylib.get_shader_location(shader, "lights[0#{@@count}].type")
      light.pos_loc = LibRaylib.get_shader_location(shader, "lights[0#{@@count}].position")
      light.target_loc = LibRaylib.get_shader_location(shader, "lights[0#{@@count}].target")
      light.color_loc = LibRaylib.get_shader_location(shader, "lights[0#{@@count}].color")

      update(shader, light)
      @@count += 1
    else
      raise "Too many lights!"
    end

    return light
  end

  def self.update(shader : Shader, light : Light)
    LibRaylib.set_shader_value(shader, light.enabled_loc, light.enabled, LibRaylib::ShaderUniformDataType::Int)
    LibRaylib.set_shader_value(shader, light.type_loc, light.type.value, LibRaylib::ShaderUniformDataType::Int)

    LibRaylib.set_shader_value(shader, light.pos_loc, LibC::Float32[light.position.x, light.position.y, light.position.z], LibRaylib::ShaderUniformDataType::Vec3)
    LibRaylib.set_shader_value(shader, light.target_loc, LibC::Float32[light.target.x, light.target.y, light.target.z], LibRaylib::ShaderUniformDataType::Vec3)
    LibRaylib.set_shader_value(shader, light.color_loc, LibC::Float32[
      light.color.r/255.0_f32, 
      light.color.g/255.0_f32, 
      light.color.b/255.0_f32,
      light.color.a/255.0_f32
      ], LibRaylib::ShaderUniformDataType::Vec4)
  end
end
