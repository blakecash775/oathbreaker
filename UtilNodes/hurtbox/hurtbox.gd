class_name HurtBox extends Area2D

signal damaged(hit_box: HitBox)

func take_damage(hit_box: HitBox) -> void:
	damaged.emit(hit_box)
