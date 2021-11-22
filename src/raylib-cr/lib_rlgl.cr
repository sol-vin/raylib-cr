@[Link("rlgl")]
lib LibRLGL
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

  enum TraceLogLevel
    All     = 0
    Trace   = 1
    Debug   = 2
    Info    = 3
    Warning = 4
    Error   = 5
    Fatal   = 6
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

  enum BlendMode
    Alpha          = 0
    Additive       = 1
    Multiplied     = 2
    AddColors      = 3
    SubtractColors = 4
    Custom         = 5
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

  # TODO: https://github.com/raysan5/raylib/blob/master/src/rlgl.h#L469
  
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

  fun matrix_mode = rlMatrixMode(mode : LibC::Int)
  fun push_matrix = rlPushMatrix()
  fun pop_matrix = rlPopMatrix()
  fun load_identity = rlLoadIdentity()
  fun translate_f = rlTranslatef
  fun rotate_f = rlRotatef(angle : LibC::Float, x : LibC::Float, y : LibC::Float, z : LibC::Float)
  fun scale_f = rlScalef(x : LibC::Float, y : LibC::Float, z : LibC::Float)
  fun multi_matrix_f = rlMultMatrixf()
  fun frustrum = rlFrustum(left : LibC::Double, right : LibC::Double, bottom : LibC::Double, top : LibC::Double, znear : LibC::Double, zfar : LibC::Double)
  fun ortho = rlOrtho(left : LibC::Double, right : LibC::Double, bottom : LibC::Double, top : LibC::Double, znear : LibC::Double, zfar : LibC::Double)
  fun viewport = rlViewport(x : LibC::Int, y : LibC::Int, width : LibC::Int, height : LibC::Int)

  fun begin = rlBegin(mode : LibC::Int)
  fun end = rlEnd()
    
end
