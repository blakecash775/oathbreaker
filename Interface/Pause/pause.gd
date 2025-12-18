extends CanvasLayer

signal shown
signal hidden

var is_paused: bool = false

@onready var item_flavor_text: Label = $Control/ItemFlavorText

func _ready() -> void:
	hide_pause()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		if is_paused == false:
			show_pause()
		else:
			hide_pause()
		get_viewport().set_input_as_handled()

func show_pause() -> void:
	get_tree().paused = true
	visible = true
	is_paused = true
	shown.emit()

func hide_pause() -> void:
	get_tree().paused = false
	visible = false
	is_paused = false
	hidden.emit()

func update_item_flavor_text(new_text: String) -> void:
	item_flavor_text.text = new_text
