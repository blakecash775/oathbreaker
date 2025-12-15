class_name HurtBox extends Area2D

signal Damaged(damage: int)

func TakeDamage(damage: int) -> void:
	Damaged.emit(damage)
