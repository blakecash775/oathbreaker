class_name State_Idle extends State

@onready var walk: State = $"../Walk"
@onready var attack: State = $"../Attack"


# What happens when we initialize this state?
func init() -> void:
	pass

# What happens when the player enters this state?
func enter() -> void:
	player.update_animation("idle")

# What happens when the player exits this state?
func exit() -> void:
	pass

# What happens during the _process update in this State?
func process(_delta: float) -> State:
	if player.direction != Vector2.ZERO:
		return walk
	player.velocity = Vector2.ZERO

	# Track mouse cursor while idle
	if player.set_direction():
		player.update_animation("idle")

	return null

# What happens during the _physics_process update in this State?
func physics(_delta: float) -> State:
	return null

# What happens with input events during this State?
func handle_input(_event: InputEvent) -> State:
	if _event.is_action_pressed("attack"):
		return attack
	return null
