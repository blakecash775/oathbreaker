class_name HitBox extends Area2D

@export var damage: int = 1

func _ready():
	area_entered.connect(AreaEntered)

func AreaEntered(a: Area2D) -> void:
	if a is HurtBox:
		print('Yes')
		a.TakeDamage(damage)
