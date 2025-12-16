class_name HudClass extends CanvasLayer

@onready var caption_container: Control = $TopCaption
@onready var label: Label = $TopCaption/Label
@onready var sprite: Sprite2D = $TopCaption/Sprite2D
@onready var hp_rect: ColorRect = $Control/ColorRect

@export var HpBarDefaultLength = 160

var _caption_tween: Tween
var _current_text: String
var _current_character: String

const JAILER_ONE = preload("uid://ds2n42y8kn0y8")
const JAILER_TWO = preload("uid://36jojg0svt4n")

signal ShowCaption(text: String, character: String)

func _ready():
	ShowCaption.connect(RenderCaption)
	pass

func update_hp_display(playerHp: int, playerMaxHp: int) -> void:
	var hpPercent = float(playerHp) / float(playerMaxHp)
	hp_rect.size = Vector2(HpBarDefaultLength * hpPercent , hp_rect.size.y)

# Support for dialogue 'chances', where it only plays sometimes
# This will need some extension for multi-step dialogue - Scripts?
func RenderCaption(text: String, character: String = 'none') -> void:
	if _caption_tween:
		_caption_tween.kill()

	var content_changed = text != _current_text or character != _current_character
	_current_text = text
	_current_character = character

	label.text = text
	assignSprite(character)

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

func assignSprite(character: String) -> void:
	if (character == 'Jailer One'):
		sprite.texture = JAILER_ONE
	elif (character == 'Jailer Two'):
		sprite.texture = JAILER_TWO
