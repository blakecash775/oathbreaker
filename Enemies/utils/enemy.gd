class_name Enemy extends Node2D
@onready var BaseNode: Enemy = $"."

var knockback: int = 0

func _ready():
	$Hurtbox.Damaged.connect(TakeDamage)
	pass
	
func _physics_process(_delta: float) -> void:
	BaseNode.velocity = (Vector2.UP * knockback)
	BaseNode.move_and_slide()
	if knockback > 0:
		knockback = knockback - randf_range(0.1, 2);

func TakeDamage(damage: int):
	# You'll eventually want to make this conditional on some sort of HP
	# Take knockback
	knockback = knockback + 200
	BaseNode.move_and_slide()
	
	# queue_free()
	pass
