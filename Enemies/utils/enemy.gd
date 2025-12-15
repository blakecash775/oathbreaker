class_name Enemy extends CharacterBody2D

signal direction_changed(new_direction: Vector2)
signal enemy_damaged()

const DIR_4 = [Vector2.RIGHT, Vector2.DOWN, Vector2.LEFT, Vector2.UP] # If we want to support diagonals (We do) this will need an update.

@export var hp: int = 1

var cardinal_direction: Vector2 = Vector2.DOWN
var direction: Vector2 = Vector2.ZERO
var knockback_direction: Vector2 = Vector2.ZERO
var player: Player

@onready var state_machine: EnemyStateMachine = $EnemyStateMachine

func _ready():
	state_machine.initialize(self)
	player = PlayerManager.player
	$Hurtbox.Damaged.connect(TakeDamage)

func _physics_process(_delta: float) -> void:
	move_and_slide()

func set_direction(_new_direction: Vector2) -> bool:
	direction = _new_direction

	if direction == Vector2.ZERO:
		return false
	
	var direction_id: int = int(round(
		(direction + cardinal_direction * 0.1).angle() 
		/ TAU * DIR_4.size()
	))
	var new_dir = DIR_4[direction_id]
	
	if new_dir == cardinal_direction: 
		return false
	
	cardinal_direction = new_dir
	direction_changed.emit(new_dir)
	return true

func TakeDamage(_damage: int):
	pass
