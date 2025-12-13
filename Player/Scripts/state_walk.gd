class_name State_Walk extends State

# Possibly move these out to more robust speed controller for combat
@export var move_speed: float = 100.0
@export var acceleration: float = 0.1
@export var max_speed: float = 300.0

@onready var idle: State = $"../Idle"
@onready var attack: State = $"../Attack"

## What happens when the player enters this state?
func Enter() -> void:
	player.UpdateAnimation("walk")
	pass

# What happens when the player exits this state?
func Exit() -> void:
	pass

# What happens during the _process update in this State?
func Process(_delta: float) -> State:
	if player.direction == Vector2.ZERO:
		move_speed = 100
		return idle
		
	if move_speed < max_speed:
		move_speed = move_speed + acceleration
	
	player.velocity = player.direction * move_speed

	if player.SetDirection():
		player.UpdateAnimation("walk")
	
	return null

# What happens during the _physics_process update in this State?
func Physics(_delta: float) -> State:
	return null

# What happens with input events during this State?
func HandleInput(_event: InputEvent) -> State:
	if _event.is_action_pressed("attack"):
		return attack
	return null
