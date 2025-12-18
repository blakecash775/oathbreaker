class_name Enemy extends CharacterBody2D

signal direction_changed(new_direction: Vector2)
signal enemy_damaged()
signal enemy_dying()

const DIR_4 = [Vector2.RIGHT, Vector2.DOWN, Vector2.LEFT, Vector2.UP] # If we want to support diagonals (We do) this will need an update.

@export var hp: int = 1

var cardinal_direction: Vector2 = Vector2.DOWN
var direction: Vector2 = Vector2.ZERO
var knockback_direction: Vector2 = Vector2.ZERO
var player: Player

@onready var state_machine: EnemyStateMachine = $EnemyStateMachine
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var hurtbox: HurtBox = $Hurtbox

func _ready():
	state_machine.initialize(self)
	player = PlayerManager.player
	hurtbox.damaged.connect(_take_damage)

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

func set_animation(animation: String)-> void:
	if animation == 'idle':
		animation_player.stop(true) # true = keep_state, preserves modulate instead of resetting
		return
	animation_player.play(animation) # Once enemies can turn, this will need to be state + "_" + anim_direction(), https://www.youtube.com/watch?v=OiOIr1ZApzk 19:41

func _take_damage(hit_box: HitBox) -> void:
	hp -= hit_box.damage
	if hp > 0:
		enemy_damaged.emit(hit_box)
	else:
		enemy_dying.emit(hit_box)
