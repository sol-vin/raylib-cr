require "./raylib"

@[Link("raylib")]
# :showdoc:
lib RLGL
  # RLGL
  TEXTURE_WRAP_S                    = 0x2802
  TEXTURE_WRAP_T                    = 0x2803
  TEXTURE_MAG_FILTER                = 0x2800
  TEXTURE_MIN_FILTER                = 0x2801
  RL_TEXTURE_MIN_FILTER             = TEXTURE_MIN_FILTER
  TEXTURE_FILTER_NEAREST            = 0x2600
  TEXTURE_FILTER_LINEAR             = 0x2601
  TEXTURE_FILTER_MIP_NEAREST        = 0x2700
  TEXTURE_FILTER_NEAREST_MIP_LINEAR = 0x2702
  TEXTURE_FILTER_LINEAR_MIP_NEAREST = 0x2701
  TEXTURE_FILTER_MIP_LINEAR         = 0x2703
  TEXTURE_FILTER_ANISOTROPIC        = 0x3000
  TEXTURE_MIPMAP_BIAS_RATIO         = 0x4000

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

  BLEND_COLOR                                      =  32773
  BLEND_DST_ALPHA                                  =  32970
  BLEND_DST_RGB                                    =  32968
  BLEND_EQUATION                                   =  32777
  BLEND_EQUATION_ALPHA                             =  34877
  BLEND_EQUATION_RGB                               =  32777
  BLEND_SRC_ALPHA                                  =  32971
  BLEND_SRC_RGB                                    =  32969
  CONSTANT_ALPHA                                   =  32771
  CONSTANT_COLOR                                   =  32769
  CULL_DISTANCE_FAR                                = 4000.0
  CULL_DISTANCE_NEAR                               =   0.05
  DEFAULT_BATCH_BUFFER_ELEMENTS                    =   8192
  DEFAULT_BATCH_BUFFERS                            =      1
  DEFAULT_BATCH_DRAWCALLS                          =    256
  DEFAULT_BATCH_MAX_TEXTURE_UNITS                  =      4
  DEFAULT_SHADER_ATTRIB_LOCATION_BONEINDICES       =      7
  DEFAULT_SHADER_ATTRIB_LOCATION_BONEWEIGHTS       =      8
  DEFAULT_SHADER_ATTRIB_LOCATION_COLOR             =      3
  DEFAULT_SHADER_ATTRIB_LOCATION_INDICES           =      6
  DEFAULT_SHADER_ATTRIB_LOCATION_INSTANCETRANSFORM =      9
  DEFAULT_SHADER_ATTRIB_LOCATION_NORMAL            =      2
  DEFAULT_SHADER_ATTRIB_LOCATION_POSITION          =      0
  DEFAULT_SHADER_ATTRIB_LOCATION_TANGENT           =      4
  DEFAULT_SHADER_ATTRIB_LOCATION_TEXCOORD          =      1
  DEFAULT_SHADER_ATTRIB_LOCATION_TEXCOORD2         =      5
  DEFAULT_SHADER_ATTRIB_NAME_BONEINDICES           = "vertexBoneIndices"
  DEFAULT_SHADER_ATTRIB_NAME_BONEWEIGHTS           = "vertexBoneWeights"
  DEFAULT_SHADER_ATTRIB_NAME_COLOR                 = "vertexColor"
  DEFAULT_SHADER_ATTRIB_NAME_INSTANCETRANSFORM     = "instanceTransform"
  DEFAULT_SHADER_ATTRIB_NAME_NORMAL                = "vertexNormal"
  DEFAULT_SHADER_ATTRIB_NAME_POSITION              = "vertexPosition"
  DEFAULT_SHADER_ATTRIB_NAME_TANGENT               = "vertexTangent"
  DEFAULT_SHADER_ATTRIB_NAME_TEXCOORD              = "vertexTexCoord"
  DEFAULT_SHADER_ATTRIB_NAME_TEXCOORD2             = "vertexTexCoord2"
  DEFAULT_SHADER_SAMPLER2D_NAME_TEXTURE0           = "texture0"
  DEFAULT_SHADER_SAMPLER2D_NAME_TEXTURE1           = "texture1"
  DEFAULT_SHADER_SAMPLER2D_NAME_TEXTURE2           = "texture2"
  DEFAULT_SHADER_UNIFORM_NAME_BONEMATRICES         = "boneMatrices"
  DEFAULT_SHADER_UNIFORM_NAME_COLOR                = "colDiffuse"
  DEFAULT_SHADER_UNIFORM_NAME_MODEL                = "matModel"
  DEFAULT_SHADER_UNIFORM_NAME_MVP                  = "mvp"
  DEFAULT_SHADER_UNIFORM_NAME_NORMAL               = "matNormal"
  DEFAULT_SHADER_UNIFORM_NAME_PROJECTION           = "matProjection"
  DEFAULT_SHADER_UNIFORM_NAME_VIEW                 = "matView"
  DRAW_FRAMEBUFFER                                 = 36009
  DST_ALPHA                                        =   772
  DST_COLOR                                        =   774
  FUNC_ADD                                         = 32774
  FUNC_REVERSE_SUBTRACT                            = 32779
  FUNC_SUBTRACT                                    = 32778
  MAX                                              = 32776
  MAX_MATRIX_STACK_SIZE                            =    32
  MAX_SHADER_LOCATIONS                             =    32
  MIN                                              = 32775
  ONE                                              =     1
  ONE_MINUS_CONSTANT_ALPHA                         = 32772
  ONE_MINUS_CONSTANT_COLOR                         = 32770
  ONE_MINUS_DST_ALPHA                              =   773
  ONE_MINUS_DST_COLOR                              =   775
  ONE_MINUS_SRC_ALPHA                              =   771
  ONE_MINUS_SRC_COLOR                              =   769
  READ_FRAMEBUFFER                                 = 36008
  SRC_ALPHA                                        =   770
  SRC_ALPHA_SATURATE                               =   776
  SRC_COLOR                                        =   768
  VERSION                                          = "6.0"
  ZERO                                             = 0

  enum RLGLVersion
    SOFTWARE     = 0
    OPENGL_11
    OPENGL_21
    OPENGL_33
    OPENGL_43
    OPENGL_ES_20
    OPENGL_ES_30
  end

  enum TraceLogLevel
    All     = 0
    Trace
    Debug
    Info
    Warning
    Error
    Fatal
    None
  end

  enum PixelFormat
    UncompressedGrayscale    = 1
    UncompressedGrayAlpha
    UncompressedR5G6B5
    UncompressedR8G8B8
    UncompressedR5G5B5A1
    UncompressedR4G4B4A4
    UncompressedR8G8B8A8
    UncompressedR32
    UncompressedR32G32B32
    UncompressedR32G32B32A32
    UncompressedR16
    UncompressedR16G16B16
    UncompressedR16G16B16A16
    CompressedDxt1Rgb
    CompressedDxt1Rgba
    CompressedDxt3Rgba
    CompressedDxt5Rgba
    CompressedEtc1Rgb
    CompressedEtc2Rgb
    CompressedEtc2EacRgba
    CompressedPvrtRgb
    CompressedPvrtRgba
    CompressedAstc4x4Rgba
    CompressedAstc8x8Rgba
  end

  enum TextureFilter
    Point          = 0
    Bilinear
    Trilinear
    Anisotropic4x
    Anisotropic8x
    Anisotropic16x
  end

  enum BlendMode
    Alpha            = 0
    Additive
    Multiplied
    AddColors
    SubtractColors
    AlphaPremultiply
    Custom
    CustomSeparate
  end

  enum ShaderLocationIndex
    VertexPosition   = 0
    VertexTexcoord01
    VertexTexcoord02
    VertexNormal
    VertexTangent
    VertexColor
    MatrixMvp
    MatrixView
    MatrixProjection
    MatrixModel
    MatrixNormal
    VectorView
    ColorDiffuse
    ColorSpecular
    ColorAmbient
    MapAlbedo
    MapMetalness
    MapNormal
    MapRoughness
    MapOcclusion
    MapEmission
    MapHeight
    MapCubemap
    MapIrradiance
    MapPrefilter
    MapBrdf
  end

  SHADER_LOC_MAP_DIFFUSE  = ShaderLocationIndex::MapAlbedo
  SHADER_LOC_MAP_SPECULAR = ShaderLocationIndex::MapMetalness

  enum ShaderUniformDataType
    Float     = 0
    Vec2
    Vec3
    Vec4
    Int
    IVec2
    IVec3
    IVec4
    UInt
    UIVec2
    UIVec3
    UIVec4
    Sampler2D
  end

  enum ShaderAttributeDataType
    Float = 0
    Vec2
    Vec3
    Vec4
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

  enum CullMode
    Front = 0
    Back
  end

  struct VertexBuffer
    element_count : LibC::Int

    vertices : LibC::Float*
    tex_coords : LibC::Float*
    normals : LibC::Float*
    colors : LibC::UChar*
    indices : LibC::UInt*
    vao_id : LibC::UInt
    vbo_id : StaticArray(LibC::UInt, 5)
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
    vertex_buffer : VertexBuffer*
    draws : DrawCall*
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
  fun mult_matrix_f = rlMultMatrixf(matf : LibC::Float*)
  fun multi_matrix_f = rlMultMatrixf(matf : LibC::Float*)
  fun frustum = rlFrustum(left : LibC::Double, right : LibC::Double, bottom : LibC::Double, top : LibC::Double, znear : LibC::Double, zfar : LibC::Double)
  fun frustrum = rlFrustum(left : LibC::Double, right : LibC::Double, bottom : LibC::Double, top : LibC::Double, znear : LibC::Double, zfar : LibC::Double)
  fun ortho = rlOrtho(left : LibC::Double, right : LibC::Double, bottom : LibC::Double, top : LibC::Double, znear : LibC::Double, zfar : LibC::Double)
  fun viewport = rlViewport(x : LibC::Int, y : LibC::Int, width : LibC::Int, height : LibC::Int)
  fun set_clip_planes = rlSetClipPlanes(near_plane : LibC::Double, far_plane : LibC::Double)
  fun get_cull_distance_near = rlGetCullDistanceNear : LibC::Double
  fun get_cull_distance_far = rlGetCullDistanceFar : LibC::Double

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
  fun enable_vertex_buffer_attribute = rlEnableVertexAttribute(index : LibC::UInt)
  fun disable_vertex_buffer_attribute = rlDisableVertexAttribute(index : LibC::UInt)
  fun enable_state_pointer = rlEnableStatePointer(vertex_attrib_type : LibC::Int, buffer : Void*)
  fun disable_state_pointer = rlDisableStatePointer(vertex_attrib_type : LibC::Int)

  fun active_texture_slot = rlActiveTextureSlot(slot : LibC::Int)
  fun enable_texture = rlEnableTexture(id : LibC::UInt)
  fun disable_texture = rlDisableTexture
  fun enable_texture_cubemap = rlEnableTextureCubemap(id : LibC::UInt)
  fun disable_texture_cubemap = rlDisableTextureCubemap
  fun texture_parameters = rlTextureParameters(id : LibC::UInt, param : LibC::Int, value : LibC::Int)
  fun cubemap_parameters = rlCubemapParameters(id : LibC::UInt, param : LibC::Int, value : LibC::Int)

  fun enable_shader = rlEnableShader(id : LibC::UInt)
  fun disable_shader = rlDisableShader

  fun enable_frame_buffer = rlEnableFramebuffer(id : LibC::UInt)
  fun disable_frame_buffer = rlDisableFramebuffer
  fun get_active_framebuffer = rlGetActiveFramebuffer : LibC::UInt
  fun active_draw_buffers = rlActiveDrawBuffers(count : LibC::Int)
  fun bind_framebuffer = rlBindFramebuffer(target : LibC::UInt, framebuffer : LibC::UInt)
  fun enable_color_blend = rlEnableColorBlend
  fun disable_color_blend = rlDisableColorBlend
  fun enable_depth_test = rlEnableDepthTest
  fun disable_depth_test = rlDisableDepthTest

  fun enable_depth_mask = rlEnableDepthMask
  fun disable_depth_mask = rlDisableDepthMask

  fun enable_backface_culling = rlEnableBackfaceCulling
  fun disable_backface_culling = rlDisableBackfaceCulling
  fun color_mask = rlColorMask(r : Bool, g : Bool, b : Bool, a : Bool)
  fun set_cull_face = rlSetCullFace(mode : LibC::Int)

  fun enable_scissor_test = rlEnableScissorTest
  fun disable_scissor_test = rlDisableScissorTest

  fun scissor = rlScissor(x : LibC::Int, y : LibC::Int, w : LibC::Int, h : LibC::Int)
  fun enable_wire_mode = rlEnableWireMode
  fun enable_point_mode = rlEnablePointMode
  fun disable_point_mode = rlDisablePointMode
  fun disable_wire_mode = rlDisableWireMode
  fun set_point_size = rlSetPointSize(size : LibC::Float)
  fun get_point_size = rlGetPointSize : LibC::Float
  fun set_line_width = rlSetLineWidth(width : LibC::Float)
  fun get_line_width = rlGetLineWidth : LibC::Float
  fun enable_smooth_lines = rlEnableSmoothLines
  fun disable_smooth_lines = rlDisableSmoothLines
  fun enable_stereo_render = rlEnableStereoRender
  fun disable_stereo_render = rlDisableStereoRender
  fun stereo_render_enabled? = rlIsStereoRenderEnabled : Bool
  fun clear_color = rlClearColor(r : LibC::UChar, g : LibC::UChar, b : LibC::UChar, a : LibC::UChar)
  fun clear_screen_buffers = rlClearScreenBuffers
  fun clean_screen_buffers = rlClearScreenBuffers
  fun clear_errors = rlCheckErrors
  fun set_blend_mode = rlSetBlendMode(mode : LibC::Int)
  fun set_blend_factors = rlSetBlendFactors(gl_src_factor : LibC::Int, gl_dst_factor : LibC::Int, gl_equation : LibC::Int)
  fun set_blend_factors_separate = rlSetBlendFactorsSeparate(gl_src_rgb : LibC::Int, gl_dst_rgb : LibC::Int, gl_src_alpha : LibC::Int, gl_dst_alpha : LibC::Int, gl_equation_rgb : LibC::Int, gl_equation_alpha : LibC::Int)

  fun init = rlglInit(width : LibC::Int, height : LibC::Int)
  fun close = rlglClose
  fun load_extensions = rlLoadExtensions(loader : Void*)
  fun get_proc_address = rlGetProcAddress(proc_name : LibC::Char*) : Void*
  fun get_version = rlGetVersion : LibC::Int
  fun get_framebuffer_width = rlGetFramebufferWidth : LibC::Int
  fun get_framebuffer_height = rlGetFramebufferHeight : LibC::Int
  fun set_framebuffer_width = rlSetFramebufferWidth(width : LibC::Int)
  fun set_framebuffer_height = rlSetFramebufferHeight(height : LibC::Int)
  fun get_texture_id_default = rlGetTextureIdDefault : LibC::UInt
  fun get_shader_id_default = rlGetShaderIdDefault : LibC::UInt
  fun get_shader_locs_default = rlGetShaderLocsDefault : LibC::Int*

  fun load_render_batch = rlLoadRenderBatch(num_buffers : LibC::Int, buffer_elements : LibC::Int) : RenderBatch
  fun unload_render_batch = rlUnloadRenderBatch(batch : RLGL::RenderBatch)
  fun draw_render_batch = rlDrawRenderBatch(batch : RLGL::RenderBatch*)
  fun set_render_batch_active = rlSetRenderBatchActive(batch : RLGL::RenderBatch*)
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
  fun set_vertex_attribute = rlSetVertexAttribute(index : LibC::UInt, comp_size : LibC::Int, type : LibC::Int, normalized : Bool, stride : LibC::Int, offset : LibC::Int)
  fun set_vertex_attribute_divisor = rlSetVertexAttributeDivisor(index : LibC::UInt, divisor : LibC::Int)
  fun set_vertex_attribute_default = rlSetVertexAttributeDefault(loc_index : LibC::Int, value : Void*, attrib_type : LibC::Int, count : LibC::Int)
  fun draw_vertex_array = rlDrawVertexArray(offset : LibC::Int, count : LibC::Int)
  fun draw_vertex_array_elements = rlDrawVertexArrayElements(offset : LibC::Int, count : LibC::Int, buffer : Void*)
  fun draw_vertex_array_instanced = rlDrawVertexArrayInstanced(offset : LibC::Int, count : LibC::Int, instances : LibC::Int)
  fun draw_vertex_array_elements_instanced = rlDrawVertexArrayElementsInstanced(offset : LibC::Int, count : LibC::Int, buffer : Void*, instances : LibC::Int)

  fun load_texture = rlLoadTexture(data : Void*, width : LibC::Int, height : LibC::Int, format : LibC::Int, mimmap_count : LibC::Int) : LibC::UInt
  fun load_texture_depth = rlLoadTextureDepth(width : LibC::Int, height : LibC::Int, use_render_buffer : Bool) : LibC::UInt
  fun load_texture_cubemap = rlLoadTextureCubemap(data : Void*, size : LibC::Int, format : LibC::Int, mipmap_count : LibC::Int) : LibC::UInt
  fun update_texture = rlUpdateTexture(id : LibC::UInt, offset_x : LibC::Int, offset_y : LibC::Int, width : LibC::Int, height : LibC::Int, format : LibC::Int, data : Void*)
  fun get_gl_texture_formats = rlGetGlTextureFormats(format : LibC::Int, gl_internal_format : LibC::UInt*, gl_format : LibC::UInt*, gl_type : LibC::UInt*)
  fun get_pixel_format_name = rlGetPixelFormatName(format : LibC::UInt) : LibC::Char*
  fun unload_texture_rlgl = rlUnloadTexture(id : LibC::UInt)
  fun gen_texture_mipmaps = rlGenTextureMipmaps(id : LibC::UInt, width : LibC::Int, height : LibC::Int, format : LibC::Int, mipmaps : LibC::Int*)
  fun read_texture_pixels = rlReadTexturePixels(id : LibC::UInt, width : LibC::Int, height : LibC::Int, format : LibC::Int) : Void*
  fun read_screen_pixels = rlReadScreenPixels(width : LibC::Int, height : LibC::Int) : LibC::UChar*
  fun copy_framebuffer = rlCopyFramebuffer(x : LibC::Int, y : LibC::Int, width : LibC::Int, height : LibC::Int, format : LibC::Int, pixels : Void*)
  fun resize_framebuffer = rlResizeFramebuffer(width : LibC::Int, height : LibC::Int)
  fun load_framebuffer = rlLoadFramebuffer : LibC::UInt
  fun framebuffer_attach = rlFramebufferAttach(fbo_id : LibC::UInt, tex_id : LibC::UInt, attach_type : LibC::Int, text_type : LibC::Int, mip_level : LibC::Int)
  fun framebuffer_complete = rlFramebufferComplete(id : LibC::UInt) : Bool
  fun unload_framebuffer = rlUnloadFramebuffer(id : LibC::UInt)

  fun load_shader = rlLoadShader(code : LibC::Char*, type : LibC::Int) : LibC::UInt
  fun load_shader_program = rlLoadShaderProgram(vs_code : LibC::Char*, fs_code : LibC::Char*) : LibC::UInt
  fun load_shader_program_ex = rlLoadShaderProgramEx(vs_id : LibC::UInt, fs_id : LibC::UInt) : LibC::UInt
  fun unload_shader = rlUnloadShader(id : LibC::UInt)
  fun unload_shader_program = rlUnloadShaderProgram(id : LibC::UInt)
  fun get_location_uniform = rlGetLocationUniform(shader_id : LibC::UInt, uniform_name : LibC::Char*) : LibC::Int
  fun get_location_attrib = rlGetLocationAttrib(shader_id : LibC::UInt, attrib_name : LibC::Char*) : LibC::Int
  fun set_uniform = rlSetUniform(loc_index : LibC::Int, value : Void*, uniform_type : LibC::Int, count : LibC::Int)
  fun set_uniform_matrix = rlSetUniformMatrix(loc_index : LibC::Int, mat : Raylib::Matrix)
  fun set_uniform_matrices = rlSetUniformMatrices(loc_index : LibC::Int, mat : Raylib::Matrix*, count : LibC::Int)
  fun set_uniform_sampler = rlSetUniformSampler(loc_index : LibC::Int, texture_id : LibC::UInt)
  fun set_shader = rlSetShader(id : LibC::UInt, locs : LibC::Int*)

  fun load_shader_program_compute = rlLoadShaderProgramCompute(cs_id : LibC::UInt) : LibC::UInt
  fun compute_shader_dispatch = rlComputeShaderDispatch(group_x : LibC::UInt, group_y : LibC::UInt, group_z : LibC::UInt)

  fun load_shader_buffer = rlLoadShaderBuffer(size : LibC::UInt, data : Void*, usage_hint : LibC::Int) : LibC::UInt
  fun unload_shader_buffer = rlUnloadShaderBuffer(ssbo_id : LibC::UInt)
  fun update_shader_buffer = rlUpdateShaderBuffer(id : LibC::UInt, data : Void*, data_size : LibC::UInt, offset : LibC::UInt)
  fun get_shader_buffer_size = rlGetShaderBufferSize(id : LibC::UInt) : LibC::UInt
  fun read_shader_buffer = rlReadShaderBuffer(id : LibC::UInt, dest : Void*, count : LibC::UInt, offset : LibC::UInt)
  fun bind_shader_buffer = rlBindShaderBuffer(id : LibC::UInt, index : LibC::UInt)
  fun copy_shader_buffer = rlCopyShaderBuffer(dst_id : LibC::UInt, src_id : LibC::UInt, dst_offset : LibC::UInt, src_offset : LibC::UInt, count : LibC::UInt)

  fun bind_image_texture = rlBindImageTexture(id : LibC::UInt, index : LibC::UInt, format : LibC::Int, readonly : Bool)

  fun get_matrix_modelview = rlGetMatrixModelview : Raylib::Matrix
  fun get_matrix_projection = rlGetMatrixProjection : Raylib::Matrix
  fun get_matrix_transform = rlGetMatrixTransform : Raylib::Matrix
  fun get_matrix_projection_stereo = rlGetMatrixProjectionStereo(eye : LibC::Int) : Raylib::Matrix
  fun get_matrix_view_offset_stereo = rlGetMatrixViewOffsetStereo(eye : LibC::Int) : Raylib::Matrix
  fun set_matrix_projection = rlSetMatrixProjection(proj : Raylib::Matrix)
  fun set_matrix_modelview = rlSetMatrixModelview(view : Raylib::Matrix)
  fun set_matrix_projection_stereo = rlSetMatrixProjectionStereo(right : Raylib::Matrix, left : Raylib::Matrix)
  fun set_matrix_view_offset_stereo = rlSetMatrixViewOffsetStereo(right : Raylib::Matrix, left : Raylib::Matrix)

  fun load_draw_cube = rlLoadDrawCube
  fun load_draw_quad = rlLoadDrawQuad

  fun blit_framebuffer = rlBlitFramebuffer(src_x : LibC::Int, src_y : LibC::Int, src_width : LibC::Int, src_height : LibC::Int, dst_x : LibC::Int, dst_y : LibC::Int, dst_width : LibC::Int, dst_height : LibC::Int, buffer_mask : LibC::Int)
end
