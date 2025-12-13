class_name Dummy extends Node2D

func _ready():
	$Hurtbox.Damaged.connect(TakeDamage)
	pass

func TakeDamage(_damage: int):
	# You'll eventually want to make this conditional on some sort of HP
	queue_free()
	pass
