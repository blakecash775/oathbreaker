class_name EnemyStateIdle extends EnemyState

@export var anim_name: String = "idle"

@export_category("AI")
@export var state_duration_min: float = 1
@export var state_duration_max: float = 3
@export var next_state: EnemyState

var _timer: float
	
# What happens when we initialize this state?
func init()-> void:
	pass
	
# What happens when the enemy enters this state?
func enter() -> void:
	enemy.velocity = Vector2.ZERO
	_timer = randf_range(state_duration_min, state_duration_max)
	enemy.set_animation(anim_name)

# What happens when the enemy exits this state?
func exit() -> void:
	pass

# What happens during the _process update in this State?
func process(_delta: float) -> EnemyState:
	_timer -= _delta
	if _timer <= 0:
		return next_state
	return null

# What happens during the _physics_process update in this State?
func physics(_delta: float) -> EnemyState:
	return null
