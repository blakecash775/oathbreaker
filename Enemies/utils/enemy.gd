class_name Enemy extends Node2D
@onready var BaseNode: Enemy = $"."

var knockback: float = 0
var knockback_direction: Vector2 = Vector2.ZERO

func _ready():
	$Hurtbox.Damaged.connect(TakeDamage)

func _physics_process(_delta: float) -> void:
	BaseNode.velocity = knockback_direction * knockback
	BaseNode.move_and_slide()
	if knockback > 0:
		knockback = knockback - randf_range(0.01, 2)

func TakeDamage(_damage: int, source_position: Vector2):
	knockback_direction = (global_position - source_position).normalized()
	knockback = knockback + 100 # Base on damage, or some knockback mult based on attack
	BaseNode.move_and_slide()
