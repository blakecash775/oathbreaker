class_name EnemyStateDying extends EnemyState

@export var anim_name: String = "dying"
@export var knockback_speed: float = 200.0
@export var decelerate_speed: float = 10.0

var _direction: Vector2
	
# What happens when we initialize this state?
func init()-> void:
	enemy.enemy_dying.connect(_on_enemy_dying)
	pass
	
# What happens when the enemy enters this state?
func Enter() -> void:
	
	_direction = enemy.global_position.direction_to(PlayerManager.player.global_position) # This knockback should be from the hitbox eventually, not the player's position, so you can knock back away from explosions and such
	
	enemy.velocity = _direction * -knockback_speed
	enemy.set_direction(_direction)
	enemy.set_animation(anim_name)
	
	enemy.animation_player.animation_finished.connect(_on_animation_finished)
	pass

# What happens when the enemy exits this state?
func Exit() -> void:
	pass

# What happens during the _process update in this State?
func Process(_delta: float) -> EnemyState:
	enemy.velocity -= enemy.velocity * decelerate_speed * _delta
	return null

# What happens during the _physics_process update in this State?
func Physics(_delta: float) -> EnemyState:
	return null
	
func _on_enemy_dying() -> void:
	state_machine.change_state(self)

func _on_animation_finished(_a: String) -> void:
	enemy.queue_free()
