@[Link("raygui")]
lib Raygui
  VERSION = "4.0"

  SCROLLBAR_LEFT_SIDE  = 0
  SCROLLBAR_RIGHT_SIDE = 1

  enum State
    Normal   = 0
    Focused
    Pressed
    Disabled
  end

  enum TextAlignment
    Left   = 0
    Center
    Right
  end

  enum TextAlignmentVertical
    Top    = 0
    Middle
    Bottom
  end

  enum TextWrapMode
    None = 0
    Char
    Word
  end

  enum Control
    Default = 0

    Label
    Button
    Toggle
    Slider
    ProgressBar
    CheckBox
    ComboBox
    DropdownBox
    TextBox
    ValueBox
    Spinner
    ListView
    ColorPicker
    ScrollBar
    StatusBar
  end

  enum ControlProperty
    BorderColorNormal   = 0
    BaseColorNormal
    TextColorNormal

    BorderColorFocused
    BaseColorFocused
    TextColorFocused

    BorderColorPressed
    BaseColorPressed
    TextColorPressed

    BorderColorDisabled
    BaseColorDisabled
    TextColorDisabled

    BorderWidth
    TextPadding
    TextAlignment
  end

  enum DefaultProperty
    TextSize              = 16
    TextSpacing
    LineColor
    BackgroundColor
    TextLineSpacing
    TextAlignmentVertical
    TextWrapMode
  end

  enum ToggleProperty
    Padding = 16
  end

  enum SliderProperty
    Width   = 16
    Padding
  end

  enum ProgressBarProperty
    Padding = 16
  end

  enum ScrollBarProperty
    ArrowsSize    = 16
    ArrowsVisible
    SliderPadding
    SliderSize
    Padding
    Speed
  end

  enum CheckBoxProperty
    Padding = 16
  end

  enum ComboBoxProperty
    ButtonWidth   = 16
    ButtonSpacing
  end

  enum DropdownBoxProperty
    ArrowPadding = 16
    ItemsSpacing
  end

  enum TextBoxProperty
    ReadOnly = 16
  end

  enum SpinnerProperty
    ButtonWidth   = 16
    ButtonSpacing
  end

  enum ListViewProperty
    ItemsHeight    = 16
    ItemsSpacing
    ScrollBarWidth
    ScrollBarSide
  end

  enum ColorPickerProperty
    SelectorSize           = 16
    HueBarWidth
    HueBarPadding
    HueBarSelectorHeight
    HueBarSelectorOverflow
  end

  enum IconName
    None                 =   0
    FolderFileOpen       =   1
    FileSaveClassic      =   2
    FolderOpen           =   3
    FolderSave           =   4
    FileOpen             =   5
    FileSave             =   6
    FileExport           =   7
    FileAdd              =   8
    FileDelete           =   9
    FiletypeText         =  10
    FiletypeAudio        =  11
    FiletypeImage        =  12
    FiletypePlay         =  13
    FiletypeVideo        =  14
    FiletypeInfo         =  15
    FileCopy             =  16
    FileCut              =  17
    FilePaste            =  18
    CursorHand           =  19
    CursorPointer        =  20
    CursorClassic        =  21
    Pencil               =  22
    PencilBig            =  23
    BrushClassic         =  24
    BrushPainter         =  25
    WaterDrop            =  26
    ColorPicker          =  27
    Rubber               =  28
    ColorBucket          =  29
    TextT                =  30
    TextA                =  31
    Scale                =  32
    Resize               =  33
    FilterPoint          =  34
    FilterBilinear       =  35
    Crop                 =  36
    CropAlpha            =  37
    SquareToggle         =  38
    Symmetry             =  39
    SymmetryHorizontal   =  40
    SymmetryVertical     =  41
    Lens                 =  42
    LensBig              =  43
    EyeOn                =  44
    EyeOff               =  45
    FilterTop            =  46
    Filter               =  47
    TargetPoint          =  48
    TargetSmall          =  49
    TargetBig            =  50
    TargetMove           =  51
    CursorMove           =  52
    CursorScale          =  53
    CursorScaleRight     =  54
    CursorScaleLeft      =  55
    Undo                 =  56
    Redo                 =  57
    Reredo               =  58
    Mutate               =  59
    Rotate               =  60
    Repeat               =  61
    Shuffle              =  62
    Emptybox             =  63
    Target               =  64
    TargetSmallFill      =  65
    TargetBigFill        =  66
    TargetMoveFill       =  67
    CursorMoveFill       =  68
    CursorScaleFill      =  69
    CursorScaleRightFill =  70
    CursorScaleLeftFill  =  71
    UndoFill             =  72
    RedoFill             =  73
    ReredoFill           =  74
    MutateFill           =  75
    RotateFill           =  76
    RepeatFill           =  77
    ShuffleFill          =  78
    EmptyboxSmall        =  79
    Box                  =  80
    BoxTop               =  81
    BoxTopRight          =  82
    BoxRight             =  83
    BoxBottomRight       =  84
    BoxBottom            =  85
    BoxBottomLeft        =  86
    BoxLeft              =  87
    BoxTopLeft           =  88
    BoxCenter            =  89
    BoxCircleMask        =  90
    Pot                  =  91
    AlphaMultiply        =  92
    AlphaClear           =  93
    Dithering            =  94
    Mipmaps              =  95
    BoxGrid              =  96
    Grid                 =  97
    BoxCornersSmall      =  98
    BoxCornersBig        =  99
    FourBoxes            = 100
    GridFill             = 101
    BoxMultisize         = 102
    ZoomSmall            = 103
    ZoomMedium           = 104
    ZoomBig              = 105
    ZoomAll              = 106
    ZoomCenter           = 107
    BoxDotsSmall         = 108
    BoxDotsBig           = 109
    BoxConcentric        = 110
    BoxGridBig           = 111
    OkTick               = 112
    Cross                = 113
    ArrowLeft            = 114
    ArrowRight           = 115
    ArrowDown            = 116
    ArrowUp              = 117
    ArrowLeftFill        = 118
    ArrowRightFill       = 119
    ArrowDownFill        = 120
    ArrowUpFill          = 121
    Audio                = 122
    Fx                   = 123
    Wave                 = 124
    WaveSinus            = 125
    WaveSquare           = 126
    WaveTriangular       = 127
    CrossSmall           = 128
    PlayerPrevious       = 129
    PlayerPlayBack       = 130
    PlayerPlay           = 131
    PlayerPause          = 132
    PlayerStop           = 133
    PlayerNext           = 134
    PlayerRecord         = 135
    Magnet               = 136
    LockClose            = 137
    LockOpen             = 138
    Clock                = 139
    Tools                = 140
    Gear                 = 141
    GearBig              = 142
    Bin                  = 143
    HandPointer          = 144
    Laser                = 145
    Coin                 = 146
    Explosion            = 147
    OneUp                = 148
    Player               = 149
    PlayerJump           = 150
    Key                  = 151
    Demon                = 152
    TextPopup            = 153
    GearEx               = 154
    Crack                = 155
    CrackPoints          = 156
    Star                 = 157
    Door                 = 158
    Exit                 = 159
    Mode2D               = 160
    Mode3D               = 161
    Cube                 = 162
    CubeFaceTop          = 163
    CubeFaceLeft         = 164
    CubeFaceFront        = 165
    CubeFaceBottom       = 166
    CubeFaceRight        = 167
    CubeFaceBack         = 168
    Camera               = 169
    Special              = 170
    LinkNet              = 171
    LinkBoxes            = 172
    LinkMulti            = 173
    Link                 = 174
    LinkBroke            = 175
    TextNotes            = 176
    Notebook             = 177
    Suitcase             = 178
    SuitcaseZip          = 179
    Mailbox              = 180
    Monitor              = 181
    Printer              = 182
    PhotoCamera          = 183
    PhotoCameraFlash     = 184
    House                = 185
    Heart                = 186
    Corner               = 187
    VerticalBars         = 188
    VerticalBarsFill     = 189
    LifeBars             = 190
    Info                 = 191
    Crossline            = 192
    Help                 = 193
    FiletypeAlpha        = 194
    FiletypeHome         = 195
    LayersVisible        = 196
    Layers               = 197
    Window               = 198
    Hidpi                = 199
    FiletypeBinary       = 200
    Hex                  = 201
    Shield               = 202
    FileNew              = 293
    FolderAdd            = 204
    Alarm                = 205
    Cpu                  = 206
    Rom                  = 207
    StepOver             = 208
    StepInto             = 209
    StepOut              = 210
    Restart              = 211
    BreakpointOn         = 212
    BreakpointOff        = 213
    BurgerMenu           = 214
    CaseSensitive        = 215
    RegExp               = 216
    Folder               = 217
    File                 = 218
    SandTimer            = 219
    Icon_220             = 220
    Icon_221             = 221
    Icon_222             = 222
    Icon_223             = 223
    Icon_224             = 224
    Icon_225             = 225
    Icon_226             = 226
    Icon_227             = 227
    Icon_228             = 228
    Icon_229             = 229
    Icon_230             = 230
    Icon_231             = 231
    Icon_232             = 232
    Icon_233             = 233
    Icon_234             = 234
    Icon_235             = 235
    Icon_236             = 236
    Icon_237             = 237
    Icon_238             = 238
    Icon_239             = 239
    Icon_240             = 240
    Icon_241             = 241
    Icon_242             = 242
    Icon_243             = 243
    Icon_244             = 244
    Icon_245             = 245
    Icon_246             = 246
    Icon_247             = 247
    Icon_248             = 248
    Icon_249             = 249
    Icon_250             = 250
    Icon_251             = 251
    Icon_252             = 252
    Icon_253             = 253
    Icon_254             = 254
    Icon_255             = 255
  end

  struct StyleProp
    control_id : LibC::UShort
    property_id : LibC::UShort
    property_value : LibC::Int
  end

  fun enable = GuiEnable
  fun disable = GuiEnable
  fun lock = GuiLock
  fun unlock = GuiUnlock
  fun is_locked? = GuiIsLocked : Bool
  fun set_alpha = GuiSetAlpha(alpha : LibC::Float)
  fun set_state = GuiSetState(state : LibC::Int)
  fun set_font = GuiSetFont(font : Raylib::Font)
  fun set_style = GuiSetStyle(control : LibC::Int, property : LibC::Int, value : LibC::Int)
  fun get_state = GuiGetState : LibC::Int
  fun get_font = GuiGetFont : Raylib::Font
  fun get_style = GuiGetStyle(control : LibC::Int, property : LibC::Int) : LibC::Int

  fun load_style = GuiLoadStyle(filename : LibC::Char*)
  fun load_style_default = GuiLoadStyleDefault

  fun enable_tooltip = GuiEnableTooltip
  fun disable_tooltip = GuiDisableTooltip
  fun set_tooltip = GuiSetTooltip(tooltip : LibC::Char*)

  fun icon_text = GuiIconText(icon_id : LibC::Int, text : LibC::Char*) : LibC::Char*
  fun set_icon_scale = GuiSetIconScale(scale : LibC::Int)
  fun get_icons = GuiGetIcons : LibC::UInt*
  fun load_icons = GuiLoadIcons(filename : LibC::Char*, load_icons_name : Bool) : LibC::Char**
  fun draw_icon = GuiDrawIcon(icon_id : LibC::Int, x : LibC::Int, y : LibC::Int, pixel_size : LibC::Int, color : Raylib::Color)

  fun window_box = GuiWindowBox(bounds : Raylib::Rectangle, title : LibC::Char*) : LibC::Int
  fun group_box = GuiGroupBox(bounds : Raylib::Rectangle, text : LibC::Char*) : LibC::Int
  fun line = GuiLine(bounds : Raylib::Rectangle, text : LibC::Char*) : LibC::Int
  fun panel = GuiPanel(bounds : Raylib::Rectangle, text : LibC::Char*) : LibC::Int
  fun tab_bar = GuiTabBar(bounds : Raylib::Rectangle, text : LibC::Char**, count : LibC::Int, active : LibC::Int*) : LibC::Int
  fun scroll_panel = GuiScrollPanel(bounds : Raylib::Rectangle, text : LibC::Char*, content : Raylib::Rectangle, scroll : Raylib::Vector2*, view : Raylib::Rectangle*) : LibC::Int

  fun label = GuiLabel(bounds : Raylib::Rectangle, text : LibC::Char*) : LibC::Int
  fun button = GuiButton(bounds : Raylib::Rectangle, text : LibC::Char*) : LibC::Int
  fun label_button = GuiLabelButton(bounds : Raylib::Rectangle, text : LibC::Char*) : LibC::Int
  fun toggle = GuiToggle(bounds : Raylib::Rectangle, text : LibC::Char*, active : Bool*) : LibC::Int
  fun toggle_group = GuiToggleGroup(bounds : Raylib::Rectangle, text : LibC::Char*, active : LibC::Int*) : LibC::Int
  fun toggle_slider = GuiToggleSlider(bounds : Raylib::Rectangle, text : LibC::Char*, active : LibC::Int*) : LibC::Int
  fun check_box = GuiCheckBox(bounds : Raylib::Rectangle, text : LibC::Char*, checked : Bool*) : LibC::Int
  fun combo_box = GuiComboBox(bounds : Raylib::Rectangle, text : LibC::Char*, active : LibC::Int*) : LibC::Int
  fun dropdown_box = GuiDropdownBox(bounds : Raylib::Rectangle, text : LibC::Char*, active : LibC::Int*, edit_mode : Bool) : LibC::Int
  fun spinner = GuiSpinner(bounds : Raylib::Rectangle, text : LibC::Char*, value : LibC::Int*, min_value : LibC::Int, max_value : LibC::Int, edit_mode : Bool) : LibC::Int
  fun value_box = GuiValueBox(bounds : Raylib::Rectangle, text : LibC::Char*, value : LibC::Int*, min_value : LibC::Int, max_value : LibC::Int, edit_mode : Bool) : LibC::Int
  fun text_box = GuiTextBox(bounds : Raylib::Rectangle, text : LibC::Char*, text_size : LibC::Int, edit_mode : Bool) : LibC::Int
  fun slider = GuiSlider(bounds : Raylib::Rectangle, text_left : LibC::Char*, text_right : LibC::Char*, value : LibC::Float*, min_value : LibC::Float, max_value : LibC::Float) : LibC::Int
  fun slider_bar = GuiSliderBar(bounds : Raylib::Rectangle, text_left : LibC::Char*, text_right : LibC::Char*, value : LibC::Float*, min_value : LibC::Float, max_value : LibC::Float) : LibC::Int
  fun progress_bar = GuiProgressBar(bounds : Raylib::Rectangle, text_left : LibC::Char*, text_right : LibC::Char*, value : LibC::Float*, min_value : LibC::Float, max_value : LibC::Float) : LibC::Int
  fun status_bar = GuiStatusBar(bounds : Raylib::Rectangle, text : LibC::Char*) : LibC::Int
  fun dummy_rec = GuiDummyRec(bounds : Raylib::Rectangle, text : LibC::Char*) : LibC::Int
  fun grid = GuiGrid(bounds : Raylib::Rectangle, text : LibC::Char*, spacing : LibC::Float, subdivs : LibC::Int, mouse_cell : Raylib::Vector2*) : LibC::Int

  fun list_view = GuiListView(bounds : Raylib::Rectangle, text : LibC::Char*, scroll_index : LibC::Int*, active : LibC::Int*) : LibC::Int
  fun list_view_ex = GuiListViewEx(bounds : Raylib::Rectangle, text : LibC::Char**, count : LibC::Int, scroll_index : LibC::Int*, active : LibC::Int*, focus : LibC::Int*) : LibC::Int
  fun message_box = GuiMessageBox(bounds : Raylib::Rectangle, title : LibC::Char*, message : LibC::Char*, buttons : LibC::Char*) : LibC::Int
  fun text_input_box = GuiTextInputBox(bounds : Raylib::Rectangle, title : LibC::Char*, message : LibC::Char*, buttons : LibC::Char*, text : LibC::Char*, text_max_size : LibC::Int, secret_view_active : Bool*) : LibC::Int
  fun color_picker = GuiColorPicker(bounds : Raylib::Rectangle, text : LibC::Char*, color : Raylib::Color*) : LibC::Int
  fun color_panel = GuiColorPanel(bounds : Raylib::Rectangle, text : LibC::Char*, color : Raylib::Color*) : LibC::Int
  fun color_bar_alpha = GuiColorBarAlpha(bounds : Raylib::Rectangle, text : LibC::Char*, alpha : LibC::Float*) : LibC::Int
  fun color_bar_hue = GuiColorBarHue(bounds : Raylib::Rectangle, text : LibC::Char*, value : LibC::Float*) : LibC::Int
  fun color_picker_hsv = GuiColorPickerHSV(bounds : Raylib::Rectangle, text : LibC::Char*, color_hsv : Raylib::Vector3*) : LibC::Int
  fun color_panel_hsv = GuiColorPanelHSV(bounds : Raylib::Rectangle, text : LibC::Char*, color_hsv : Raylib::Vector3*) : LibC::Int
end
