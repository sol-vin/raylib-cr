{% if flag?(:linux) && flag?(:x86_64) %}
    @[Link(ldflags: "-L#{__DIR__}/../native/linux -lraylib -lm")]
{% elsif flag?(:darwin) && flag?(:x86_64) %}
    @[Link(ldflags: "-L#{__DIR__}/../native/darwin -lraylib")]
{% end %}
lib LibRaylib
  PI                          =    3.141592653589793
  DEG2RAD                     = 0.017453292519943295
  RAD2DEG                     =    57.29577951308232
  FLAG_SHOW_LOGO              =                1_u32
  FLAG_FULLSCREEN_MODE        =                2_u32
  FLAG_WINDOW_RESIZABLE       =                4_u32
  FLAG_WINDOW_UNDECORATED     =                8_u32
  FLAG_MSAA_4X_HINT           =               32_u32
  FLAG_VSYNC_HINT             =               64_u32
  KEY_SPACE                   =               32_u32
  KEY_ESCAPE                  =              256_u32
  KEY_ENTER                   =              257_u32
  KEY_TAB                     =              258_u32
  KEY_BACKSPACE               =              259_u32
  KEY_INSERT                  =              260_u32
  KEY_DELETE                  =              261_u32
  KEY_RIGHT                   =              262_u32
  KEY_LEFT                    =              263_u32
  KEY_DOWN                    =              264_u32
  KEY_UP                      =              265_u32
  KEY_PAGE_UP                 =              266_u32
  KEY_PAGE_DOWN               =              267_u32
  KEY_HOME                    =              268_u32
  KEY_END                     =              269_u32
  KEY_CAPS_LOCK               =              280_u32
  KEY_SCROLL_LOCK             =              281_u32
  KEY_NUM_LOCK                =              282_u32
  KEY_PRINT_SCREEN            =              283_u32
  KEY_PAUSE                   =              284_u32
  KEY_F1                      =              290_u32
  KEY_F2                      =              291_u32
  KEY_F3                      =              292_u32
  KEY_F4                      =              293_u32
  KEY_F5                      =              294_u32
  KEY_F6                      =              295_u32
  KEY_F7                      =              296_u32
  KEY_F8                      =              297_u32
  KEY_F9                      =              298_u32
  KEY_F10                     =              299_u32
  KEY_F11                     =              300_u32
  KEY_F12                     =              301_u32
  KEY_LEFT_SHIFT              =              340_u32
  KEY_LEFT_CONTROL            =              341_u32
  KEY_LEFT_ALT                =              342_u32
  KEY_RIGHT_SHIFT             =              344_u32
  KEY_RIGHT_CONTROL           =              345_u32
  KEY_RIGHT_ALT               =              346_u32
  KEY_GRAVE                   =               96_u32
  KEY_SLASH                   =               47_u32
  KEY_BACKSLASH               =               92_u32
  KEY_ZERO                    =               48_u32
  KEY_ONE                     =               49_u32
  KEY_TWO                     =               50_u32
  KEY_THREE                   =               51_u32
  KEY_FOUR                    =               52_u32
  KEY_FIVE                    =               53_u32
  KEY_SIX                     =               54_u32
  KEY_SEVEN                   =               55_u32
  KEY_EIGHT                   =               56_u32
  KEY_NINE                    =               57_u32
  KEY_A                       =               65_u32
  KEY_B                       =               66_u32
  KEY_C                       =               67_u32
  KEY_D                       =               68_u32
  KEY_E                       =               69_u32
  KEY_F                       =               70_u32
  KEY_G                       =               71_u32
  KEY_H                       =               72_u32
  KEY_I                       =               73_u32
  KEY_J                       =               74_u32
  KEY_K                       =               75_u32
  KEY_L                       =               76_u32
  KEY_M                       =               77_u32
  KEY_N                       =               78_u32
  KEY_O                       =               79_u32
  KEY_P                       =               80_u32
  KEY_Q                       =               81_u32
  KEY_R                       =               82_u32
  KEY_S                       =               83_u32
  KEY_T                       =               84_u32
  KEY_U                       =               85_u32
  KEY_V                       =               86_u32
  KEY_W                       =               87_u32
  KEY_X                       =               88_u32
  KEY_Y                       =               89_u32
  KEY_Z                       =               90_u32
  KEY_BACK                    =                4_u32
  KEY_MENU                    =               82_u32
  KEY_VOLUME_UP               =               24_u32
  KEY_VOLUME_DOWN             =               25_u32
  MOUSE_LEFT_BUTTON           =                0_u32
  MOUSE_RIGHT_BUTTON          =                1_u32
  MOUSE_MIDDLE_BUTTON         =                2_u32
  MAX_TOUCH_POINTS            =                2_u32
  GAMEPAD_PLAYER1             =                0_u32
  GAMEPAD_PLAYER2             =                1_u32
  GAMEPAD_PLAYER3             =                2_u32
  GAMEPAD_PLAYER4             =                3_u32
  GAMEPAD_PS3_BUTTON_TRIANGLE =                0_u32
  GAMEPAD_PS3_BUTTON_CIRCLE   =                1_u32
  GAMEPAD_PS3_BUTTON_CROSS    =                2_u32
  GAMEPAD_PS3_BUTTON_SQUARE   =                3_u32
  GAMEPAD_PS3_BUTTON_L1       =                6_u32
  GAMEPAD_PS3_BUTTON_R1       =                7_u32
  GAMEPAD_PS3_BUTTON_L2       =                4_u32
  GAMEPAD_PS3_BUTTON_R2       =                5_u32
  GAMEPAD_PS3_BUTTON_START    =                8_u32
  GAMEPAD_PS3_BUTTON_SELECT   =                9_u32
  GAMEPAD_PS3_BUTTON_UP       =               24_u32
  GAMEPAD_PS3_BUTTON_RIGHT    =               25_u32
  GAMEPAD_PS3_BUTTON_DOWN     =               26_u32
  GAMEPAD_PS3_BUTTON_LEFT     =               27_u32
  GAMEPAD_PS3_BUTTON_PS       =               12_u32
  GAMEPAD_PS3_AXIS_LEFT_X     =                0_u32
  GAMEPAD_PS3_AXIS_LEFT_Y     =                1_u32
  GAMEPAD_PS3_AXIS_RIGHT_X    =                2_u32
  GAMEPAD_PS3_AXIS_RIGHT_Y    =                5_u32
  GAMEPAD_PS3_AXIS_L2         =                3_u32
  GAMEPAD_PS3_AXIS_R2         =                4_u32
  GAMEPAD_XBOX_BUTTON_A       =                0_u32
  GAMEPAD_XBOX_BUTTON_B       =                1_u32
  GAMEPAD_XBOX_BUTTON_X       =                2_u32
  GAMEPAD_XBOX_BUTTON_Y       =                3_u32
  GAMEPAD_XBOX_BUTTON_LB      =                4_u32
  GAMEPAD_XBOX_BUTTON_RB      =                5_u32
  GAMEPAD_XBOX_BUTTON_SELECT  =                6_u32
  GAMEPAD_XBOX_BUTTON_START   =                7_u32
  GAMEPAD_XBOX_BUTTON_UP      =               10_u32
  GAMEPAD_XBOX_BUTTON_RIGHT   =               11_u32
  GAMEPAD_XBOX_BUTTON_DOWN    =               12_u32
  GAMEPAD_XBOX_BUTTON_LEFT    =               13_u32
  GAMEPAD_XBOX_BUTTON_HOME    =                8_u32
  GAMEPAD_ANDROID_DPAD_UP     =               19_u32
  GAMEPAD_ANDROID_DPAD_DOWN   =               20_u32
  GAMEPAD_ANDROID_DPAD_LEFT   =               21_u32
  GAMEPAD_ANDROID_DPAD_RIGHT  =               22_u32
  GAMEPAD_ANDROID_DPAD_CENTER =               23_u32
  GAMEPAD_ANDROID_BUTTON_A    =               96_u32
  GAMEPAD_ANDROID_BUTTON_B    =               97_u32
  GAMEPAD_ANDROID_BUTTON_C    =               98_u32
  GAMEPAD_ANDROID_BUTTON_X    =               99_u32
  GAMEPAD_ANDROID_BUTTON_Y    =              100_u32
  GAMEPAD_ANDROID_BUTTON_Z    =              101_u32
  GAMEPAD_ANDROID_BUTTON_L1   =              102_u32
  GAMEPAD_ANDROID_BUTTON_R1   =              103_u32
  GAMEPAD_ANDROID_BUTTON_L2   =              104_u32
  GAMEPAD_ANDROID_BUTTON_R2   =              105_u32
  GAMEPAD_XBOX_AXIS_LEFT_X    =                0_u32
  GAMEPAD_XBOX_AXIS_LEFT_Y    =                1_u32
  GAMEPAD_XBOX_AXIS_RIGHT_X   =                2_u32
  GAMEPAD_XBOX_AXIS_RIGHT_Y   =                3_u32
  GAMEPAD_XBOX_AXIS_LT        =                4_u32
  GAMEPAD_XBOX_AXIS_RT        =                5_u32
  MAX_SHADER_LOCATIONS        =               32_u32
  MAX_MATERIAL_MAPS           =               12_u32
  LOG_INFO                    =                1_u32
  LOG_WARNING                 =                2_u32
  LOG_ERROR                   =                4_u32
  LOG_DEBUG                   =                8_u32
  LOG_OTHER                   =               16_u32
  LOC_VERTEX_POSITION         =                0_u32
  LOC_VERTEX_TEXCOORD01       =                1_u32
  LOC_VERTEX_TEXCOORD02       =                2_u32
  LOC_VERTEX_NORMAL           =                3_u32
  LOC_VERTEX_TANGENT          =                4_u32
  LOC_VERTEX_COLOR            =                5_u32
  LOC_MATRIX_MVP              =                6_u32
  LOC_MATRIX_MODEL            =                7_u32
  LOC_MATRIX_VIEW             =                8_u32
  LOC_MATRIX_PROJECTION       =                9_u32
  LOC_VECTOR_VIEW             =               10_u32
  LOC_COLOR_DIFFUSE           =               11_u32
  LOC_COLOR_SPECULAR          =               12_u32
  LOC_COLOR_AMBIENT           =               13_u32
  LOC_MAP_ALBEDO              =               14_u32
  LOC_MAP_METALNESS           =               15_u32
  LOC_MAP_NORMAL              =               16_u32
  LOC_MAP_ROUGHNESS           =               17_u32
  LOC_MAP_OCCLUSION           =               18_u32
  LOC_MAP_EMISSION            =               19_u32
  LOC_MAP_HEIGHT              =               20_u32
  LOC_MAP_CUBEMAP             =               21_u32
  LOC_MAP_IRRADIANCE          =               22_u32
  LOC_MAP_PREFILTER           =               23_u32
  LOC_MAP_BRDF                =               24_u32
  MAP_ALBEDO                  =                0_u32
  MAP_METALNESS               =                1_u32
  MAP_NORMAL                  =                2_u32
  MAP_ROUGHNESS               =                3_u32
  MAP_OCCLUSION               =                4_u32
  MAP_EMISSION                =                5_u32
  MAP_HEIGHT                  =                6_u32
  MAP_CUBEMAP                 =                7_u32
  MAP_IRRADIANCE              =                8_u32
  MAP_PREFILTER               =                9_u32
  MAP_BRDF                    =               10_u32
  UNCOMPRESSED_GRAYSCALE      =                1_u32
  UNCOMPRESSED_GRAY_ALPHA     =                2_u32
  UNCOMPRESSED_R5G6B5         =                3_u32
  UNCOMPRESSED_R8G8B8         =                4_u32
  UNCOMPRESSED_R5G5B5A1       =                5_u32
  UNCOMPRESSED_R4G4B4A4       =                6_u32
  UNCOMPRESSED_R8G8B8A8       =                7_u32
  UNCOMPRESSED_R32            =                8_u32
  UNCOMPRESSED_R32G32B32      =                9_u32
  UNCOMPRESSED_R32G32B32A32   =               10_u32
  COMPRESSED_DXT1_RGB         =               11_u32
  COMPRESSED_DXT1_RGBA        =               12_u32
  COMPRESSED_DXT3_RGBA        =               13_u32
  COMPRESSED_DXT5_RGBA        =               14_u32
  COMPRESSED_ETC1_RGB         =               15_u32
  COMPRESSED_ETC2_RGB         =               16_u32
  COMPRESSED_ETC2_EAC_RGBA    =               17_u32
  COMPRESSED_PVRT_RGB         =               18_u32
  COMPRESSED_PVRT_RGBA        =               19_u32
  COMPRESSED_ASTC_4x4_RGBA    =               20_u32
  COMPRESSED_ASTC_8x8_RGBA    =               21_u32
  FILTER_POINT                =                0_u32
  FILTER_BILINEAR             =                1_u32
  FILTER_TRILINEAR            =                2_u32
  FILTER_ANISOTROPIC_4X       =                3_u32
  FILTER_ANISOTROPIC_8X       =                4_u32
  FILTER_ANISOTROPIC_16X      =                5_u32
  WRAP_REPEAT                 =                0_u32
  WRAP_CLAMP                  =                1_u32
  WRAP_MIRROR                 =                2_u32
  BLEND_ALPHA                 =                0_u32
  BLEND_ADDITIVE              =                1_u32
  BLEND_MULTIPLIED            =                2_u32
  GESTURE_NONE                =                0_u32
  GESTURE_TAP                 =                1_u32
  GESTURE_DOUBLETAP           =                2_u32
  GESTURE_HOLD                =                4_u32
  GESTURE_DRAG                =                8_u32
  GESTURE_SWIPE_RIGHT         =               16_u32
  GESTURE_SWIPE_LEFT          =               32_u32
  GESTURE_SWIPE_UP            =               64_u32
  GESTURE_SWIPE_DOWN          =              128_u32
  GESTURE_PINCH_IN            =              256_u32
  GESTURE_PINCH_OUT           =              512_u32
  CAMERA_CUSTOM               =                0_u32
  CAMERA_FREE                 =                1_u32
  CAMERA_ORBITAL              =                2_u32
  CAMERA_FIRST_PERSON         =                3_u32
  CAMERA_THIRD_PERSON         =                4_u32
  CAMERA_PERSPECTIVE          =                0_u32
  CAMERA_ORTHOGRAPHIC         =                1_u32
  HMD_DEFAULT_DEVICE          =                0_u32
  HMD_OCULUS_RIFT_DK2         =                1_u32
  HMD_OCULUS_RIFT_CV1         =                2_u32
  HMD_OCULUS_GO               =                3_u32
  HMD_VALVE_HTC_VIVE          =                4_u32
  HMD_SONY_PSVR               =                5_u32

  alias LogType = UInt32
  alias ShaderLocationIndex = UInt32
  alias TexmapIndex = UInt32
  alias PixelFormat = UInt32
  alias TextureFilterMode = UInt32
  alias TextureWrapMode = UInt32
  alias BlendMode = UInt32
  alias Gestures = UInt32
  alias CameraMode = UInt32
  alias CameraType = UInt32
  alias VrDeviceType = UInt32
  alias Texture = Texture2D
  alias Quaternion = Vector4
  alias Music = MusicData*

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

  struct CharInfo
    value : Int32
    rec : Rectangle
    offestX : Int32
    offestY : Int32
    advanceX : Int32
    data : UInt8*
  end

  struct Font
    texture : Texture2D
    baseSize : Int32
    charsCount : Int32
    chars : CharInfo*
  end

  struct Camera3D
    position : Vector3
    target : Vector3
    up : Vector3
    fovy : Float32
    type_ : Int32
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
    vertexCount : Int32
    triangleCount : Int32
    vertices : Float32
    texcoords : Float32*
    texcoords2 : Float32*
    normals : Float32*
    tangents : Float32*
    colors : UInt8*
    indices : UInt16*
    vaoId : UInt32*
    vboId : StaticArray(UInt32, 7)
  end

  struct Shader
    id : UInt32
    locs : StaticArray(Int32, 32)
  end

  struct MaterialMap
    texture : Texture2D
    color : Color
    value : Float32
  end

  struct Material
    shader : Shader
    maps : StaticArray(MaterialMap, 12)
    params : Float32*
  end

  struct Model
    mesh : Mesh
    transform : Matrix
    material : Material
  end

  struct Ray
    position : Vector3
    direction : Vector3
  end

  struct RayHitInfo
    hit : Bool
    distance : Float32
    position : Vector3
    normal : Vector3
  end

  struct Wave
    sampleCount : UInt32
    sampleRate : UInt32
    sampleSize : UInt32
    channels : UInt32
    data : Void*
  end

  struct Sound
    audioBuffer : Void*
    source : UInt32
    buffer : UInt32
    format : Int32
  end

  struct MusicData
    _unused : StaticArray(UInt8, 0)
  end

  struct AudioStream
    sampleRate : UInt32
    sampleSize : UInt32
    channels : UInt32
    audioBuffer : Void*
    format : Int32
    source : UInt32
    buffers : StaticArray(UInt32, 2)
  end

  struct VrDeviceInfo
    hResolution : Int32
    vResolution : Int32
    hScreenSize : Float32
    vScreenSize : Float32
    vScreenCenter : Float32
    eyeToScreenDistance : Float32
    lensSeparationDistance : Float32
    pinterpupillaryDistance : Float32
    lensDistortionValues : StaticArray(Float32, 4)
    chromaAbCorrection : StaticArray(Float32, 4)
  end

  fun InitWindow(
    width : Int32,
    height : Int32,
    title : UInt8*
  )
  fun CloseWindow
  fun IsWindowReady : Bool
  fun WindowShouldClose : Bool
  fun IsWindowMinimized : Bool
  fun ToggleFullscreen
  fun SetWindowIcon(image : Image)
  fun SetWindowTitle(title : UInt8*)

  fun SetWindowPosition(x : Int32, y : Int32)

  fun SetWindowMonitor(monitor : Int32)

  fun SetWindowMinSize(width : Int32, height : Int32)

  fun SetWindowSize(width : Int32, height : Int32)

  fun GetScreenWidth : Int32

  fun GetScreenHeight : Int32

  fun ShowCursor

  fun HideCursor

  fun IsCursorHidden : Bool

  fun EnableCursor

  fun DisableCursor

  fun ClearBackground(color : Color)

  fun BeginDrawing

  fun EndDrawing

  fun BeginMode2D(camera : Camera2D)

  fun EndMode2D

  fun BeginMode3D(camera : Camera3D)

  fun EndMode3D

  fun BeginTextureMode(target : RenderTexture2D)

  fun EndTextureMode

  fun GetMouseRay(mousePosition : Vector2, camera : Camera3D) : Ray

  fun GetWorldToScreen(position : Vector3, camera : Camera3D) : Vector2

  fun GetCameraMatrix(camera : Camera3D) : Matrix

  fun SetTargetFPS(fps : Int32)

  fun GetFPS : Int32

  fun GetFrameTime : Float32

  fun GetTime : Float64

  fun ColorToInt(color : Color) : Int32

  fun ColorNormalize(color : Color) : Vector4

  fun ColorToHSV(color : Color) : Vector3

  fun GetColor(hexValue : Int32) : Color

  fun Fade(color : Color, alpha : Float32) : Color

  fun ShowLogo

  fun SetConfigFlags(flags : UInt8)

  fun SetTraceLog(types : UInt8)

  fun TraceLog(logType : Int32, text : UInt8*, ...)

  fun TakeScreenshot(fileName : UInt8*)

  fun GetRandomValue(
    min : Int32,
    max : Int32
  ) : Int32

  fun IsFileExtension(
    fileName : UInt8*,
    ext : UInt8*
  ) : Bool

  fun GetExtension(fileName : UInt8*) : UInt8*

  fun GetFileName(filePath : UInt8*) : UInt8*

  fun GetDirectoryPath(
    fileName : UInt8*
  ) : UInt8*

  fun GetWorkingDirectory : UInt8*

  fun ChangeDirectory(dir : UInt8*) : Bool

  fun IsFileDropped : Bool

  fun GetDroppedFiles(count : Int32*) : UInt8**

  fun ClearDroppedFiles

  fun StorageSaveValue(position : Int32, value : Int32)

  fun StorageLoadValue(position : Int32) : Int32

  fun IsKeyPressed(key : Int32) : Bool

  fun IsKeyDown(key : Int32) : Bool

  fun IsKeyReleased(key : Int32) : Bool

  fun IsKeyUp(key : Int32) : Bool

  fun GetKeyPressed : Int32

  fun SetExitKey(key : Int32)

  fun IsGamepadAvailable(gamepad : Int32) : Bool

  fun IsGamepadName(
    gamepad : Int32,
    name : UInt8*
  ) : Bool

  fun GetGamepadName(gamepad : Int32) : UInt8*

  fun IsGamepadButtonPressed(
    gamepad : Int32,
    button : Int32
  ) : Bool

  fun IsGamepadButtonDown(
    gamepad : Int32,
    button : Int32
  ) : Bool

  fun IsGamepadButtonReleased(
    gamepad : Int32,
    button : Int32
  ) : Bool

  fun IsGamepadButtonUp(gamepad : Int32, button : Int32) : Bool

  fun GetGamepadButtonPressed : Int32

  fun GetGamepadAxisCount(gamepad : Int32) : Int32

  fun GetGamepadAxisMovement(
    gamepad : Int32,
    axis : Int32
  ) : Float32

  fun IsMouseButtonPressed(button : Int32) : Bool

  fun IsMouseButtonDown(button : Int32) : Bool

  fun IsMouseButtonReleased(button : Int32) : Bool

  fun IsMouseButtonUp(button : Int32) : Bool

  fun GetMouseX : Int32

  fun GetMouseY : Int32

  fun GetMousePosition : Vector2

  fun SetMousePosition(position : Vector2)

  fun SetMouseScale(scale : Float32)

  fun GetMouseWheelMove : Int32

  fun GetTouchX : Int32

  fun GetTouchY : Int32

  fun GetTouchPosition(index : Int32) : Vector2

  fun SetGesturesEnabled(gestureFlags : UInt32)

  fun IsGestureDetected(gesture : Int32) : Bool

  fun GetGestureDetected : Int32

  fun GetTouchPointsCount : Int32

  fun GetGestureHoldDuration : Float32

  fun GetGestureDragVector : Vector2

  fun GetGestureDragAngle : Float32

  fun GetGesturePinchVector : Vector2

  fun GetGesturePinchAngle : Float32

  fun SetCameraMode(camera : Camera3D, mode : Int32)

  fun UpdateCamera(camera : Camera3D*)

  fun SetCameraPanControl(panKey : Int32)

  fun SetCameraAltControl(altKey : Int32)

  fun SetCameraSmoothZoomControl(szKey : Int32)

  fun SetCameraMoveControls(
    frontKey : Int32,
    backKey : Int32,
    rightKey : Int32,
    leftKey : Int32,
    upKey : Int32,
    downKey : Int32
  )

  fun DrawPixel(posX : Int32, posY : Int32, color : Color)

  fun DrawPixelV(position : Vector2, color : Color)

  fun DrawLine(
    startPosX : Int32,
    startPosY : Int32,
    endPosX : Int32,
    endPosY : Int32,
    color : Color
  )

  fun DrawLineV(startPos : Vector2, endPos : Vector2, color : Color)

  fun DrawLineEx(startPos : Vector2, endPos : Vector2, thick : Float32, color : Color)

  fun DrawLineBezier(startPos : Vector2, endPos : Vector2, thick : Float32, color : Color)

  fun DrawCircle(
    centerX : Int32,
    centerY : Int32,
    radius : Float32,
    color : Color
  )

  fun DrawCircleGradient(
    centerX : Int32,
    centerY : Int32,
    radius : Float32,
    color1 : Color,
    color2 : Color
  )

  fun DrawCircleV(center : Vector2, radius : Float32, color : Color)

  fun DrawCircleLines(
    centerX : Int32,
    centerY : Int32,
    radius : Float32,
    color : Color
  )

  fun DrawRectangle(
    posX : Int32,
    posY : Int32,
    width : Int32,
    height : Int32,
    color : Color
  )

  fun DrawRectangleV(position : Vector2, size : Vector2, color : Color)

  fun DrawRectangleRec(rec : Rectangle, color : Color)

  fun DrawRectanglePro(rec : Rectangle, origin : Vector2, rotation : Float32, color : Color)

  fun DrawRectangleGradientV(
    posX : Int32,
    posY : Int32,
    width : Int32,
    height : Int32,
    color1 : Color,
    color2 : Color
  )

  fun DrawRectangleGradientH(
    posX : Int32,
    posY : Int32,
    width : Int32,
    height : Int32,
    color1 : Color,
    color2 : Color
  )

  fun DrawRectangleGradientEx(
    rec : Rectangle,
    col1 : Color,
    col2 : Color,
    col3 : Color,
    col4 : Color
  )

  fun DrawRectangleLines(
    posX : Int32,
    posY : Int32,
    width : Int32,
    height : Int32,
    color : Color
  )

  fun DrawRectangleLinesEx(rec : Rectangle, lineThick : Int32, color : Color)

  fun DrawTriangle(v1 : Vector2, v2 : Vector2, v3 : Vector2, color : Color)

  fun DrawTriangleLines(v1 : Vector2, v2 : Vector2, v3 : Vector2, color : Color)

  fun DrawPoly(
    center : Vector2,
    sides : Int32,
    radius : Float32,
    rotation : Float32,
    color : Color
  )

  fun DrawPolyEx(points : Vector2*, numPoints : Int32, color : Color)

  fun DrawPolyExLines(points : Vector2*, numPoints : Int32, color : Color)

  fun CheckCollisionRecs(rec1 : Rectangle, rec2 : Rectangle) : Bool

  fun CheckCollisionCircles(
    center1 : Vector2,
    radius1 : Float32,
    center2 : Vector2,
    radius2 : Float32
  ) : Bool

  fun CheckCollisionCircleRec(center : Vector2, radius : Float32, rec : Rectangle) : Bool

  fun GetCollisionRec(rec1 : Rectangle, rec2 : Rectangle) : Rectangle

  fun CheckCollisionPointRec(point : Vector2, rec : Rectangle) : Bool

  fun CheckCollisionPointCircle(point : Vector2, center : Vector2, radius : Float32) : Bool

  fun CheckCollisionPointTriangle(
    point : Vector2,
    p1 : Vector2,
    p2 : Vector2,
    p3 : Vector2
  ) : Bool

  fun LoadImage(fileName : UInt8*) : Image

  fun LoadImageEx(
    pixels : Color*,
    width : Int32,
    height : Int32
  ) : Image

  fun LoadImagePro(
    data : Void*,
    width : Int32,
    height : Int32,
    format : Int32
  ) : Image

  fun LoadImageRaw(
    fileName : UInt8*,
    width : Int32,
    height : Int32,
    format : Int32,
    headerSize : Int32
  ) : Image

  fun ExportImage(fileName : UInt8*, image : Image)

  fun LoadTexture(fileName : UInt8*) : Texture2D

  fun LoadTextureFromImage(image : Image) : Texture2D

  fun LoadRenderTexture(
    width : Int32,
    height : Int32
  ) : RenderTexture2D

  fun UnloadImage(image : Image)

  fun UnloadTexture(texture : Texture2D)

  fun UnloadRenderTexture(target : RenderTexture2D)

  fun GetImageData(image : Image) : Color*

  fun GetImageDataNormalized(image : Image) : Vector4*

  fun GetPixelDataSize(
    width : Int32,
    height : Int32,
    format : Int32
  ) : Int32

  fun GetTextureData(texture : Texture2D) : Image

  fun UpdateTexture(texture : Texture2D, pixels : Void*)

  fun ImageCopy(image : Image) : Image

  fun ImageToPOT(image : Image**, fillColor : Color)

  fun ImageFormat(image : Image**, newFormat : Int32)

  fun ImageAlphaMask(image : Image**, alphaMask : Image)

  fun ImageAlphaClear(image : Image**, color : Color, threshold : Float32)

  fun ImageAlphaCrop(image : Image**, threshold : Float32)

  fun ImageAlphaPremultiply(image : Image**)

  fun ImageCrop(image : Image**, crop : Rectangle)

  fun ImageResize(
    image : Image**,
    newWidth : Int32,
    newHeight : Int32
  )

  fun ImageResizeNN(
    image : Image**,
    newWidth : Int32,
    newHeight : Int32
  )

  fun ImageResizeCanvas(
    image : Image**,
    newWidth : Int32,
    newHeight : Int32,
    offsetX : Int32,
    offsetY : Int32,
    color : Color
  )

  fun ImageMipmaps(image : Image**)

  fun ImageDither(
    image : Image**,
    rBpp : Int32,
    gBpp : Int32,
    bBpp : Int32,
    aBpp : Int32
  )

  fun ImageText(
    text : UInt8*,
    fontSize : Int32,
    color : Color
  ) : Image

  fun ImageTextEx(
    font : Font,
    text : UInt8*,
    fontSize : Float32,
    spacing : Float32,
    tint : Color
  ) : Image

  fun ImageDraw(dst : Image**, src : Image, srcRec : Rectangle, dstRec : Rectangle)

  fun ImageDrawRectangle(dst : Image**, position : Vector2, rec : Rectangle, color : Color)

  fun ImageDrawText(
    dst : Image**,
    position : Vector2,
    text : UInt8*,
    fontSize : Int32,
    color : Color
  )

  fun ImageDrawTextEx(
    dst : Image**,
    position : Vector2,
    font : Font,
    text : UInt8*,
    fontSize : Float32,
    spacing : Float32,
    color : Color
  )

  fun ImageFlipVertical(image : Image**)

  fun ImageFlipHorizontal(image : Image**)

  fun ImageRotateCW(image : Image*)

  fun ImageRotateCCW(image : Image*)

  fun ImageColorTint(image : Image*, color : Color)

  fun ImageColorInvert(image : Image*)

  fun ImageColorGrayscale(image : Image*)

  fun ImageColorContrast(image : Image*, contrast : Float32)

  fun ImageColorBrightness(image : Image*, brightness : Int32)

  fun ImageColorReplace(image : Image*, color : Color, replace : Color)

  fun GenImageColor(
    width : Int32,
    height : Int32,
    color : Color
  ) : Image

  fun GenImageGradientV(
    width : Int32,
    height : Int32,
    top : Color,
    bottom : Color
  ) : Image

  fun GenImageGradientH(
    width : Int32,
    height : Int32,
    left : Color,
    right : Color
  ) : Image

  fun GenImageGradientRadial(
    width : Int32,
    height : Int32,
    density : Float32,
    inner : Color,
    outer : Color
  ) : Image

  fun GenImageChecked(
    width : Int32,
    height : Int32,
    checksX : Int32,
    checksY : Int32,
    col1 : Color,
    col2 : Color
  ) : Image

  fun GenImageWhiteNoise(
    width : Int32,
    height : Int32,
    factor : Float32
  ) : Image

  fun GenImagePerlinNoise(
    width : Int32,
    height : Int32,
    offsetX : Int32,
    offsetY : Int32,
    scale : Float32
  ) : Image

  fun GenImageCellular(
    width : Int32,
    height : Int32,
    tileSize : Int32
  ) : Image

  fun GenTextureMipmaps(texture : Texture2D*)

  fun SetTextureFilter(texture : Texture2D, filterMode : Int32)

  fun SetTextureWrap(texture : Texture2D, wrapMode : Int32)

  fun DrawTexture(
    texture : Texture2D,
    posX : Int32,
    posY : Int32,
    tint : Color
  )

  fun DrawTextureV(texture : Texture2D, position : Vector2, tint : Color)

  fun DrawTextureEx(
    texture : Texture2D,
    position : Vector2,
    rotation : Float32,
    scale : Float32,
    tint : Color
  )

  fun DrawTextureRec(texture : Texture2D, sourceRec : Rectangle, position : Vector2, tint : Color)

  fun DrawTexturePro(
    texture : Texture2D,
    sourceRec : Rectangle,
    destRec : Rectangle,
    origin : Vector2,
    rotation : Float32,
    tint : Color
  )

  fun GetFontDefault : Font

  fun LoadFont(fileName : UInt8*) : Font

  fun LoadFontEx(
    fileName : UInt8*,
    fontSize : Int32,
    charsCount : Int32,
    fontChars : Int32*
  ) : Font

  fun LoadFontData(
    fileName : UInt8*,
    fontSize : Int32,
    fontChars : Int32*,
    charsCount : Int32,
    sdf : Bool
  ) : CharInfo*

  fun GenImageFontAtlas(
    chars : CharInfo*,
    fontSize : Int32,
    charsCount : Int32,
    padding : Int32,
    packMethod : Int32
  ) : Image

  fun UnloadFont(font : Font)

  fun DrawFPS(posX : Int32, posY : Int32)

  fun DrawText(
    text : UInt8*,
    posX : Int32,
    posY : Int32,
    fontSize : Int32,
    color : Color
  )

  fun DrawTextEx(
    font : Font,
    text : UInt8*,
    position : Vector2,
    fontSize : Float32,
    spacing : Float32,
    tint : Color
  )

  fun MeasureText(
    text : UInt8*,
    fontSize : Int32
  ) : Int32

  fun MeasureTextEx(
    font : Font,
    text : UInt8*,
    fontSize : Float32,
    spacing : Float32
  ) : Vector2

  fun FormatText(text : UInt8*, ...) : UInt8*

  fun SubText(
    text : UInt8*,
    position : Int32,
    length : Int32
  ) : UInt8*

  fun GetGlyphIndex(font : Font, character : Int32) : Int32

  fun DrawLine3D(startPos : Vector3, endPos : Vector3, color : Color)

  fun DrawCircle3D(
    center : Vector3,
    radius : Float32,
    rotationAxis : Vector3,
    rotationAngle : Float32,
    color : Color
  )

  fun DrawCube(position : Vector3, width : Float32, height : Float32, length : Float32, color : Color)

  fun DrawCubeV(position : Vector3, size : Vector3, color : Color)

  fun DrawCubeWires(position : Vector3, width : Float32, height : Float32, length : Float32, color : Color)

  fun DrawCubeTexture(
    texture : Texture2D,
    position : Vector3,
    width : Float32,
    height : Float32,
    length : Float32,
    color : Color
  )

  fun DrawSphere(centerPos : Vector3, radius : Float32, color : Color)

  fun DrawSphereEx(
    centerPos : Vector3,
    radius : Float32,
    rings : Int32,
    slices : Int32,
    color : Color
  )

  fun DrawSphereWires(
    centerPos : Vector3,
    radius : Float32,
    rings : Int32,
    slices : Int32,
    color : Color
  )

  fun DrawCylinder(
    position : Vector3,
    radiusTop : Float32,
    radiusBottom : Float32,
    height : Float32,
    slices : Int32,
    color : Color
  )

  fun DrawCylinderWires(
    position : Vector3,
    radiusTop : Float32,
    radiusBottom : Float32,
    height : Float32,
    slices : Int32,
    color : Color
  )

  fun DrawPlane(centerPos : Vector3, size : Vector2, color : Color)

  fun DrawRay(ray : Ray, color : Color)

  fun DrawGrid(slices : Int32, spacing : Float32)

  fun DrawGizmo(position : Vector3)

  fun LoadModel(fileName : UInt8*) : Model

  fun LoadModelFromMesh(mesh : Mesh) : Model

  fun UnloadModel(model : Model)

  fun LoadMesh(fileName : UInt8*) : Mesh

  fun UnloadMesh(mesh : Mesh*)

  fun ExportMesh(fileName : UInt8*, mesh : Mesh)

  fun MeshBoundingBox(mesh : Mesh) : BoundingBox

  fun MeshTangents(mesh : Mesh*)

  fun MeshBinormals(mesh : Mesh*)

  fun GenMeshPlane(
    width : Float32,
    length : Float32,
    resX : Int32,
    resZ : Int32
  ) : Mesh

  fun GenMeshCube(width : Float32, height : Float32, length : Float32) : Mesh

  fun GenMeshSphere(
    radius : Float32,
    rings : Int32,
    slices : Int32
  ) : Mesh

  fun GenMeshHemiSphere(
    radius : Float32,
    rings : Int32,
    slices : Int32
  ) : Mesh

  fun GenMeshCylinder(radius : Float32, height : Float32, slices : Int32) : Mesh

  fun GenMeshTorus(
    radius : Float32,
    size : Float32,
    radSeg : Int32,
    sides : Int32
  ) : Mesh

  fun GenMeshKnot(
    radius : Float32,
    size : Float32,
    radSeg : Int32,
    sides : Int32
  ) : Mesh

  fun GenMeshHeightmap(heightmap : Image, size : Vector3) : Mesh

  fun GenMeshCubicmap(cubicmap : Image, cubeSize : Vector3) : Mesh

  fun LoadMaterial(fileName : UInt8*) : Material

  fun LoadMaterialDefault : Material

  fun UnloadMaterial(material : Material)

  fun DrawModel(model : Model, position : Vector3, scale : Float32, tint : Color)

  fun DrawModelEx(
    model : Model,
    position : Vector3,
    rotationAxis : Vector3,
    rotationAngle : Float32,
    scale : Vector3,
    tint : Color
  )

  fun DrawModelWires(model : Model, position : Vector3, scale : Float32, tint : Color)

  fun DrawModelWiresEx(
    model : Model,
    position : Vector3,
    rotationAxis : Vector3,
    rotationAngle : Float32,
    scale : Vector3,
    tint : Color
  )

  fun DrawBoundingBox(box_ : BoundingBox, color : Color)

  fun DrawBillboard(
    camera : Camera3D,
    texture : Texture2D,
    center : Vector3,
    size : Float32,
    tint : Color
  )

  fun DrawBillboardRec(
    camera : Camera3D,
    texture : Texture2D,
    sourceRec : Rectangle,
    center : Vector3,
    size : Float32,
    tint : Color
  )

  fun CheckCollisionSpheres(
    centerA : Vector3,
    radiusA : Float32,
    centerB : Vector3,
    radiusB : Float32
  ) : Bool

  fun CheckCollisionBoxes(box1 : BoundingBox, box2 : BoundingBox) : Bool

  fun CheckCollisionBoxSphere(
    box_ : BoundingBox,
    centerSphere : Vector3,
    radiusSphere : Float32
  ) : Bool

  fun CheckCollisionRaySphere(ray : Ray, spherePosition : Vector3, sphereRadius : Float32) : Bool

  fun CheckCollisionRaySphereEx(
    ray : Ray,
    spherePosition : Vector3,
    sphereRadius : Float32,
    collisionPoint : Vector3*
  ) : Bool

  fun CheckCollisionRayBox(ray : Ray, box_ : BoundingBox) : Bool

  fun GetCollisionRayModel(ray : Ray, model : Model*) : RayHitInfo

  fun GetCollisionRayTriangle(ray : Ray, p1 : Vector3, p2 : Vector3, p3 : Vector3) : RayHitInfo

  fun GetCollisionRayGround(ray : Ray, groundHeight : Float32) : RayHitInfo

  fun LoadText(fileName : UInt8*) : UInt8*

  fun LoadShader(
    vsFileName : UInt8*,
    fsFileName : UInt8*
  ) : Shader

  fun LoadShaderCode(
    vsCode : UInt8*,
    fsCode : UInt8*
  ) : Shader

  fun UnloadShader(shader : Shader)

  fun GetShaderDefault : Shader

  fun GetTextureDefault : Texture2D

  fun GetShaderLocation(
    shader : Shader,
    uniformName : UInt8*
  ) : Int32

  fun SetShaderValue(
    shader : Shader,
    uniformLoc : Int32,
    value : Float32*,
    size : Int32
  )

  fun SetShaderValuei(
    shader : Shader,
    uniformLoc : Int32,
    value : Int32*,
    size : Int32
  )

  fun SetShaderValueMatrix(shader : Shader, uniformLoc : Int32, mat : Matrix)

  fun SetMatrixProjection(proj : Matrix)

  fun SetMatrixModelview(view : Matrix)

  fun GetMatrixModelview : Matrix

  fun GenTextureCubemap(
    shader : Shader,
    skyHDR : Texture2D,
    size : Int32
  ) : Texture2D

  fun GenTextureIrradiance(
    shader : Shader,
    cubemap : Texture2D,
    size : Int32
  ) : Texture2D

  fun GenTexturePrefilter(
    shader : Shader,
    cubemap : Texture2D,
    size : Int32
  ) : Texture2D

  fun GenTextureBRDF(
    shader : Shader,
    cubemap : Texture2D,
    size : Int32
  ) : Texture2D

  fun BeginShaderMode(shader : Shader)

  fun EndShaderMode

  fun BeginBlendMode(mode : Int32)

  fun EndBlendMode

  fun GetVrDeviceInfo(vrDeviceType : Int32) : VrDeviceInfo

  fun InitVrSimulator(info : VrDeviceInfo)

  fun CloseVrSimulator

  fun IsVrSimulatorReady : Bool

  fun SetVrDistortionShader(shader : Shader)

  fun UpdateVrTracking(camera : Camera3D*)

  fun ToggleVrMode

  fun BeginVrDrawing

  fun EndVrDrawing

  fun InitAudioDevice

  fun CloseAudioDevice

  fun IsAudioDeviceReady : Bool

  fun SetMasterVolume(volume : Float32)

  fun LoadWave(fileName : UInt8*) : Wave

  fun LoadWaveEx(
    data : Void*,
    sampleCount : Int32,
    sampleRate : Int32,
    sampleSize : Int32,
    channels : Int32
  ) : Wave

  fun LoadSound(fileName : UInt8*) : Sound

  fun LoadSoundFromWave(wave : Wave) : Sound

  fun UpdateSound(
    sound : Sound,
    data : Void*,
    samplesCount : Int32
  )

  fun UnloadWave(wave : Wave)

  fun UnloadSound(sound : Sound)

  fun PlaySound(sound : Sound)

  fun PauseSound(sound : Sound)

  fun ResumeSound(sound : Sound)

  fun StopSound(sound : Sound)

  fun IsSoundPlaying(sound : Sound) : Bool

  fun SetSoundVolume(sound : Sound, volume : Float32)

  fun SetSoundPitch(sound : Sound, pitch : Float32)

  fun WaveFormat(
    wave : Wave*,
    sampleRate : Int32,
    sampleSize : Int32,
    channels : Int32
  )

  fun WaveCopy(wave : Wave) : Wave

  fun WaveCrop(
    wave : Wave*,
    initSample : Int32,
    finalSample : Int32
  )

  fun GetWaveData(wave : Wave) : Float32*

  fun LoadMusicStream(fileName : UInt8*) : Music

  fun UnloadMusicStream(music : Music)

  fun PlayMusicStream(music : Music)

  fun UpdateMusicStream(music : Music)

  fun StopMusicStream(music : Music)

  fun PauseMusicStream(music : Music)

  fun ResumeMusicStream(music : Music)

  fun IsMusicPlaying(music : Music) : Bool

  fun SetMusicVolume(music : Music, volume : Float32)

  fun SetMusicPitch(music : Music, pitch : Float32)

  fun SetMusicLoopCount(music : Music, count : Int32)

  fun GetMusicTimeLength(music : Music) : Float32

  fun GetMusicTimePlayed(music : Music) : Float32

  fun InitAudioStream(
    sampleRate : UInt32,
    sampleSize : UInt32,
    channels : UInt32
  ) : AudioStream

  fun UpdateAudioStream(
    stream : AudioStream,
    data : Void*,
    samplesCount : Int32
  )

  fun CloseAudioStream(stream : AudioStream)

  fun IsAudioBufferProcessed(stream : AudioStream) : Bool

  fun PlayAudioStream(stream : AudioStream)

  fun PauseAudioStream(stream : AudioStream)

  fun ResumeAudioStream(stream : AudioStream)

  fun IsAudioStreamPlaying(stream : AudioStream) : Bool

  fun StopAudioStream(stream : AudioStream)

  fun SetAudioStreamVolume(stream : AudioStream, volume : Float32)

  fun SetAudioStreamPitch(stream : AudioStream, pitch : Float32)
end
