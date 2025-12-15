class_name HudClass extends CanvasLayer

@onready var label: Label = $TopCaption/Label
@onready var sprite: Sprite2D = $TopCaption/Sprite2D

const JAILER_ONE = preload("uid://ds2n42y8kn0y8")
const JAILER_TWO = preload("uid://36jojg0svt4n")

# This will need some extension for multi-step dialogue
signal ShowCaption(text: String, character: String)

func _ready():
	ShowCaption.connect(RenderCaption)
	pass

func RenderCaption(text: String, character: String = 'none') -> void:
	label.text = text
	assignSprite(character)
	# Update sprite based on character
	await get_tree().create_timer(2).timeout # Dynamic based on length? Give characters speaking speeds? If you voice act this, you'll 100% need dynamic lengths
	# How do I make this timer reset if another dialogue is pushed?
	label.text = ''
	sprite.texture = null
	pass

func assignSprite(character: String) -> void:
	if (character == 'Jailer One'):
		sprite.texture = JAILER_ONE
	elif (character == 'Jailer Two'):
		sprite.texture = JAILER_TWO
	else:
		pass
