class_name State_Attack extends State

var attacking : bool = false

@onready var idle: State = $"../Idle"
@onready var walk: State = $"../Walk"
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"


## What happens when the player enters this state?
func Enter() -> void:
	player.UpdateAnimation("attack")
	attacking = true
	# Bad substitute for no attack animation, use the commented code under it once you have a real one 
	await get_tree().create_timer(0.2).timeout
	EndAttack()
	# animation_player.animation_finished.connect(EndAttack)
	pass

# What happens when the player exits this state?
func Exit() -> void:
	pass

# What happens during the _process update in this State?
func Process(_delta: float) -> State:
	if attacking == false:
		if player.direction == Vector2.ZERO:
			return idle
		else:
			return walk
	return null

# What happens during the _physics_process update in this State?
func Physics(_delta: float) -> State:
	
	return null

# What happens with input events during this State?
func HandleInput(_event: InputEvent) -> State:
	return null

func EndAttack() -> void:
	attacking = false
