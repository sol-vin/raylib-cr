require "./link"

link_flag

lib LibRaylib
  PI      =    3.141592653589793
  DEG2RAD = 0.017453292519943295
  RAD2DEG =    57.29577951308232

  enum ConfigFlags
    FlagVSyncHint         = 0x00000040_u32
    FlagFullscreenMode    = 0x00000002_u32
    FlagWindowResizable   = 0x00000004_u32
    FlagWindowUndecorated = 0x00000008_u32
    FlagWindowHidden      = 0x00000080_u32
    FlagWindowMinimized   = 0x00000200_u32
    FlagWindowMaximized   = 0x00000400_u32
    FlagWindowUnfocused   = 0x00000800_u32
    FlagWindowTopmost     = 0x00001000_u32
    FlagWindowAlwaysRun   = 0x00000100_u32
    FlagWindowTransparent = 0x00000010_u32
    FlagWindowHighdpi     = 0x00002000_u32
    FlagMsaa4xHint        = 0x00000020_u32
    FlagInterlacedHint    = 0x00010000_u32
  end

  enum TraceLogLevel
    LogAll     = 0_u32
    LogTrace   = 1_u32
    LogDebug   = 2_u32
    LogInfo    = 3_u32
    LogWarning = 4_u32
    LogError   = 5_u32
    LogFatal   = 6_u32
  end

  enum KeyboardKey
    KeyNull         =   0_u32
    KeyApostrophe   =  39_u32
    KeyComma        =  44_u32
    KeyMinus        =  45_u32
    KeyPeriod       =  46_u32
    KeySlash        =  47_u32
    KeyZero         =  48_u32
    KeyOne          =  49_u32
    KeyTwo          =  50_u32
    KeyThree        =  51_u32
    KeyFour         =  52_u32
    KeyFive         =  53_u32
    KeySix          =  54_u32
    KeySeven        =  55_u32
    KeyEight        =  56_u32
    KeyNine         =  57_u32
    KeySemicolon    =  59_u32
    KeyEqual        =  61_u32
    KeyA            =  65_u32
    KeyB            =  66_u32
    KeyC            =  67_u32
    KeyD            =  68_u32
    KeyE            =  69_u32
    KeyF            =  70_u32
    KeyG            =  71_u32
    KeyH            =  72_u32
    KeyI            =  73_u32
    KeyJ            =  74_u32
    KeyK            =  75_u32
    KeyL            =  76_u32
    KeyM            =  77_u32
    KeyN            =  78_u32
    KeyO            =  79_u32
    KeyP            =  80_u32
    KeyQ            =  81_u32
    KeyR            =  82_u32
    KeyS            =  83_u32
    KeyT            =  84_u32
    KeyU            =  85_u32
    KeyV            =  86_u32
    KeyW            =  87_u32
    KeyX            =  88_u32
    KeyY            =  89_u32
    KeyZ            =  90_u32
    KeyLeftBracket  =  91_u32
    KeyBackslash    =  92_u32
    KeyRightBracket =  93_u32
    KeyGrave        =  96_u32
    KeySpace        =  32_u32
    KeyEscape       = 256_u32
    KeyEnter        = 257_u32
    KeyTab          = 258_u32
    KeyBackspace    = 259_u32
    KeyInsert       = 260_u32
    KeyDelete       = 261_u32
    KeyRight        = 262_u32
    KeyLeft         = 263_u32
    KeyDown         = 264_u32
    KeyUp           = 265_u32
    KeyPageUp       = 266_u32
    KeyPageDown     = 267_u32
    KeyHome         = 268_u32
    KeyEnd          = 269_u32
    KeyCapsLock     = 280_u32
    KeyScrollLock   = 281_u32
    KeyNumLock      = 282_u32
    KeyPrintScreen  = 283_u32
    KeyPause        = 284_u32
    KeyF1           = 290_u32
    KeyF2           = 291_u32
    KeyF3           = 292_u32
    KeyF4           = 293_u32
    KeyF5           = 294_u32
    KeyF6           = 295_u32
    KeyF7           = 296_u32
    KeyF8           = 297_u32
    KeyF9           = 298_u32
    KeyF10          = 299_u32
    KeyF11          = 300_u32
    KeyF12          = 301_u32
    KeyLeftShift    = 340_u32
    KeyLeftControl  = 341_u32
    KeyLeftAlt      = 342_u32
    KeyLeftSuper    = 343_u32
    KeyRightShift   = 344_u32
    KeyRightControl = 345_u32
    KeyRightAlt     = 346_u32
    KeyRightSuper   = 347_u32
    KeyKbMenu       = 348_u32
    KeyKp0          = 320_u32
    KeyKp1          = 321_u32
    KeyKp2          = 322_u32
    KeyKp3          = 323_u32
    KeyKp4          = 324_u32
    KeyKp5          = 325_u32
    KeyKp6          = 326_u32
    KeyKp7          = 327_u32
    KeyKp8          = 328_u32
    KeyKp9          = 329_u32
    KeyKpDecimal    = 330_u32
    KeyKpDivide     = 331_u32
    KeyKpMultiply   = 332_u32
    KeyKpSubtract   = 333_u32
    KeyKpAdd        = 334_u32
    KeyKpEnter      = 335_u32
    KeyKpEqual      = 336_u32
    KeyBack         =   4_u32
    KeyMenu         =  82_u32
    KeyVolumeUp     =  24_u32
    KeyVolumeDown   =  25_u32
  end

  enum MouseButton
    MouseButtonLeft    = 0_u32
    MouseButtonRight   = 1_u32
    MouseButtonMiddle  = 2_u32
    MouseButtonSide    = 3_u32
    MouseButtonExtra   = 4_u32
    MouseButtonForward = 5_u32
    MouseButtonBack    = 6_u32
  end

  enum MouseCursor
    MouseCursorDefault      =  0_u32
    MouseCursorArrow        =  1_u32
    MouseCursorIbeam        =  2_u32
    MouseCursorCrosshair    =  3_u32
    MouseCursorPointingHand =  4_u32
    MouseCursorResizeEw     =  5_u32
    MouseCursorResizeNs     =  6_u32
    MouseCursorResizeNwse   =  7_u32
    MouseCursorResizeNesw   =  8_u32
    MouseCursorResizeAll    =  9_u32
    MouseCursorNotAllowed   = 10_u32
  end

  enum GamepadButton
    GamepadButtonUnknown        =  0_u32
    GamepadButtonLeftFaceUp     =  1_u32
    GamepadButtonLeftFaceRight  =  2_u32
    GamepadButtonLeftFaceDown   =  3_u32
    GamepadButtonLeftFaceLeft   =  4_u32
    GamepadButtonRightFaceUp    =  5_u32
    GamepadButtonRightFaceRight =  6_u32
    GamepadButtonRightFaceDown  =  7_u32
    GamepadButtonRightFaceLeft  =  8_u32
    GamepadButtonLeftTrigger1   =  9_u32
    GamepadButtonLeftTrigger2   = 10_u32
    GamepadButtonRightTrigger1  = 11_u32
    GamepadButtonRightTrigger2  = 12_u32
    GamepadButtonMiddleLeft     = 13_u32
    GamepadButtonMiddle         = 14_u32
    GamepadButtonMiddleRight    = 15_u32
    GamepadButtonLeftThumb      = 16_u32
    GamepadButtonRightThumb     = 17_u32
  end

  enum GamepadAxis
    GamepadAxisLeftX        = 0_u32
    GamepadAxisLeftY        = 1_u32
    GamepadAxisRightX       = 2_u32
    GamepadAxisRightY       = 3_u32
    GamepadAxisLeftTrigger  = 4_u32
    GamepadAxisRightTrigger = 5_u32
  end

  enum MaterialMapIndex
    MaterialMapAlbedo     =  0_u32
    MaterialMapMetalness  =  1_u32
    MaterialMapNormal     =  2_u32
    MaterialMapRoughness  =  3_u32
    MaterialMapOcclusion  =  4_u32
    MaterialMapEmission   =  5_u32
    MaterialMapHeight     =  6_u32
    MaterialMapCubemap    =  7_u32
    MaterialMapIrradiance =  8_u32
    MaterialMapPrefilter  =  9_u32
    MaterialMapBrdf       = 10_u32
  end

  enum ShaderLocationIndex
    ShaderLocVertexPosition   =  0_u32
    ShaderLocVertexTexcoord01 =  1_u32
    ShaderLocVertexTexcoord02 =  2_u32
    ShaderLocVertexNormal     =  3_u32
    ShaderLocVertexTangent    =  4_u32
    ShaderLocVertexColor      =  5_u32
    ShaderLocMatrixMvp        =  6_u32
    ShaderLocMatrixView       =  7_u32
    ShaderLocMatrixProjection =  8_u32
    ShaderLocMatrixModel      =  9_u32
    ShaderLocMatrixNormal     = 10_u32
    ShaderLocVectorView       = 11_u32
    ShaderLocColorDiffuse     = 12_u32
    ShaderLocColorSpecular    = 13_u32
    ShaderLocColorAmbient     = 14_u32
    ShaderLocMapAlbedo        = 15_u32
    ShaderLocMapMetalness     = 16_u32
    ShaderLocMapNormal        = 17_u32
    ShaderLocMapRoughness     = 18_u32
    ShaderLocMapOcclusion     = 19_u32
    ShaderLocMapEmission      = 20_u32
    ShaderLocMapHeight        = 21_u32
    ShaderLocMapCubemap       = 22_u32
    ShaderLocMapIrradiance    = 23_u32
    ShaderLocMapPrefilter     = 24_u32
    ShaderLocMapBrdf          = 25_u32
  end

  enum ShaderUniformDataType
    ShaderUniformFloat     = 0_u32
    ShaderUniformVec2      = 1_u32
    ShaderUniformVec3      = 2_u32
    ShaderUniformVec4      = 3_u32
    ShaderUniformInt       = 4_u32
    ShaderUniformIvec2     = 5_u32
    ShaderUniformIvec3     = 6_u32
    ShaderUniformIvec4     = 7_u32
    ShaderUniformSampler2d = 8_u32
  end

  enum ShaderAttributeDataType
    ShaderAttribFloat = 0_u32
    ShaderAttribVec2  = 1_u32
    ShaderAttribVec3  = 2_u32
    ShaderAttribVec4  = 3_u32
  end

  enum PixelFormat
    PixelFormatUncompressedGrayscale    =  1_u32
    PixelFormatUncompressedGrayAlpha    =  2_u32
    PixelFormatUncompressedR5g6b5       =  3_u32
    PixelFormatUncompressedR8g8b8       =  4_u32
    PixelFormatUncompressedR5g5b5a1     =  5_u32
    PixelFormatUncompressedR4g4b4a4     =  6_u32
    PixelFormatUncompressedR8g8b8a8     =  7_u32
    PixelFormatUncompressedR32          =  8_u32
    PixelFormatUncompressedR32g32b32    =  9_u32
    PixelFormatUncompressedR32g32b32a32 = 10_u32
    PixelFormatCompressedDxt1Rgb        = 11_u32
    PixelFormatCompressedDxt1Rgba       = 12_u32
    PixelFormatCompressedDxt3Rgba       = 13_u32
    PixelFormatCompressedDxt5Rgba       = 14_u32
    PixelFormatCompressedEtc1Rgb        = 15_u32
    PixelFormatCompressedEtc2Rgb        = 16_u32
    PixelFormatCompressedEtc2EacRgba    = 17_u32
    PixelFormatCompressedPvrtRgb        = 18_u32
    PixelFormatCompressedPvrtRgba       = 19_u32
    PixelFormatCompressedAstc4x4Rgba    = 20_u32
  end

  enum TextureFilter
    TextureFilterPoint          = 0_u32
    TextureFilterBilinear       = 1_u32
    TextureFilterTrilinear      = 2_u32
    TextureFilterAnisotropic4x  = 3_u32
    TextureFilterAnisotropic8x  = 4_u32
    TextureFilterAnisotropic16x = 5_u32
  end

  enum TextureWrap
    TextureWrapRepeat       = 0_u32
    TextureWrapClamp        = 1_u32
    TextureWrapMirrorRepeat = 2_u32
    TextureWrapMirrorClamp  = 3_u32
  end

  enum CubemapLayout
    CubemapLayoutAutoDetect       = 0_u32
    CubemapLayoutLineVertical     = 1_u32
    CubemapLayoutLineHorizontal   = 2_u32
    CubemapLayoutCrossThreeByFour = 3_u32
    CubemapLayoutCrossFourByThree = 4_u32
  end

  enum FontType
    FontDefault = 0_u32
    FontBitmap  = 1_u32
    FontSdf     = 2_u32
  end

  enum BlendMode
    BlendAlpha          = 0_u32
    BlendAdditive       = 1_u32
    BlendMultiplied     = 2_u32
    BlendAddColors      = 3_u32
    BlendSubtractColors = 4_u32
    BlendCustom         = 5_u32
  end

  enum Gesture
    GestureNone       =   0_u32
    GestureTap        =   1_u32
    GestureDoubletap  =   2_u32
    GestureHold       =   4_u32
    GestureDrag       =   8_u32
    GestureSwipeRight =  16_u32
    GestureSwipeLeft  =  32_u32
    GestureSwipeUp    =  64_u32
    GestureSwipeDown  = 128_u32
    GesturePinchIn    = 256_u32
    GesturePinchOut   = 512_u32
  end

  enum CameraMode
    CameraCustom      = 0_u32
    CameraFree        = 1_u32
    CameraOrbital     = 2_u32
    CameraFirstPerson = 3_u32
    CameraThirdPerson = 4_u32
  end

  enum CameraProjection
    CameraPerspective  = 0_u32
    CameraOrthographic = 1_u32
  end

  enum NPatchLayout
    NpatchNinePatch            = 0_u32
    NpatchThreePatchVertical   = 1_u32
    NpatchThreePatchHorizontal = 2_u32
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

  struct BoundingBox
    min : Vector3
    max : Vector3
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
  fun set_window_height = GetScreenHeight : In32
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



  fun show_cursor = ShowCursor

  fun hide_cursor = HideCursor

  fun cursor_hidden? = IsCursorHidden : Bool

  fun enable_cursor = EnableCursor

  fun disable_cursor = DisableCursor

  fun clear_background = ClearBackground(color : Color)

  fun begin_drawing = BeginDrawing

  fun end_drawing = EndDrawing

  fun begin_mode_2d = BeginMode2D(camera : Camera2D)

  fun end_mode_2d = EndMode2D

  fun begin_mode_3d = BeginMode3D(camera : Camera3D)

  fun end_mode_3d = EndMode3D

  fun begin_texture_mode = BeginTextureMode(target : RenderTexture2D)

  fun end_texture_mode = EndTextureMode

  fun get_mouse_ray = GetMouseRay(mousePosition : Vector2, camera : Camera3D) : Ray

  fun get_world_to_screen = GetWorldToScreen(position : Vector3, camera : Camera3D) : Vector2

  fun get_camera_matrix = GetCameraMatrix(camera : Camera3D) : Matrix

  fun set_target_fps = SetTargetFPS(fps : Int32)

  fun get_fps = GetFPS : Int32

  fun get_frame_time = GetFrameTime : Float32

  fun get_time = GetTime : Float64

  fun color_to_int = ColorToInt(color : Color) : Int32

  fun color_normalize = ColorNormalize(color : Color) : Vector4

  fun color_to_hsv = ColorToHSV(color : Color) : Vector3

  fun get_color = GetColor(hexValue : Int32) : Color

  fun fade = Fade(color : Color, alpha : Float32) : Color

  fun show_logo = ShowLogo

  fun set_config_flags = SetConfigFlags(flags : UInt8)

  fun set_trace_log = SetTraceLog(types : UInt8)

  fun trace_log = TraceLog(logType : Int32, text : UInt8*, ...)

  fun take_screenshot = TakeScreenshot(fileName : UInt8*)

  fun get_random_value = GetRandomValue(
    min : Int32,
    max : Int32
  ) : Int32

  fun file_extension? = IsFileExtension(
    fileName : UInt8*,
    ext : UInt8*
  ) : Bool

  fun get_extension = GetExtension(fileName : UInt8*) : UInt8*

  fun get_file_name = GetFileName(filePath : UInt8*) : UInt8*

  fun get_directory_path = GetDirectoryPath(
    fileName : UInt8*
  ) : UInt8*

  fun get_working_directory = GetWorkingDirectory : UInt8*

  fun change_directory = ChangeDirectory(dir : UInt8*) : Bool

  fun file_dropped? = IsFileDropped : Bool

  fun get_dropped_files = GetDroppedFiles(count : Int32*) : UInt8**

  fun clear_dropped_files = ClearDroppedFiles

  fun storage_save_value = StorageSaveValue(position : Int32, value : Int32)

  fun storage_load_value = StorageLoadValue(position : Int32) : Int32

  fun key_pressed? = IsKeyPressed(key : Int32) : Bool

  fun key_down? = IsKeyDown(key : Int32) : Bool

  fun key_released? = IsKeyReleased(key : Int32) : Bool

  fun key_up? = IsKeyUp(key : Int32) : Bool

  fun get_key_pressed = GetKeyPressed : Int32

  fun set_exit_key = SetExitKey(key : Int32)

  fun gamepad_available? = IsGamepadAvailable(gamepad : Int32) : Bool

  fun gamepad_name? = IsGamepadName(
    gamepad : Int32,
    name : UInt8*
  ) : Bool

  fun get_gamepad_name = GetGamepadName(gamepad : Int32) : UInt8*

  fun gamepad_button_pressed? = IsGamepadButtonPressed(
    gamepad : Int32,
    button : Int32
  ) : Bool

  fun gamepad_button_down? = IsGamepadButtonDown(
    gamepad : Int32,
    button : Int32
  ) : Bool

  fun gamepad_button_released? = IsGamepadButtonReleased(
    gamepad : Int32,
    button : Int32
  ) : Bool

  fun gamepad_button_up? = IsGamepadButtonUp(gamepad : Int32, button : Int32) : Bool

  fun get_gamepad_button_pressed = GetGamepadButtonPressed : Int32

  fun get_gamepad_axis_count = GetGamepadAxisCount(gamepad : Int32) : Int32

  fun get_gamepad_axis_movement = GetGamepadAxisMovement(
    gamepad : Int32,
    axis : Int32
  ) : Float32

  fun mouse_button_pressed? = IsMouseButtonPressed(button : Int32) : Bool

  fun mouse_button_down? = IsMouseButtonDown(button : Int32) : Bool

  fun mouse_button_released? = IsMouseButtonReleased(button : Int32) : Bool

  fun mouse_button_up? = IsMouseButtonUp(button : Int32) : Bool

  fun get_mouse_x = GetMouseX : Int32

  fun get_mouse_y = GetMouseY : Int32

  fun get_mouse_position = GetMousePosition : Vector2

  fun set_mouse_position = SetMousePosition(position : Vector2)

  fun set_mouse_scale = SetMouseScale(scale : Float32)

  fun get_mouse_wheel_move = GetMouseWheelMove : Int32

  fun get_touch_x = GetTouchX : Int32

  fun get_touch_y = GetTouchY : Int32

  fun get_touch_position = GetTouchPosition(index : Int32) : Vector2

  fun set_gestures_enabled = SetGesturesEnabled(gestureFlags : UInt32)

  fun gesture_detected? = IsGestureDetected(gesture : Int32) : Bool

  fun get_gesture_detected = GetGestureDetected : Int32

  fun get_touch_points_count = GetTouchPointsCount : Int32

  fun get_gesture_hold_duration = GetGestureHoldDuration : Float32

  fun get_gesture_drag_vector = GetGestureDragVector : Vector2

  fun get_gesture_drag_angle = GetGestureDragAngle : Float32

  fun get_gesture_pinch_angle = GetGesturePinchVector : Vector2

  fun get_gesture_pinch_angle = GetGesturePinchAngle : Float32

  fun set_camera_mode = SetCameraMode(camera : Camera3D, mode : Int32)

  fun update_camera = UpdateCamera(camera : Camera3D*)

  fun set_camera_pan_control = SetCameraPanControl(panKey : Int32)

  fun set_camera_alt_control = SetCameraAltControl(altKey : Int32)

  fun set_camera_alt_control = SetCameraSmoothZoomControl(szKey : Int32)

  fun set_camera_move_controls = SetCameraMoveControls(
    frontKey : Int32,
    backKey : Int32,
    rightKey : Int32,
    leftKey : Int32,
    upKey : Int32,
    downKey : Int32
  )

  fun draw_pixel = DrawPixel(posX : Int32, posY : Int32, color : Color)

  fun draw_pixel_v = DrawPixelV(position : Vector2, color : Color)

  fun draw_line = DrawLine(
    startPosX : Int32,
    startPosY : Int32,
    endPosX : Int32,
    endPosY : Int32,
    color : Color
  )

  fun draw_line_v = DrawLineV(startPos : Vector2, endPos : Vector2, color : Color)

  fun draw_line_ex = DrawLineEx(startPos : Vector2, endPos : Vector2, thick : Float32, color : Color)

  fun draw_line_bezier = DrawLineBezier(startPos : Vector2, endPos : Vector2, thick : Float32, color : Color)

  fun draw_circle = DrawCircle(
    centerX : Int32,
    centerY : Int32,
    radius : Float32,
    color : Color
  )

  fun draw_circle_gradient = DrawCircleGradient(
    centerX : Int32,
    centerY : Int32,
    radius : Float32,
    color1 : Color,
    color2 : Color
  )

  fun draw_circle_v = DrawCircleV(center : Vector2, radius : Float32, color : Color)

  fun draw_circle_lines = DrawCircleLines(
    centerX : Int32,
    centerY : Int32,
    radius : Float32,
    color : Color
  )

  fun draw_rectangle = DrawRectangle(
    posX : Int32,
    posY : Int32,
    width : Int32,
    height : Int32,
    color : Color
  )

  fun draw_rectangle_v = DrawRectangleV(position : Vector2, size : Vector2, color : Color)

  fun draw_rectangle_rec = DrawRectangleRec(rec : Rectangle, color : Color)

  fun draw_rectangle_pro = DrawRectanglePro(rec : Rectangle, origin : Vector2, rotation : Float32, color : Color)

  fun draw_rectangle_gradient_v = DrawRectangleGradientV(
    posX : Int32,
    posY : Int32,
    width : Int32,
    height : Int32,
    color1 : Color,
    color2 : Color
  )

  fun draw_rectangle_gradient_h = DrawRectangleGradientH(
    posX : Int32,
    posY : Int32,
    width : Int32,
    height : Int32,
    color1 : Color,
    color2 : Color
  )

  fun draw_rectangle_gradient_h = DrawRectangleGradientEx(
    rec : Rectangle,
    col1 : Color,
    col2 : Color,
    col3 : Color,
    col4 : Color
  )

  fun draw_rectangle_lines = DrawRectangleLines(
    posX : Int32,
    posY : Int32,
    width : Int32,
    height : Int32,
    color : Color
  )

  fun draw_rectangle_lines_ex = DrawRectangleLinesEx(rec : Rectangle, lineThick : Int32, color : Color)

  fun draw_triangle = DrawTriangle(v1 : Vector2, v2 : Vector2, v3 : Vector2, color : Color)

  fun draw_triangle_lines = DrawTriangleLines(v1 : Vector2, v2 : Vector2, v3 : Vector2, color : Color)

  fun draw_poly = DrawPoly(
    center : Vector2,
    sides : Int32,
    radius : Float32,
    rotation : Float32,
    color : Color
  )

  fun draw_poly_ex = DrawPolyEx(points : Vector2*, numPoints : Int32, color : Color)

  fun draw_poly_ex_lines = DrawPolyExLines(points : Vector2*, numPoints : Int32, color : Color)

  fun check_collision_recs = CheckCollisionRecs(rec1 : Rectangle, rec2 : Rectangle) : Bool

  fun check_collision_circles = CheckCollisionCircles(
    center1 : Vector2,
    radius1 : Float32,
    center2 : Vector2,
    radius2 : Float32
  ) : Bool

  fun check_collision_circle_rec = CheckCollisionCircleRec(center : Vector2, radius : Float32, rec : Rectangle) : Bool

  fun get_collision_rec = GetCollisionRec(rec1 : Rectangle, rec2 : Rectangle) : Rectangle

  fun check_collision_point_rec = CheckCollisionPointRec(point : Vector2, rec : Rectangle) : Bool

  fun check_collision_point_circle = CheckCollisionPointCircle(point : Vector2, center : Vector2, radius : Float32) : Bool

  fun check_collision_point_triangle = CheckCollisionPointTriangle(
    point : Vector2,
    p1 : Vector2,
    p2 : Vector2,
    p3 : Vector2
  ) : Bool

  fun load_image = LoadImage(fileName : UInt8*) : Image

  fun load_image_ex = LoadImageEx(
    pixels : Color*,
    width : Int32,
    height : Int32
  ) : Image

  fun load_image_pro = LoadImagePro(
    data : Void*,
    width : Int32,
    height : Int32,
    format : Int32
  ) : Image

  fun load_image_raw = LoadImageRaw(
    fileName : UInt8*,
    width : Int32,
    height : Int32,
    format : Int32,
    headerSize : Int32
  ) : Image

  fun export_image = ExportImage(fileName : UInt8*, image : Image)

  fun load_texture = LoadTexture(fileName : UInt8*) : Texture2D

  fun load_texture_from_image = LoadTextureFromImage(image : Image) : Texture2D

  fun load_render_texture = LoadRenderTexture(
    width : Int32,
    height : Int32
  ) : RenderTexture2D

  fun unload_image = UnloadImage(image : Image)

  fun unload_texture = UnloadTexture(texture : Texture2D)

  fun unload_render_texture = UnloadRenderTexture(target : RenderTexture2D)

  fun get_image_data = GetImageData(image : Image) : Color*

  fun get_image_data_normalized = GetImageDataNormalized(image : Image) : Vector4*

  fun get_pixel_data_size = GetPixelDataSize(
    width : Int32,
    height : Int32,
    format : Int32
  ) : Int32

  fun get_texture_data = GetTextureData(texture : Texture2D) : Image

  fun update_texture = UpdateTexture(texture : Texture2D, pixels : Void*)

  fun image_copy = ImageCopy(image : Image) : Image

  fun imgae_to_pot = ImageToPOT(image : Image**, fillColor : Color)

  fun image_format = ImageFormat(image : Image**, newFormat : Int32)

  fun image_alpha_mask = ImageAlphaMask(image : Image**, alphaMask : Image)

  fun image_alpha_clear = ImageAlphaClear(image : Image**, color : Color, threshold : Float32)

  fun imgae_alpha_crop = ImageAlphaCrop(image : Image**, threshold : Float32)

  fun image_alpha_premultiply = ImageAlphaPremultiply(image : Image**)

  fun image_crop = ImageCrop(image : Image**, crop : Rectangle)

  fun image_resize = ImageResize(
    image : Image**,
    newWidth : Int32,
    newHeight : Int32
  )

  fun image_resize_nn = ImageResizeNN(
    image : Image**,
    newWidth : Int32,
    newHeight : Int32
  )

  fun image_resize_canvas = ImageResizeCanvas(
    image : Image**,
    newWidth : Int32,
    newHeight : Int32,
    offsetX : Int32,
    offsetY : Int32,
    color : Color
  )

  fun image_mipmaps = ImageMipmaps(image : Image**)

  fun image_dither = ImageDither(
    image : Image**,
    rBpp : Int32,
    gBpp : Int32,
    bBpp : Int32,
    aBpp : Int32
  )

  fun imgae_text = ImageText(
    text : UInt8*,
    fontSize : Int32,
    color : Color
  ) : Image

  fun imgae_text_ex = ImageTextEx(
    font : Font,
    text : UInt8*,
    fontSize : Float32,
    spacing : Float32,
    tint : Color
  ) : Image

  fun image_draw = ImageDraw(dst : Image**, src : Image, srcRec : Rectangle, dstRec : Rectangle)

  fun image_draw_rectangle = ImageDrawRectangle(dst : Image**, position : Vector2, rec : Rectangle, color : Color)

  fun image_draw_text = ImageDrawText(
    dst : Image**,
    position : Vector2,
    text : UInt8*,
    fontSize : Int32,
    color : Color
  )

  fun image_draw_text_ex = ImageDrawTextEx(
    dst : Image**,
    position : Vector2,
    font : Font,
    text : UInt8*,
    fontSize : Float32,
    spacing : Float32,
    color : Color
  )

  fun image_flip_vertical = ImageFlipVertical(image : Image**)

  fun image_flip_horizontal = ImageFlipHorizontal(image : Image**)

  fun image_rotate_cw = ImageRotateCW(image : Image*)

  fun image_rotate_ccw = ImageRotateCCW(image : Image*)

  fun imgae_color_tint = ImageColorTint(image : Image*, color : Color)

  fun imgae_color_invert = ImageColorInvert(image : Image*)

  fun imgae_color_grayscale = ImageColorGrayscale(image : Image*)

  fun imgae_color_contrast = ImageColorContrast(image : Image*, contrast : Float32)

  fun imgae_color_brightness = ImageColorBrightness(image : Image*, brightness : Int32)

  fun imgae_color_replace = ImageColorReplace(image : Image*, color : Color, replace : Color)

  fun gen_image_color = GenImageColor(
    width : Int32,
    height : Int32,
    color : Color
  ) : Image

  fun gen_image_gradient_v = GenImageGradientV(
    width : Int32,
    height : Int32,
    top : Color,
    bottom : Color
  ) : Image

  fun gen_image_gradient_h = GenImageGradientH(
    width : Int32,
    height : Int32,
    left : Color,
    right : Color
  ) : Image

  fun gen_image_gradient_radial = GenImageGradientRadial(
    width : Int32,
    height : Int32,
    density : Float32,
    inner : Color,
    outer : Color
  ) : Image

  fun gen_image_checked = GenImageChecked(
    width : Int32,
    height : Int32,
    checksX : Int32,
    checksY : Int32,
    col1 : Color,
    col2 : Color
  ) : Image

  fun gen_image_white_noise = GenImageWhiteNoise(
    width : Int32,
    height : Int32,
    factor : Float32
  ) : Image

  fun gen_image_perlin_noise = GenImagePerlinNoise(
    width : Int32,
    height : Int32,
    offsetX : Int32,
    offsetY : Int32,
    scale : Float32
  ) : Image

  fun gen_image_cellular = GenImageCellular(
    width : Int32,
    height : Int32,
    tileSize : Int32
  ) : Image

  fun gen_texture_mipmaps = GenTextureMipmaps(texture : Texture2D*)

  fun set_texture_filter = SetTextureFilter(texture : Texture2D, filterMode : Int32)

  fun set_texture_wrap = SetTextureWrap(texture : Texture2D, wrapMode : Int32)

  fun draw_texture = DrawTexture(
    texture : Texture2D,
    posX : Int32,
    posY : Int32,
    tint : Color
  )

  fun draw_texture_v = DrawTextureV(texture : Texture2D, position : Vector2, tint : Color)

  fun draw_texture_ex = DrawTextureEx(
    texture : Texture2D,
    position : Vector2,
    rotation : Float32,
    scale : Float32,
    tint : Color
  )

  fun draw_texture_rec = DrawTextureRec(texture : Texture2D, sourceRec : Rectangle, position : Vector2, tint : Color)

  fun draw_texture_pro = DrawTexturePro(
    texture : Texture2D,
    sourceRec : Rectangle,
    destRec : Rectangle,
    origin : Vector2,
    rotation : Float32,
    tint : Color
  )

  fun get_font_default = GetFontDefault : Font

  fun load_font = LoadFont(fileName : UInt8*) : Font

  fun load_font_ex = LoadFontEx(
    fileName : UInt8*,
    fontSize : Int32,
    charsCount : Int32,
    fontChars : Int32*
  ) : Font

  fun load_font_data = LoadFontData(
    fileName : UInt8*,
    fontSize : Int32,
    fontChars : Int32*,
    charsCount : Int32,
    sdf : Bool
  ) : CharInfo*

  fun gen_font_atlas = GenImageFontAtlas(
    chars : CharInfo*,
    fontSize : Int32,
    charsCount : Int32,
    padding : Int32,
    packMethod : Int32
  ) : Image

  fun unload_font = UnloadFont(font : Font)

  fun draw_fps = DrawFPS(posX : Int32, posY : Int32)

  fun draw_text = DrawText(
    text : UInt8*,
    posX : Int32,
    posY : Int32,
    fontSize : Int32,
    color : Color
  )

  fun draw_text_ex = DrawTextEx(
    font : Font,
    text : UInt8*,
    position : Vector2,
    fontSize : Float32,
    spacing : Float32,
    tint : Color
  )

  fun measure_text = MeasureText(
    text : UInt8*,
    fontSize : Int32
  ) : Int32

  fun measure_text_ex = MeasureTextEx(
    font : Font,
    text : UInt8*,
    fontSize : Float32,
    spacing : Float32
  ) : Vector2

  fun format_text = FormatText(text : UInt8*, ...) : UInt8*

  fun sub_text = SubText(
    text : UInt8*,
    position : Int32,
    length : Int32
  ) : UInt8*

  fun get_glyph_index = GetGlyphIndex(font : Font, character : Int32) : Int32

  fun draw_line_3d = DrawLine3D(startPos : Vector3, endPos : Vector3, color : Color)

  fun draw_circle_3d = DrawCircle3D(
    center : Vector3,
    radius : Float32,
    rotationAxis : Vector3,
    rotationAngle : Float32,
    color : Color
  )

  fun draw_cube = DrawCube(position : Vector3, width : Float32, height : Float32, length : Float32, color : Color)

  fun draw_cube_v = DrawCubeV(position : Vector3, size : Vector3, color : Color)

  fun draw_cube_wires = DrawCubeWires(position : Vector3, width : Float32, height : Float32, length : Float32, color : Color)

  fun draw_cube_texture = DrawCubeTexture(
    texture : Texture2D,
    position : Vector3,
    width : Float32,
    height : Float32,
    length : Float32,
    color : Color
  )

  fun draw_sphere = DrawSphere(centerPos : Vector3, radius : Float32, color : Color)

  fun draw_sphere_ex = DrawSphereEx(
    centerPos : Vector3,
    radius : Float32,
    rings : Int32,
    slices : Int32,
    color : Color
  )

  fun draw_sphere_wires = DrawSphereWires(
    centerPos : Vector3,
    radius : Float32,
    rings : Int32,
    slices : Int32,
    color : Color
  )

  fun draw_cylinder = DrawCylinder(
    position : Vector3,
    radiusTop : Float32,
    radiusBottom : Float32,
    height : Float32,
    slices : Int32,
    color : Color
  )

  fun draw_cylinder_wires = DrawCylinderWires(
    position : Vector3,
    radiusTop : Float32,
    radiusBottom : Float32,
    height : Float32,
    slices : Int32,
    color : Color
  )

  fun draw_plane = DrawPlane(centerPos : Vector3, size : Vector2, color : Color)

  fun draw_ray = DrawRay(ray : Ray, color : Color)

  fun draw_grid = DrawGrid(slices : Int32, spacing : Float32)

  fun draw_gizmo = DrawGizmo(position : Vector3)

  fun load_model = LoadModel(fileName : UInt8*) : Model

  fun load_model_from_mesh = LoadModelFromMesh(mesh : Mesh) : Model

  fun unload_model = UnloadModel(model : Model)

  fun load_mesh = LoadMesh(fileName : UInt8*) : Mesh

  fun unload_mesh = UnloadMesh(mesh : Mesh*)

  fun export_mesh = ExportMesh(fileName : UInt8*, mesh : Mesh)

  fun mesh_bounding_box = MeshBoundingBox(mesh : Mesh) : BoundingBox

  fun mesh_tangents = MeshTangents(mesh : Mesh*)

  fun mesh_binormals = MeshBinormals(mesh : Mesh*)

  fun gen_mesh_plane = GenMeshPlane(
    width : Float32,
    length : Float32,
    resX : Int32,
    resZ : Int32
  ) : Mesh

  fun gen_mesh_cube = GenMeshCube(width : Float32, height : Float32, length : Float32) : Mesh

  fun gen_mesh_sphere = GenMeshSphere(
    radius : Float32,
    rings : Int32,
    slices : Int32
  ) : Mesh

  fun gen_mesh_hemi_sphere = GenMeshHemiSphere(
    radius : Float32,
    rings : Int32,
    slices : Int32
  ) : Mesh

  fun gen_mesh_cylinder = GenMeshCylinder(radius : Float32, height : Float32, slices : Int32) : Mesh

  fun gen_mesh_torus = GenMeshTorus(
    radius : Float32,
    size : Float32,
    radSeg : Int32,
    sides : Int32
  ) : Mesh

  fun gen_mesh_knot = GenMeshKnot(
    radius : Float32,
    size : Float32,
    radSeg : Int32,
    sides : Int32
  ) : Mesh

  fun gen_mesh_heightmap = GenMeshHeightmap(heightmap : Image, size : Vector3) : Mesh

  fun gen_mesh_cubicmap = GenMeshCubicmap(cubicmap : Image, cubeSize : Vector3) : Mesh

  fun load_material = LoadMaterial(fileName : UInt8*) : Material

  fun load_material_default = LoadMaterialDefault : Material

  fun unload_material = UnloadMaterial(material : Material)

  fun draw_model = DrawModel(model : Model, position : Vector3, scale : Float32, tint : Color)

  fun draw_model_ex = DrawModelEx(
    model : Model,
    position : Vector3,
    rotationAxis : Vector3,
    rotationAngle : Float32,
    scale : Vector3,
    tint : Color
  )

  fun draw_model_wires = DrawModelWires(model : Model, position : Vector3, scale : Float32, tint : Color)

  fun draw_model_wires_ex = DrawModelWiresEx(
    model : Model,
    position : Vector3,
    rotationAxis : Vector3,
    rotationAngle : Float32,
    scale : Vector3,
    tint : Color
  )

  fun draw_bounding_box = DrawBoundingBox(box_ : BoundingBox, color : Color)

  fun draw_billboard = DrawBillboard(
    camera : Camera3D,
    texture : Texture2D,
    center : Vector3,
    size : Float32,
    tint : Color
  )

  fun draw_billboard_rec = DrawBillboardRec(
    camera : Camera3D,
    texture : Texture2D,
    sourceRec : Rectangle,
    center : Vector3,
    size : Float32,
    tint : Color
  )

  fun check_collision_spheres = CheckCollisionSpheres(
    centerA : Vector3,
    radiusA : Float32,
    centerB : Vector3,
    radiusB : Float32
  ) : Bool

  fun check_collision_boxes = CheckCollisionBoxes(box1 : BoundingBox, box2 : BoundingBox) : Bool

  fun check_collision_box_sphere = CheckCollisionBoxSphere(
    box_ : BoundingBox,
    centerSphere : Vector3,
    radiusSphere : Float32
  ) : Bool

  fun check_collision_ray_sphere = CheckCollisionRaySphere(ray : Ray, spherePosition : Vector3, sphereRadius : Float32) : Bool

  fun check_collision_ray_sphere_ex = CheckCollisionRaySphereEx(
    ray : Ray,
    spherePosition : Vector3,
    sphereRadius : Float32,
    collisionPoint : Vector3*
  ) : Bool

  fun check_collision_ray_box = CheckCollisionRayBox(ray : Ray, box_ : BoundingBox) : Bool

  fun get_collision_ray_model = GetCollisionRayModel(ray : Ray, model : Model*) : RayHitInfo

  fun get_collision_ray_triangle = GetCollisionRayTriangle(ray : Ray, p1 : Vector3, p2 : Vector3, p3 : Vector3) : RayHitInfo

  fun get_collision_ray_ground = GetCollisionRayGround(ray : Ray, groundHeight : Float32) : RayHitInfo

  fun load_text = LoadText(fileName : UInt8*) : UInt8*

  fun load_shader = LoadShader(
    vsFileName : UInt8*,
    fsFileName : UInt8*
  ) : Shader

  fun load_shader_code = LoadShaderCode(
    vsCode : UInt8*,
    fsCode : UInt8*
  ) : Shader

  fun unload_shader = UnloadShader(shader : Shader)

  fun get_shader_default = GetShaderDefault : Shader

  fun get_texture_default = GetTextureDefault : Texture2D

  fun get_shader_location = GetShaderLocation(
    shader : Shader,
    uniformName : UInt8*
  ) : Int32

  fun set_shader_value = SetShaderValue(
    shader : Shader,
    uniformLoc : Int32,
    value : Float32*,
    size : Int32
  )

  fun set_shader_valuei = SetShaderValuei(
    shader : Shader,
    uniformLoc : Int32,
    value : Int32*,
    size : Int32
  )

  fun set_shader_value_matrix = SetShaderValueMatrix(shader : Shader, uniformLoc : Int32, mat : Matrix)

  fun set_matrix_projection = SetMatrixProjection(proj : Matrix)

  fun set_matrix_modelview = SetMatrixModelview(view : Matrix)

  fun get_matrix_modelview = GetMatrixModelview : Matrix

  fun gen_texture_cubemap = GenTextureCubemap(
    shader : Shader,
    skyHDR : Texture2D,
    size : Int32
  ) : Texture2D

  fun get_texture_irradiance = GenTextureIrradiance(
    shader : Shader,
    cubemap : Texture2D,
    size : Int32
  ) : Texture2D

  fun gen_texture_prefilter = GenTexturePrefilter(
    shader : Shader,
    cubemap : Texture2D,
    size : Int32
  ) : Texture2D

  fun gen_texture_BRDF = GenTextureBRDF(
    shader : Shader,
    cubemap : Texture2D,
    size : Int32
  ) : Texture2D

  fun begin_shader_mode = BeginShaderMode(shader : Shader)

  fun end_shader_mode = EndShaderMode

  fun begin_blend_mode = BeginBlendMode(mode : Int32)

  fun end_blend_mode = EndBlendMode

  fun get_vr_device_info = GetVrDeviceInfo(vrDeviceType : Int32) : VrDeviceInfo

  fun init_vr_simulator = InitVrSimulator(info : VrDeviceInfo)

  fun close_vr_simulator = CloseVrSimulator

  fun vr_simulator_ready? = IsVrSimulatorReady : Bool

  fun set_vr_distortion_shader = SetVrDistortionShader(shader : Shader)

  fun update_vr_tracking = UpdateVrTracking(camera : Camera3D*)

  fun toggle_vr_mode = ToggleVrMode

  fun begin_vr_drawing = BeginVrDrawing

  fun end_vr_drawing = EndVrDrawing

  fun init_audio_devide = InitAudioDevice

  fun close_audio_device = CloseAudioDevice

  fun audio_device_ready? = IsAudioDeviceReady : Bool

  fun set_master_volume = SetMasterVolume(volume : Float32)

  fun load_wave = LoadWave(fileName : UInt8*) : Wave

  fun load_wave_ex = LoadWaveEx(
    data : Void*,
    sampleCount : Int32,
    sampleRate : Int32,
    sampleSize : Int32,
    channels : Int32
  ) : Wave

  fun load_sound = LoadSound(fileName : UInt8*) : Sound

  fun load_sound_from_wave = LoadSoundFromWave(wave : Wave) : Sound

  fun update_sound = UpdateSound(
    sound : Sound,
    data : Void*,
    samplesCount : Int32
  )

  fun unload_wave = UnloadWave(wave : Wave)

  fun unload_sound = UnloadSound(sound : Sound)

  fun play_sound = PlaySound(sound : Sound)

  fun pause_sound = PauseSound(sound : Sound)

  fun resume_sound = ResumeSound(sound : Sound)

  fun stop_sound = StopSound(sound : Sound)

  fun sound_playing? = IsSoundPlaying(sound : Sound) : Bool

  fun set_sound_volume = SetSoundVolume(sound : Sound, volume : Float32)

  fun set_sound_pitch = SetSoundPitch(sound : Sound, pitch : Float32)

  fun wave_format = WaveFormat(
    wave : Wave*,
    sampleRate : Int32,
    sampleSize : Int32,
    channels : Int32
  )

  fun wave_copy = WaveCopy(wave : Wave) : Wave

  fun wave_crop = WaveCrop(
    wave : Wave*,
    initSample : Int32,
    finalSample : Int32
  )

  fun get_wave_data = GetWaveData(wave : Wave) : Float32*

  fun load_music_stream = LoadMusicStream(fileName : UInt8*) : Music

  fun unload_music_stream = UnloadMusicStream(music : Music)

  fun play_music_stream = PlayMusicStream(music : Music)

  fun update_music_stream = UpdateMusicStream(music : Music)

  fun stop_music_stream = StopMusicStream(music : Music)

  fun pause_music_stream = PauseMusicStream(music : Music)

  fun resume_music_stream = ResumeMusicStream(music : Music)

  fun music_playing? = IsMusicPlaying(music : Music) : Bool

  fun set_music_volume = SetMusicVolume(music : Music, volume : Float32)

  fun set_music_pitch = SetMusicPitch(music : Music, pitch : Float32)

  fun set_music_loop_count = SetMusicLoopCount(music : Music, count : Int32)

  fun get_music_time_length = GetMusicTimeLength(music : Music) : Float32

  fun get_music_time_played = GetMusicTimePlayed(music : Music) : Float32

  fun init_audio_stream = InitAudioStream(
    sampleRate : UInt32,
    sampleSize : UInt32,
    channels : UInt32
  ) : AudioStream

  fun update_audio_stream = UpdateAudioStream(
    stream : AudioStream,
    data : Void*,
    samplesCount : Int32
  )

  fun close_audio_stream = CloseAudioStream(stream : AudioStream)

  fun audio_buffer_precessed? = IsAudioBufferProcessed(stream : AudioStream) : Bool

  fun play_audio_stream = PlayAudioStream(stream : AudioStream)

  fun pause_audio_stream = PauseAudioStream(stream : AudioStream)

  fun resume_audio_stream = ResumeAudioStream(stream : AudioStream)

  fun audio_stream_playing? = IsAudioStreamPlaying(stream : AudioStream) : Bool

  fun stop_audio_stream = StopAudioStream(stream : AudioStream)

  fun set_audio_stream_volume = SetAudioStreamVolume(stream : AudioStream, volume : Float32)

  fun set_audio_stream_pitch = SetAudioStreamPitch(stream : AudioStream, pitch : Float32)
end
