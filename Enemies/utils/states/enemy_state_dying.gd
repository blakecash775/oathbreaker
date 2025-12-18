class_name EnemyStateDying extends EnemyState

@export var anim_name: String = "dying"
@export var knockback_speed: float = 500.0
@export var decelerate_speed: float = 5.0

var _damage_position: Vector2
var _direction: Vector2
	
# What happens when we initialize this state?
func init()-> void:
	enemy.enemy_dying.connect(_on_enemy_dying)
	
# What happens when the enemy enters this state?
func enter() -> void:
	_direction = enemy.global_position.direction_to(_damage_position)

	enemy.velocity = _direction * -knockback_speed
	enemy.set_direction(_direction)
	enemy.set_animation(anim_name)

	enemy.animation_player.animation_finished.connect(_on_animation_finished)

# What happens when the enemy exits this state?
func exit() -> void:
	enemy.animation_player.animation_finished.disconnect(_on_animation_finished)

# What happens during the _process update in this State?
func process(_delta: float) -> EnemyState:
	enemy.velocity -= enemy.velocity * decelerate_speed * _delta
	return null

# What happens during the _physics_process update in this State?
func physics(_delta: float) -> EnemyState:
	return null
	
func _on_enemy_dying(hit_box: HitBox) -> void:
	_damage_position = hit_box.global_position
	state_machine.change_state(self)

func _on_animation_finished(_a: String) -> void:
	enemy.queue_free()
