@[Link("raylib")]
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
  
  enum ShaderUniformDataType
    Float     = 0
    Vec2      = 1
    Vec3      = 2
    Vec4      = 3
    Int       = 4
    IVec2     = 5
    IVec3     = 6
    IVec4     = 7
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
  fun draw_render_batch_active = rlDrawRenderBatchActive(v_count : LibC::Int) : Bool
  fun set_texture = rlSetTexture(id : LibC::UInt)

  fun load_vertex_array = rlLoadVertexArray : LibC::UInt
  fun load_vertex_buffer = rlLoadVertexBuffer(buffer : Void*, size : LibC::Int, dynamic : Bool) : LibC::UInt
  fun load_vertex_buffer_element = rlLoadVertexBufferElement(buffer : Void*, size : LibC::Int, dynamic : Bool) : LibC::UInt
  fun update_vertex_buffer = rlLoadVertexBuffer(buffer_id : LibC::UInt, data : Void*, data_size : LibC::Int, offset : LibC::Int) 
  fun update_vertex_buffer_elements = rlLoadVertexBufferElements(id : LibC::UInt, data : Void*, data_size : LibC::Int, offset : LibC::Int)
  fun unload_vertex_array = rlUnloadVertexArray(vao_id : LibC::UInt) 
  fun unload_vertex_buffer = rlUnloadVertexBuffer(vbo_id : LibC::UInt) 
  fun set_vertex_attribute = rlSetVertexAttribute(index : LibC::UInt, comp_size : LibC::Int, type : LibC::Int, normalized : Bool, stride : LibC::Int, pointer : Void*)
  fun set_vertex_attribute_divisor = rlSetVertexAttributeDivisor(index : LibC::UInt, divisor : LibC::Int)
  fun set_vertex_attribute_default = rlSetVertexAttributeDefault(loc_index : LibC::Int, value : Void*, attrib_type : LibC::Int, count : LibC::Int)
  fun draw_vertex_array = rlDrawVertexArray(offset : LibC::Int, count : LibC::Int) 
  fun draw_vertex_array_elements = rlDrawVertexArrayElements(offset : LibC::Int, count : LibC::Int, buffer : Void*) 
  fun draw_vertex_array_instanced = rlDrawVertexArrayInstanced(offset : LibC::Int, count : LibC::Int, buffer : Void*, instances : LibC::Int) 
  fun draw_vertex_array_elements_instanced = rlDrawVertexArrayElementsInstanced(offset : LibC::Int, count : LibC::Int, buffer : Void*, instances : LibC::Int) 
  
  fun load_texture = rlLoadTexture(data : Void*, width : LibC::Int, height : LibC::Int, format : LibC::Int, mimmap_count : LibC::Int) : LibC::UInt
  fun load_texture_depth = rlLoadTextureDepth(width : LibC::Int, height : LibC::Int, use_render_buffer : Bool) : LibC::UInt
  fun load_texture_cubemap = rlLoadTextureCubemap(data : Void*, size : LibC::Int, format : LibC::Int) : LibC::UInt
  fun update_texture = rlUpdateTexture(id : LibC::UInt, offset_x : LibC::Int, offset_y : LibC::Int, width : LibC::Int, height : LibC::Int, format : LibC::Int, data : Void*)
  fun get_gl_texture_formats = rlGetGlTextureFormats(format : LibC::Int, gl_internal_format : LibC::Int*, gl_format : LibC::Int*, gl_type : LibC::Int*)
  fun get_pixel_format_name = rlGetPixelFormatName(format : LibC::UInt) : LibC::Char*
  fun unload_texture = rlUnloadTexture(id : LibC::UInt)
  fun gen_texture_mipmaps = rlGenTextureMipmaps(id : LibC::UInt, width : LibC::Int, height : LibC::Int, format : LibC::Int, mipmaps : LibC::Int*)
  fun read_texture_pixels = rlReadTexturePixels(id : LibC::UInt, width : LibC::Int, height : LibC::Int, format : LibC::Int) : Void*
  fun read_screen_pixels = rlReadScreenPixels(width : LibC::Int, height : LibC::Int) : LibC::UChar*
  fun load_framebuffer = rlLoadFramebuffer(width : LibC::Int, height : LibC::Int) : LibC::UInt
  fun framebuffer_attach = rlFramebufferAttach(fbo_id : LibC::UInt, tex_id : LibC::UInt, attach_type : LibC::Int, text_type : LibC::Int, mip_level : LibC::Int)
  fun framebuffer_complete = rlFramebufferComplete(id : LibC::UInt) : Bool
  fun unload_framebuffer = rlUnloadFramebuffer(id : LibC::UInt)
  
  fun load_shader_code = rlLoadShaderCode(vscode : LibC::Char*, fscode : LibC::Char*) : LibC::UInt
  fun compile_shader = rlLoadShaderCode(shader_code : LibC::Char*, type : LibC::Int) : LibC::UInt
  fun load_shader_program = rlLoadShaderProgram(v_shader_id : LibC::UInt, f_shader_id : LibC::UInt)  : LibC::UInt
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
  fun get_shader_buffer_size = rlUpdateShaderBufferElements(id : LibC::UInt) : LibC::ULongLong
  fun read_shader_buffer_elements = rlReadShaderBufferElements(id : LibC::UInt, dest : Void*, count : LibC::ULongLong, offset : LibC::ULongLong)
  fun bind_shader_buffer = rlBindShaderBuffer(id : LibC::UInt, index : LibC::UInt)
  
  fun copy_buffers_elements = rlCopyBuffersElements(dest_id : LibC::UInt, src_id : LibC::UInt, dest_offset : LibC::ULongLong,  src_offset : LibC::ULongLong,  count : LibC::ULongLong)
  fun bind_image_texture = rlBindImageTexture(id : LibC::UInt, index : LibC::UInt, format : LibC::UInt, readonly : LibC::Int)
  
  fun get_matrix_modelview = rlGetMatrixModelview() : Matrix
  fun get_matrix_projection = rlGetMatrixProjection() : Matrix
  fun get_matrix_transform = rlGetMatrixTransform() : Matrix
  fun get_matrix_projection_stereo = rlGetMatrixProjectionStereo(eye : LibC::Int) : Matrix
  fun get_matrix_view_offset_stereo = rlGetMatrixViewOffsetStereo(eye : LibC::Int) : Matrix
  fun set_matrix_projection = rlSetMatrixProjection(proj : Matrix)
  fun set_matrix_modelview = rlSetMatrixModelview(view : Matrix)
  fun set_matrix_projection_stereo = rlSetMatrixProjectionStereo(right : Matrix, left : Matrix) : Matrix
  fun set_matrix_view_offset_stereo = rlSetMatrixViewOffsetStereo(right : Matrix, left : Matrix) : Matrix

  fun load_draw_cube = rlLoadDrawCube
  fun load_draw_quad = rlLoadDrawCube
end
