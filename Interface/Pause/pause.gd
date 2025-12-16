extends CanvasLayer

var is_paused: bool = false

func _ready() -> void:
	hide_pause()
	pass

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

func hide_pause() -> void:
	get_tree().paused = false
	visible = false
	is_paused = false
