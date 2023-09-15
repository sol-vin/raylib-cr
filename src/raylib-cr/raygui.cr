@[Link("raygui")]
lib RayGUI
  struct GUIStyleProp
    control_id : LibC::UShort
    property_id : LibC::UShort
    property_value : LibC::Int
  end

  enum GUIControlState
    Normal   = 0
    Focused
    Pressed
    Disabled
  end

  enum GUITextAlignment
    Left   = 0
    Center
    Right
  end

  enum GUIControl
    Default     = 0
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

  enum GuiControlProperty
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
    Reserved
  end

  enum GUIDefaultProperty
    TextSize        = 16
    TextSpacing
    LineColor
    BackgroundColor
  end

  enum GuiToggleProperty
    GroupPadding = 16
  end

  enum GUISliderProperty
    SliderWidth   = 16
    SliderPadding
  end

  enum GUIProgressBarProperty
    ProgressPadding = 16
  end

  enum GUICheckBoxProperty
    CheckPadding = 16
  end

  enum GUIDropdownBoxProperty
    ArrowPadding         = 16
    DropdownItemsPadding
  end

  enum GUITextBoxProperty
    TextInnerPadding = 16
    TextLinesPadding
    ColorSelectedFG
    ColorSelectedBG
  end

  enum GUISpinnerProperty
    SpinButtonWidth   = 16
    SpinButtonPadding
  end

  enum GUIScrollBarProperty
    ArrowsSize          = 16
    ArrowsVisible
    ScrollSliderPadding
    ScrollSliderSize
    ScrollPadding
    ScrollSpeed
  end

  enum GUIScrollBarSide
    Left  = 0
    RIght
  end

  enum GUIListViewProperty
    ListItemsHeight  = 16
    ListItemsPadding
    ScrollBarWidth
    ScrollBarSide
  end

  enum GUIColorPickerProperty
    ColorSelectorSize      = 16
    HueBarWidth
    HueBarPadding
    HueBarSelectorHeight
    HueBarSelectorOverflow
  end

  fun load_style_from_memory = GuiLoadStyleFromMemory(file_data : LibC::UChar*, data_size : LibC::Int)
  fun get_text_width = GetTextWidth(text : LibC::Char*) : LibC::Int
  fun get_text_bounds = GetTextBounds(control : LibC::Int, bounds : Raylib::Rectangle) : Raylib::Rectangle
  fun get_text_icon = GetTextIcon(text : LibC::Char*, icon_id : LibC::Int*) : LibC::Char*
  fun draw_text = GuiDrawText(text : LibC::Char*, text_bounds : Raylib::Rectangle, alignment : LibC::Int, tint : Raylib::Color)
  fun draw_rectangle = GuiDrawRectangle(rec : Raylib::Rectangle, border_width : LibC::Int, border_color : Raylib::Color, color : Raylib::Color)
  fun text_split = GuiTextSplit(text : LibC::Char*, delimiter :  LibC::Char, count : LibC::Int*, text_row : LibC::Int*) : LibC::Char**
  fun convert_hsv_to_rgb = ConvertHSVtoRGB(hsv : Raylib::Vector3) : Raylib::Vector3
  fun convert_rgb_to_hsv = ConvertRGBtoHSV(rgb : Raylib::Vector3) : Raylib::Vector3
  fun scroll_bar = GuiScrollBar(bounds : Raylib::Rectangle, value : LibC::Int, min_value : LibC::Int, max_value : LibC::Int) : LibC::Int
  fun tooltip = GuiTooltip(control_rec : Raylib::Rectangle)
  fun fade = GuiFade(color : Raylib::Color, alpha : LibC::Float)
  

  fun enable = GuiEnable
  fun disable = GuiDisable
  fun lock = GuiLock
  fun unlock = GuiUnlock
  fun locked? = GuiIsLocked : Bool
  fun set_alpha = GuiSetAlpha(alpha : LibC::Float)
  fun set_state = GuiSetState(state : LibC::Int)
  fun get_state = GuiGetState : LibC::Int

  fun set_font = GuiSetFont(font : Raylib::Font)
  fun get_font = GuiGetFont : Raylib::Font

  fun set_style = GuiSetStyle(control : LibC::Int, property : LibC::Int, value : LibC::Int)
  fun get_style = GuiGetStyle(control : LibC::Int, property : LibC::Int) : LibC::Int

  fun window_box = GuiWindowBox(bounds : Raylib::Rectangle, title : LibC::Char*) : LibC::Int
  fun group_box = GuiGroupBox(bounds : Raylib::Rectangle, text : LibC::Char*) : LibC::Int
  fun line = GuiLine(bounds : Raylib::Rectangle, text : LibC::Char*) : LibC::Int
  fun panel = GuiPanel(bounds : Raylib::Rectangle) : LibC::Int
  fun tab_bar = GuiTabBar(bounds : Raylib::Rectangle, text : LibC::Char**, count : LibC::Int, active : LibC::Int*) : LibC::Int
  fun scroll_panel = GuiScrollPanel(bounds : Raylib::Rectangle, text : LibC::Char*, content : Raylib::Rectangle, scroll : Raylib::Vector2*, view : Raylib::Rectangle*) : LibC::Int

  fun label = GuiLabel(bounds : Raylib::Rectangle, text : LibC::Char*) : LibC::Int
  fun button = GuiButton(bounds : Raylib::Rectangle, text : LibC::Char*) : LibC::Int
  fun label_button = GuiLabelButton(bounds : Raylib::Rectangle, text : LibC::Char*) : LibC::Int
  fun toggle = GuiToggle(bounds : Raylib::Rectangle, text : LibC::Char*, active : Bool*) : LibC::Int
  fun toggle_group = GuiToggleGroup(bounds : Raylib::Rectangle, text : LibC::Char*, active : Bool*) : LibC::Int
  fun toggle_slider = GuiToggleSlider(bounds : Raylib::Rectangle, text : LibC::Char*, active : Bool*) : LibC::Int
  fun check_box = GuiCheckBox(bounds : Raylib::Rectangle, text : LibC::Char*, checked : Bool*) : LibC::Int
  fun combo_box = GuiComboBox(bounds : Raylib::Rectangle, text : LibC::Char*, active : LibC::Int*) : LibC::Int
  fun dropdown_box = GuiDropdownBox(bounds : Raylib::Rectangle, text : LibC::Char*, active : LibC::Int*, edit_mode : Bool) : LibC::Int
  fun text_box = GuiTextBox(bounds : Raylib::Rectangle, text : LibC::Char*, text_size : LibC::Int, edit_mode : Bool) : LibC::Int
  fun spinner = GuiSpinner(bounds : Raylib::Rectangle, text : LibC::Char*, value : LibC::Int*, min_value : LibC::Int, max_value : LibC::Int, edit_mode : Bool) : LibC::Int
  fun value_box = GuiValueBox(bounds : Raylib::Rectangle, text : LibC::Char*, value : LibC::Int*, min_value : LibC::Int, max_value : LibC::Int, edit_mode : Bool) : LibC::Int
  fun slider_pro = GuiSliderPro(bounds : Raylib::Rectangle, text_left : LibC::Char*, text_right : LibC::Char*, value : LibC::Float, min_value : LibC::Float, max_value : LibC::Float, slider_width : LibC::Int) : LibC::Int
  fun slider = GuiSlider(bounds : Raylib::Rectangle, text_left : LibC::Char*, text_right : LibC::Char*, value : LibC::Float, min_value : LibC::Float, max_value : LibC::Float) : LibC::Int
  fun slider_bar = GuiSliderBar(bounds : Raylib::Rectangle, text_left : LibC::Char*, text_right : LibC::Char*, value : LibC::Float, min_value : LibC::Float, max_value : LibC::Float) : LibC::Int
  


  # fun text_box_multi = GuiTextBoxMulti(bounds : Raylib::Rectangle, text : LibC::Char*, text_size : LibC::Int, edit_mode : Bool) : Bool
  fun progress_bar = GuiProgressBar(bounds : Raylib::Rectangle, text_left : LibC::Char*, text_right : LibC::Char*, value : LibC::Float, min_value : LibC::Float, max_value : LibC::Float) : LibC::Float
  fun status_bar = GuiStatusBar(bounds : Raylib::Rectangle, text : LibC::Char*)
  fun dummy_rec = GuiDummyRec(bounds : Raylib::Rectangle, text : LibC::Char*)
  fun scroll_bar = GuiScrollBar(bounds : Raylib::Rectangle, value : LibC::Int, min_value : LibC::Int, max_value : LibC::Int) : LibC::Int
  fun grid = GuiGrid(bounds : Raylib::Rectangle, spacing : LibC::Float, subdivs : LibC::Int) : Raylib::Vector2

  fun list_view = GuiListView(bounds : Raylib::Rectangle, text : LibC::Char*, scroll_index : LibC::Int*, active : LibC::Int) : LibC::Int
  fun list_view_ex = GuiListViewEx(bounds : Raylib::Rectangle, text : LibC::Char**, count : LibC::Int, focus : LibC::Int*, scroll_index : LibC::Int*, active : LibC::Int) : LibC::Int
  fun message_box = GuiMessageBox(bounds : Raylib::Rectangle, title : LibC::Char*, message : LibC::Char*, buttons : LibC::Char*) : LibC::Int
  fun text_input_box = GuiTextInputBox(bounds : Raylib::Rectangle, title : LibC::Char*, message : LibC::Char*, buttons : LibC::Char*, text : LibC::Char*) : LibC::Int
  fun color_picker = GuiColorPicker(bounds : Raylib::Rectangle, color : Raylib::Color) : Raylib::Color
  fun color_panel = GuiColorPanel(bounds : Raylib::Rectangle, color : Raylib::Color) : Raylib::Color
  fun color_bar_alpha = GuiColorBarAlpha(bounds : Raylib::Rectangle, alpha : LibC::Float) : LibC::Float
  fun color_bar_hue = GuiColorBarAlpha(bounds : Raylib::Rectangle, value : LibC::Float) : LibC::Float
  
  fun load_style = GuiLoadStyle(filename : LibC::Char*)
  fun load_style_default = GuiLoadStyleDefault

  fun icon_text = GuiIconText(icon_id : LibC::Int, text : LibC::Char*) : LibC::Char*

  fun draw_icon = GuiDrawIcon(icon_id : LibC::Int, pos_x : LibC::Int, pos_y : LibC::Int, pixel_size : LibC::Int, color : Raylib::Color)
  fun get_icons = GuiGetIcons : LibC::UInt*
  fun get_icon_data = GuiGetIconData(icon_id : LibC::Int) : LibC::UInt*
  fun set_icon_data = GuiSetIconData(icon_id : LibC::Int, data : LibC::UInt*)

  fun set_icon_pixel = GuiSetIconPixel(icon_id : LibC::Int, x : LibC::Int, y : LibC::Int)
  fun clear_icon_pixel = GuiClearIconPixel(icon_id : LibC::Int, x : LibC::Int, y : LibC::Int)
  fun check_icon_pixel = GuiCheckIconPixel(icon_id : LibC::Int, x : LibC::Int, y : LibC::Int)
end
