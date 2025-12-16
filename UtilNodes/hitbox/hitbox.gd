class_name HitBox extends Area2D

@export var damage: int = 1

func _ready():
	area_entered.connect(_area_entered)

func _area_entered(a: Area2D) -> void:
	if a is HurtBox:
		a.take_damage(self)
