extends Node

# Convert to resource for saving/loading?
var flags: Dictionary = {}

func set_flag(key: StringName, value: Variant = true) -> void: # Use String if this gets confusing
	flags[key] = value

func get_flag(key: StringName, default: Variant = false) -> Variant:
	return flags.get(key, default)

func has_flag(key: StringName) -> bool:
	return flags.has(key) # I don't know if this valuable, may be fine to cut
	
func clear_flag(key: StringName) -> void:
	flags.erase(key)
