class_name HudClass extends CanvasLayer

@onready var dialogue_box: Control = $DialogueBox
@onready var hp_rect: ColorRect = $Control/ColorRect

@export var hp_bar_default_length = 160

signal show_dialogue(dialogue_key: String)

func _ready():
	show_dialogue.connect(dialogue_box.play_dialogue)

func update_hp_display(player_hp: int, player_max_hp: int) -> void:
	var hp_percent = float(player_hp) / float(player_max_hp)
	hp_rect.size = Vector2(hp_bar_default_length * hp_percent, hp_rect.size.y)
