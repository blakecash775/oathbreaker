class_name State_Idle extends State

@onready var walk: State = $"../Walk"
@onready var attack: State = $"../Attack"


## What happens when the player enters this state?
func Enter() -> void:
	player.UpdateAnimation("idle")
	pass

# What happens when the player exits this state?
func Exit() -> void:
	pass

# What happens during the _process update in this State?
func Process(_delta: float) -> State:
	if player.direction != Vector2.ZERO:
		return walk
	player.velocity = Vector2.ZERO

	# Track mouse cursor while idle
	if player.SetDirection():
		player.UpdateAnimation("idle")

	return null

# What happens during the _physics_process update in this State?
func Physics(_delta: float) -> State:
	return null

# What happens with input events during this State?
func HandleInput(_event: InputEvent) -> State:
	if _event.is_action_pressed("attack"):
		return attack
	return null
