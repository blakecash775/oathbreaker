@tool
class_name ZoneTransition extends Area2D

enum SIDE {LEFT, RIGHT, TOP, BOTTOM}

@export_file("*.tscn") var zone
@export var target_transition_area: String = "LevelTransition"

@export_category("Collision Area Settings")

@export_range(1, 12, 1, "or_greater") var size: int = 2:
	set(_v):
		size = _v
		_update_area()

@export var side: SIDE = SIDE.LEFT:
	set(_v):
		side = _v
		_update_area()

@onready var collision_shape: CollisionShape2D = $CollisionShape2D

func _ready() -> void:
	_update_area()
	if Engine.is_editor_hint():
		return
		
	# monitoring = false
	
	body_entered.connect( _player_entered)
	
	
func _player_entered(_p: Node2D) -> void:
	ZoneManager.load_new_zone(zone, target_transition_area, Vector2.ZERO)
	

func _update_area() -> void:
	var new_rect: Vector2 = Vector2(32, 32) # Need to change if I change tile size
	var new_position: Vector2 = Vector2.ZERO

	if side == SIDE.TOP:
		new_rect.x *= size
		new_position.y -= 16
	elif side == SIDE.BOTTOM:
		new_rect.x *= size
		new_position.y += 16
	elif side == SIDE.LEFT:
		new_rect.y *= size
		new_position.x -= 16
	elif side == SIDE.RIGHT:
		new_rect.y *= size
		new_position.x += 16

	if collision_shape == null:
		collision_shape = get_node("CollisionShape2D")

	if not collision_shape.shape.is_local_to_scene():
		collision_shape.shape = collision_shape.shape.duplicate()
	collision_shape.shape.size = new_rect
	collision_shape.position = new_position
