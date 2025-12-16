class_name HudClass extends CanvasLayer

@onready var caption_container: Control = $TopCaption
@onready var label: Label = $TopCaption/Label
@onready var sprite: Sprite2D = $TopCaption/Sprite2D
@onready var hp_rect: ColorRect = $Control/ColorRect

@export var hp_bar_default_length = 160

var _caption_tween: Tween
var _current_text: String
var _current_character: String

const PORTRAITS = {
	"Jailer One": preload("uid://ds2n42y8kn0y8"),
	"Jailer Two": preload("uid://36jojg0svt4n"),
}

signal show_caption(text: String, character: String)

func _ready():
	show_caption.connect(render_caption)

func update_hp_display(player_hp: int, player_max_hp: int) -> void:
	var hp_percent = float(player_hp) / float(player_max_hp)
	hp_rect.size = Vector2(hp_bar_default_length * hp_percent, hp_rect.size.y)

# Support for dialogue 'chances', where it only plays sometimes
# This will need some extension for multi-step dialogue - Scripts?
func render_caption(text: String, character: String = 'none') -> void:
	if _caption_tween:
		_caption_tween.kill()

	var content_changed = text != _current_text or character != _current_character
	_current_text = text
	_current_character = character

	label.text = text
	assign_sprite(character)

	_caption_tween = create_tween()
	if content_changed:
		caption_container.modulate.a = 0.0
		_caption_tween.tween_property(caption_container, "modulate:a", 1.0, 0.1) # Tweak 0.1 to adjust the fade speed
	_caption_tween.tween_interval(4.0) # Dynamic based on length? Give characters speaking speeds?
	_caption_tween.tween_property(caption_container, "modulate:a", 0.0, 0.1)
	_caption_tween.tween_callback(_clear_caption)

func _clear_caption() -> void:
	label.text = ''
	sprite.texture = null
	_current_text = ''
	_current_character = ''

func assign_sprite(character: String) -> void:
	sprite.texture = PORTRAITS.get(character)
