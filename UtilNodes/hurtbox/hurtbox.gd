class_name HurtBox extends Area2D

signal Damaged(hit_box: HitBox)

func TakeDamage(hit_box: HitBox) -> void:
	Damaged.emit(hit_box)
