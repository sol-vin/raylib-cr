{% if flag?(:linux) && flag?(:x86_64) %}
    @[Link(ldflags: "-L#{__DIR__}/native/linux -lraylib -lglfw3 -lX11 -lm")]
{% elsif flag?(:darwin) && flag?(:x86_64) %}
    @[Link(ldflags: "-L#{__DIR__}/native/darwin -lraylib")]
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

  type LogType = UInt32
  type ShaderLocationIndex = UInt32
  type TexmapIndex = UInt32
  type PixelFormat = UInt32
  type TextureFilterMode = UInt32
  type TextureWrapMode = UInt32
  type BlendMode = UInt32
  type Gestures = UInt32
  type CameraMode = UInt32
  type CameraType = UInt32
  type VrDeviceType = UInt32
  type Texture = Texture2D
  type Quaternion = Vector4
  type Music = MusicData*

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
end
