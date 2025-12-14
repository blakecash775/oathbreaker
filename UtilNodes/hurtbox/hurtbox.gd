class_name HurtBox extends Area2D

signal Damaged(damage: int, source_position: Vector2)

func TakeDamage(damage: int, source_position: Vector2) -> void:
	Damaged.emit(damage, source_position)
