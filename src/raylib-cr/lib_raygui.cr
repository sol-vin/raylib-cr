@[Link("raygui")]
lib LibRayGUI
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

  fun enable = GuiEnable
  fun disable = GuiDisable
  fun lock = GuiLock
  fun unlock = GuiUnlock
  fun is_locked? = GuiIsLocked : Bool
  fun fade = GuiFade(alpha : LibC::Float)
  fun set_state = GuiSetState(state : LibC::Int)
  fun get_state = GuiGetState : LibC::Int

  fun set_font = GuiSetFont(font : LibRaylib::Font)
  fun get_font = GuiGetFont : LibRaylib::Font

  fun set_style = GuiSetStyle(control : LibC::Int, property : LibC::Int, value : LibC::Int)
  fun get_style = GuiGetStyle(control : LibC::Int, property : LibC::Int) : LibC::Int

  fun window_box = GuiWindowBox(bounds : LibRaylib::Rectangle, title : LibC::Char*) : Bool
  fun group_box = GuiGroupBox(bounds : LibRaylib::Rectangle, text : LibC::Char*)
  fun line = GuiLine(bounds : LibRaylib::Rectangle, text : LibC::Char*)
  fun panel = GuiPanel(bounds : LibRaylib::Rectangle)
  fun scroll_panel = GuiScrollPanel(bounds : LibRaylib::Rectangle, content : LibRaylib::Rectangle, scroll : LibRaylib::Vector2*) : LibRaylib::Rectangle

  fun label = GuiLabel(bounds : LibRaylib::Rectangle, text : LibC::Char*)
  fun button = GuiButton(bounds : LibRaylib::Rectangle, text : LibC::Char*) : Bool
  fun label_button = GuiLabelButton(bounds : LibRaylib::Rectangle, text : LibC::Char*) : Bool
  fun toggle = GuiToggle(bounds : LibRaylib::Rectangle, text : LibC::Char*, active : Bool) : Bool
  fun toggle_group = GuiToggleGroup(bounds : LibRaylib::Rectangle, text : LibC::Char*, active : LibC::Int) : LibC::Int
  fun check_box = GuiCheckBox(bounds : LibRaylib::Rectangle, text : LibC::Char*, checked : Bool) : Bool
  fun combo_box = GuiComboBox(bounds : LibRaylib::Rectangle, text : LibC::Char*, active : LibC::Int) : LibC::Int
  fun dropdown_box = GuiDropdownBox(bounds : LibRaylib::Rectangle, text : LibC::Char*, active : LibC::Int*, edit_mode : Bool) : Bool
  fun spinner = GuiSpinner(bounds : LibRaylib::Rectangle, text : LibC::Char*, value : LibC::Int*, min_value : LibC::Int, max_value : LibC::Int, edit_mode : Bool) : Bool
  fun value_box = GuiValueBox(bounds : LibRaylib::Rectangle, text : LibC::Char*, value : LibC::Int*, min_value : LibC::Int, max_value : LibC::Int, edit_mode : Bool) : Bool
  fun text_box = GuiTextBox(bounds : LibRaylib::Rectangle, text : LibC::Char*, text_size : LibC::Int, edit_mode : Bool) : Bool
  fun text_box_multi = GuiTextBoxMulti(bounds : LibRaylib::Rectangle, text : LibC::Char*, text_size : LibC::Int, edit_mode : Bool) : Bool
  fun slider = GuiSlider(bounds : LibRaylib::Rectangle, text_left : LibC::Char*, text_right : LibC::Char*, value : LibC::Float, min_value : LibC::Float, max_value : LibC::Float) : LibC::Float
  fun slider_bar = GuiSliderBar(bounds : LibRaylib::Rectangle, text_left : LibC::Char*, text_right : LibC::Char*, value : LibC::Float, min_value : LibC::Float, max_value : LibC::Float) : LibC::Float
  fun progress_bar = GuiProgressBar(bounds : LibRaylib::Rectangle, text_left : LibC::Char*, text_right : LibC::Char*, value : LibC::Float, min_value : LibC::Float, max_value : LibC::Float) : LibC::Float
  fun status_bar = GuiStatusBar(bounds : LibRaylib::Rectangle, text : LibC::Char*)
  fun dummy_rec = GuiDummyRec(bounds : LibRaylib::Rectangle, text : LibC::Char*)
  fun scroll_bar = GuiScrollBar(bounds : LibRaylib::Rectangle, value : LibC::Int, min_value : LibC::Int, max_value : LibC::Int) : LibC::Int
  fun grid = GuiGrid(bounds : LibRaylib::Rectangle, spacing : LibC::Float, subdivs : LibC::Int) : LibRaylib::Vector2

  fun list_view = GuiListView(bounds : LibRaylib::Rectangle, text : LibC::Char*, scroll_index : LibC::Int*, active : LibC::Int) : LibC::Int
  fun list_view_ex = GuiListViewEx(bounds : LibRaylib::Rectangle, text : LibC::Char**, count : LibC::Int, focus : LibC::Int*, scroll_index : LibC::Int*, active : LibC::Int) : LibC::Int
  fun message_box = GuiMessageBox(bounds : LibRaylib::Rectangle, title : LibC::Char*, message : LibC::Char*, buttons : LibC::Char*) : LibC::Int
  fun text_input_box = GuiTextInputBox(bounds : LibRaylib::Rectangle, title : LibC::Char*, message : LibC::Char*, buttons : LibC::Char*, text : LibC::Char*) : LibC::Int
  fun color_picker = GuiColorPicker(bounds : LibRaylib::Rectangle, color : LibRaylib::Color) : LibRaylib::Color
  fun color_panel = GuiColorPanel(bounds : LibRaylib::Rectangle, color : LibRaylib::Color) : LibRaylib::Color
  fun color_bar_alpha = GuiColorBarAlpha(bounds : LibRaylib::Rectangle, alpha : LibC::Float) : LibC::Float
  fun color_bar_hue = GuiColorBarAlpha(bounds : LibRaylib::Rectangle, value : LibC::Float) : LibC::Float
  
  fun load_style = GuiLoadStyle(filename : LibC::Char*)
  fun load_style_default = GuiLoadStyleDefault

  fun icon_text = GuiIconText(icon_id : LibC::Int, text : LibC::Char*) : LibC::Char*

  fun draw_icon = GuiDrawIcon(icon_id : LibC::Int, pos_x : LibC::Int, pos_y : LibC::Int, pixel_size : LibC::Int, color : LibRaylib::Color)
  fun get_icons = GuiGetIcons : LibC::UInt*
  fun get_icon_data = GuiGetIconData(icon_id : LibC::Int) : LibC::UInt*
  fun set_icon_data = GuiSetIconData(icon_id : LibC::Int, data : LibC::UInt*)

  fun set_icon_pixel = GuiSetIconPixel(icon_id : LibC::Int, x : LibC::Int, y : LibC::Int)
  fun clear_icon_pixel = GuiClearIconPixel(icon_id : LibC::Int, x : LibC::Int, y : LibC::Int)
  fun check_icon_pixel = GuiCheckIconPixel(icon_id : LibC::Int, x : LibC::Int, y : LibC::Int)
end
