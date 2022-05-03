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
  fun get_state = GuiSetState : LibC::Int
  
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
  






end
