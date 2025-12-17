extends Node2D

@export var enemy_scene: PackedScene
@export var respawn_delay_min: float = 3.0
@export var respawn_delay_max: float = 8.0

var current_enemy: Enemy


func _ready() -> void:
	visible = false
	_spawn_enemy()


func _spawn_enemy() -> void:
	if enemy_scene == null:
		return
	current_enemy = enemy_scene.instantiate()
	get_parent().add_child.call_deferred(current_enemy)
	current_enemy.global_position = global_position
	current_enemy.enemy_dying.connect(_on_enemy_dying)


func _on_enemy_dying(_hitbox: HitBox) -> void:
	var delay = randf_range(respawn_delay_min, respawn_delay_max)
	await get_tree().create_timer(delay).timeout
	_spawn_enemy()
