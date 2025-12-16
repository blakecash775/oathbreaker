class_name State extends Node

static var player: Player
static var state_machine: PlayerStateMachine

func _ready():
	pass

# What happens when we initialize this state?
func init() -> void:
	pass

# What happens when the player enters this state?
func Enter() -> void:
	pass

# What happens when the player exits this state?
func Exit() -> void:
	pass

# What happens during the _process update in this State?
func Process(_delta: float) -> State:
	return null

# What happens during the _physics_process update in this State?
func Physics(_delta: float) -> State:
	return null

# What happens with input events during this State?
func HandleInput(_event: InputEvent) -> State:
	return null
