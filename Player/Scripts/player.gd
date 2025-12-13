class_name Player extends CharacterBody2D

var cardinal_direction : Vector2 = Vector2.DOWN
var direction: Vector2 = Vector2.DOWN

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite: Sprite2D = $Sprite2D
@onready var state_machine: PlayerStateMachine= $StateMachine

func _ready() -> void:
	state_machine.Initialize(self)
	pass

func _process(_delta: float) -> void:
	direction = Vector2(
		Input.get_axis("left", "right"),
		Input.get_axis("up", "down")
	).normalized()

func _physics_process(_delta: float) -> void:
	move_and_slide()

func SetDirection() -> bool:
	var new_dir: Vector2 = cardinal_direction
	if direction == Vector2.ZERO:
		return false
	if direction.y == 0:
		new_dir = Vector2.LEFT if direction.x < 0 else Vector2.RIGHT
	elif direction.x == 0:
		new_dir = Vector2.UP if direction.y < 0 else Vector2.DOWN
		
	if new_dir == cardinal_direction:
		return false
	cardinal_direction = new_dir
	
	return true

func UpdateAnimation(state: String) -> void:
	
	# Bad workaround to have feedback for player attack, can remove when you add a real one
	if state == 'attack':
		animation_player.speed_scale = 200 # idk LOL
		pass
	# Bad workaround to have some feedback for walking, can remove when you add a real walk anim
	elif state == 'walk':
		animation_player.speed_scale = 3.5
	else:
		animation_player.speed_scale = 1
	
	animation_player.play('idle' + "_" + AnimDirection())
	
	pass
	
func AnimDirection() -> String:
	if cardinal_direction == Vector2.DOWN:
		return "down"
	elif cardinal_direction == Vector2.UP:
		return "up"
	elif cardinal_direction == Vector2.LEFT:
		return "left"
	else:
		return "right"
