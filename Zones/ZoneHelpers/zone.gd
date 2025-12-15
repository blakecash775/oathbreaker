class_name Zone extends Node2D

func _ready() -> void:
	self.y_sort_enabled = true
	PlayerManager.set_as_parent(self)
	ZoneManager.zone_load_started.connect(_free_zone)

func _free_zone() -> void:
	PlayerManager.unparent_player(self)
	queue_free()
