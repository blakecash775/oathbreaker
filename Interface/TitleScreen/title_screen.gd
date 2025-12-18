extends Node

const STARTING_ZONE: String = "res://Zones/prison.tscn"

@onready var start_button: Button = $Control/VBoxContainer/StartButton

func _ready() -> void:
	start_button.pressed.connect(start_game)

func start_game() -> void:
	ZoneManager.load_new_zone(STARTING_ZONE, '', Vector2.ZERO)
