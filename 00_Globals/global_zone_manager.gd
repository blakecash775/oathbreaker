extends Node

signal zone_load_started
signal zone_loaded

var target_transition: String
var position_offset: Vector2

func load_new_zone(
	level_path: String,
	_target_transition: String,
	_position_offset: Vector2
) -> void:
	
	get_tree().paused = true
	target_transition = _target_transition
	position_offset = _position_offset
	
	await Scenetransition.fade_out()
	
	zone_load_started.emit()
	
	await get_tree().process_frame
	get_tree().change_scene_to_file(level_path)

	Scenetransition.fade_in()
	get_tree().paused = false
	
	await get_tree().process_frame
	zone_loaded.emit()
	
	Hud.show_caption.emit("Look at him, trying to put it all back together.", "Jailer One") # This needs to be handled somewhere else eventually
