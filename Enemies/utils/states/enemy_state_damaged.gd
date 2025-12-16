class_name EnemyStateDamaged extends EnemyState

@export var anim_name: String = "damaged"
@export var knockback_speed: float = 200.0
@export var decelerate_speed: float = 10.0

@export_category("AI")
@export var next_state: EnemyState

var _direction: Vector2
var _animation_finished: bool
	
# What happens when we initialize this state?
func init()-> void:
	enemy.enemy_damaged.connect(_on_enemy_damaged)
	pass
	
# What happens when the enemy enters this state?
func Enter() -> void:
	_animation_finished = false
	
	_direction = enemy.global_position.direction_to(PlayerManager.player.global_position) # This knockback should be from the hitbox eventually, not the player's position, so you can knock back away from explosions and such
	
	enemy.velocity = _direction * -knockback_speed
	enemy.set_direction(_direction)
	enemy.set_animation(anim_name) # Animation only plays if it's fully finished - What to do when multiple attacks occur before animation ends?
	
	enemy.animation_player.animation_finished.connect(_on_animation_finished)
	pass

# What happens when the enemy exits this state?
func Exit() -> void:
	enemy.animation_player.animation_finished.disconnect(_on_animation_finished)
	pass

# What happens during the _process update in this State?
func Process(_delta: float) -> EnemyState:
	if _animation_finished == true: # Animation should eventually be based on stun, not the other way around 
		return next_state
	enemy.velocity -= enemy.velocity * decelerate_speed * _delta
	return null

# What happens during the _physics_process update in this State?
func Physics(_delta: float) -> EnemyState:
	return null
	
func _on_enemy_damaged() -> void:
	state_machine.change_state(self)

func _on_animation_finished(_a: String) -> void:
	_animation_finished = true
