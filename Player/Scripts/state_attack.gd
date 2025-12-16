class_name State_Attack extends State

var attacking : bool = false

@onready var idle: State = $"../Idle"
@onready var walk: State = $"../Walk"
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var hitbox: HitBox = $"../../Interactions/Hitbox"


## What happens when the player enters this state?
func Enter() -> void:
	player.UpdateAnimation("attack")
	attacking = true
	hitbox.monitoring = true
	# Bad substitute for no attack animation, use the commented code under it once you have a real one 
	await get_tree().create_timer(0.2).timeout
	EndAttack() # I'm not sure there's any cooldown on attacking right now, despite the animation playing
	# animation_player.animation_finished.connect(EndAttack)
	pass

# What happens when the player exits this state?
func Exit() -> void:
	# animation_player.animation_finished.disconnect(EndAttack)
	attacking = false
	hitbox.monitoring = false
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
