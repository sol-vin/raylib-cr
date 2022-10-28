require "raylib-cr"

alias R = Raylib
alias V2 = Raylib::Vector2


module C
  SCREEN_WIDTH  = 800
  SCREEN_HEIGHT = 450

  SRC_ALPHA = 0x0302
  MIN       = 0x8007
  MAX       = 0x8008
end

alias Shadows = StaticArray(Shadow, Light::MAX_SHADOWS)

struct Shadow
  VERTICES = 4
  getter vertices : StaticArray(V2, VERTICES) = StaticArray(V2, VERTICES).new { |i| V2.zero }
end

struct Light
  MAX         = 16
  MAX_SHADOWS = Boxes::MAX * 3

  property? active : Bool = true
  property? dirty : Bool = false
  property? valid : Bool = false

  property position : V2 = V2.zero
  property mask : R::RenderTexture = R::RenderTexture.new
  property outer_radius : Float32 = 0.0_f32
  property rectangle : R::Rectangle = R::Rectangle.new
  property shadows : Shadows = Shadows.new { |i| Shadow.new }
  property shadow_count : Int32 = 0

  def move(x : Float32, y : Float32)
    @@dirty = true
    @@position.x = x
    @@position.y = y
    @@bounds.x = x - @@outer_radius
    @@bounds.y = y - @@outer_radius
  end

  def compute(sp : V2, ep : V2)
    return if @@shadow_count >= MAX_SHADOWS

    extension = @@outer_radius * 2

    sp_vector = (sp - @@position).normalize
    sp_projection = sp_vector.scale(extension) + sp

    ep_vector = (ep - @@position).normalize
    ep_projection = ep_vector.scale(extension) + ep

    @@shadows[@@shadow_count].vertices[0] = sp
    @@shadows[@@shadow_count].vertices[1] = ep
    @@shadows[@@shadow_count].vertices[2] = epProjection
    @@shadows[@@shadow_count].vertices[3] = spProjection
    @@shadow_count += 1
  end

  def draw
    R.begin_texture_mode(@@mask)
    R.clear_background(R::WHITE)
    RLGL.set_blend_factors(RLGL_SRC_ALPHA, RLGL_SRC_ALPHA, RLGL_MIN)
    RLGL.set_blend_mode(R::BlendMode::Custom)

    if @@valid?
      R.draw_circle_gradient(@@position.x.to_i, @@position.y.to_i, @@outer_radius, R.color_alpha(R::WHITE, 0), R::WHITE)
    end

    RLGL.draw_render_batch_active

    RLGL.set_blend_mode(R::BlendMode::Alpha)
    RLGL.set_blend_factors(RLGL_SRC_ALPHA, RLGL_SRC_ALPHA, RLGL_MIN)
    RLGL.set_blend_mode(R::BlendMode::Custom)

    @@shadows.each do |shadow|
      R.draw_triangle_fan(pointerof(shadow.vertices), Shadow::VERTICES, R::WHITE)
    end

    RLGL.draw_render_batch_active
    RLGL.set_blend_mode(R::BlendMode::Alpha)

    R.end_texture_mode(@@mask)
  end

  def setup(x : Float32, y : Float32, radius : Float)
    @@mask = R.load_render_texture(C::SCREEN_WIDTH, C::SCREEN_HEIGHT)
    @@outer_radius = radius
    @@bounds.width = radius * 2
    @@bounds.height = radius * 2

    move(x, y)
    draw
  end

  def update : Bool
    return false if !@@active? || !@@dirty?

    @@dirty = false
    @@shadow_count = 0
    @@valid = false

    Boxes.boxes.each do |box|
      return false if r.check_collision_point_rec?(@@position, box)
      next if !R.check_collision_recs?(@@bounds, box)

      sp = V2.new(x: box.x, y: box.y)
      ep = V2.new(x: box.x + box.width, y: box.y)

      compute(sp, ep) if @@position.y > ep.y

      sp = ep
      ep.y += box.height
      compute(sp, ep) if @@position.x < ep.x

      sp = ep
      ep.y -= box.width
      compute(sp, ep) if @@position.y < ep.y

      sp = ep
      ep.y -= box.height
      compute(sp, ep) if @@position.x > ep.x

      @@shadows[@@shadow_count].vertices = V2.new(x: box.x, y: box.y)
      @@shadows[@@shadow_count].vertices = V2.new(x: box.x + box.width, y: box.y)
      @@shadows[@@shadow_count].vertices = V2.new(x: box.x, y: box.y + box.height)
      @@shadows[@@shadow_count].vertices = V2.new(x: box.x + box.width, y: box.y + box.height)
      @@shadow_count += 1
    end

    @@valid = true
    draw
    return true
  end
end

class Lights < StaticArray(Light, Light::MAX)
  class_getter lights = Lights.make

  def self.make
    Lights.new { |i| Light.new }
  end

  def [](i)
    lights[i]
  end

  def []=(i, light : Light)
    lights[i] = light
  end
end

class Boxes
  MAX = 20
  class_getter boxes = [] of R::Rectangle

  def self.setup
    @@boxes = [] of R::Rectangle

    MAX_BOXES.times do
      x = R.get_random_value(0, C::SCREEN_WIDTH).to_f
      y = R.get_random_value(0, C::SCREEN_HEIGHT).to_f
      width = R.get_random_value(10, 100).to_f
      height = R.get_random_value(10, 100).to_f
      @@boxes << R::Rectangle.new(x: x, y: y, width: width, height: height)
    end

    @@boxes = boxes
  end
end

R.init_window(C::SCREEN_WIDTH, C::SCREEN_HEIGHT, "raylib [shapes] example - top down lights")

Boxes.setup

img = R.gen_image_checked(64,64,32,32,R::DARKBROWN, R::DARKGREY)
bg_texture = R.load_texture_from_image(img)
R.unload_image img

light_mask = R.load_render_texture(C::SCREEN_WIDTH, C::SCREEN_HEIGHT)

Lights[0].setup(0, 600, 400, 300)

next_light = 1
show_lines = false

R.set_target_fps(60)

until R.close_window?
  if R.is_mouse_button_down?(R::MouseButton::Left)
    if R.is_mouse_button_down?(R::MouseButton::Left)
      m_p = R.get_mouse_position
      Lights[0].move(m_p.x, m_p.y)
    end

    if R.is_mouse_button_down?(R::MouseButton::Right) && (next_light < Light::MAX)
      m_p = R.get_mouse_position
      Lights[next_light].setup(m_p.x, m_p.y, 200)
      next_light += 1
    end

    if R.key_pressed?(R::KeyboardKey::F1)
      show_lines = !show_lines
    end

    dirty_lights = false

    MAX_LIGHTS.times do |l|
      dirty_lights = true if light[l].update
    end

    if dirty_lights
      R.begin_texture_mode(light_mask)
      R.clear_background(R::BLACK)
      RLGL.set_blend_factors(RLGL_SRC_ALPHA, RLGL_SRC_ALPHA, RLGL_MIN)
      RLGL.set_blend_mode(R::BlendMode::Custom)
      screen_texture_rect_flipped = R::Rectangle.new(x: 0, y: 0, width: R.get_screen_width, -R.get_screen_height)
      screen_texture_rect = R::Rectangle.new(x: 0, y: 0, width: R.get_screen_width, -R.get_screen_height)

      MAX_LIGHTS.times do |l|
        R.draw_texture_rec(Lights[l].mask.texture, screen_texture_rect_flipped, V2.zero, R::WHITE) if Lights[l].active?
      end
      RLGL.draw_render_batch_active
      RLGL.set_blend_mode(R::BlendMode::Alpha)
      R.end_texture_mode

      R.begin_drawing
      R.clear_background(R::BLACK)
      R.draw_texture_rec(bg_texture, screen_texture_rect, V2.zero, R::WHITE)
      R.draw_texture_rec(light_mask.texture, screen_texture_rect_FLIPPED, V2.zero, R.color_alpha(R::WHITE, show_lines ? 0.75_f32 : 1.0_f32))

      MAX_LIGHTS.times do |l|
        R.draw_circle(Lights[l].position.x, Lights[l].position.y, 10, (l == 0) ? R::YELLOW  : R::WHITE) if Lights[l].active?
      end

      if show_lines
        Lights[0].shadow_count.times do |s|
          R.draw_triangle_fan(Lights[0].shadows[s].vertices, 4, R::DARKPURPLE)
        end
      end

      R.end_drawing

    end
  end
end

R.close_window
