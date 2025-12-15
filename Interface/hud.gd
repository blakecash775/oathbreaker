class_name HudClass extends CanvasLayer

@onready var label: Label = $TopCaption/Label
@onready var sprite: Sprite2D = $TopCaption/Sprite2D

var _caption_tween: Tween

const JAILER_ONE = preload("uid://ds2n42y8kn0y8")
const JAILER_TWO = preload("uid://36jojg0svt4n")

signal ShowCaption(text: String, character: String)

func _ready():
	ShowCaption.connect(RenderCaption)
	pass

# Support for dialogue 'chances', where it only plays sometimes
# This will need some extension for multi-step dialogue - Scripts?
func RenderCaption(text: String, character: String = 'none') -> void:
	if _caption_tween:
		_caption_tween.kill()

	label.text = text
	assignSprite(character)

	_caption_tween = create_tween()
	_caption_tween.tween_interval(2.0) # Dynamic based on length? Give characters speaking speeds?
	_caption_tween.tween_callback(_clear_caption)

func _clear_caption() -> void:
	label.text = ''
	sprite.texture = null

func assignSprite(character: String) -> void:
	if (character == 'Jailer One'):
		sprite.texture = JAILER_ONE
	elif (character == 'Jailer Two'):
		sprite.texture = JAILER_TWO
