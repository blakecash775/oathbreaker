class_name HudClass extends CanvasLayer

@onready var label: Label = $TopCaption/Label

# This will need some extension for multi-step dialogue
signal ShowCaption(text: String, character: String)

func _ready():
	ShowCaption.connect(RenderCaption)
	pass

func RenderCaption(text: String, _character: String = 'none') -> void:
	label.text = text
	# Update sprite based on character
	await get_tree().create_timer(2).timeout # Dynamic based on length? Give characters speaking speeds? If you voice act this, you'll 100% need dynamic lengths
	# How do I make this timer reset if another dialogue is pushed?
	label.text = ''
	pass
