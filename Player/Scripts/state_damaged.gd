class_name State_Damaged extends State

@export var knockback_speed: float = 200
@export var decelerate_speed: float = 1.0
@export var invulnerable_duration: float = 0.5

var hit_box: HitBox
var direction: Vector2

var next_state: State = null

@onready var idle: State = $"../Idle"

# What happens when we initialize this state?
func init() -> void:
	player.player_damaged.connect(_player_damaged)

# What happens when the player enters this state?
func enter() -> void:
	player.update_animation("damaged")
	player.animation_player.animation_finished.connect(_animation_finished)

	direction = player.global_position.direction_to(hit_box.global_position)
	player.velocity = direction * -knockback_speed
	player.set_direction()

	player.make_invulnerable(invulnerable_duration)

# What happens when the player exits this state?
func exit() -> void:
	next_state = null
	player.animation_player.animation_finished.disconnect(_animation_finished)

# What happens during the _process update in this State?
func process(_delta: float) -> State:
	player.velocity -= player.velocity * decelerate_speed * _delta
	return next_state

# What happens during the _physics_process update in this State?
func physics(_delta: float) -> State:
	return null

# What happens with input events during this State?
func handle_input(_event: InputEvent) -> State:
	return null

func _player_damaged(_hit_box: HitBox) -> void:
	hit_box = _hit_box
	state_machine.change_state(self)

func _animation_finished(_a: String):
	next_state = idle
