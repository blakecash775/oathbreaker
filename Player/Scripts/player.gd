class_name Player extends CharacterBody2D

var cardinal_direction : Vector2 = Vector2.DOWN
var direction: Vector2 = Vector2.ZERO  # Movement input (WASD)
var aim_direction: Vector2 = Vector2.DOWN  # Direction toward mouse cursor
# All tween stuff here is to substitute for missing animations, you can get rid of it when you add a real animation
var _placeholder_tween: Tween

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite: Sprite2D = $Sprite2D
@onready var state_machine: PlayerStateMachine= $StateMachine
@onready var walk: State_Walk = $StateMachine/Walk
@onready var hurtbox: HurtBox = $Hurtbox

signal direction_changed(new_direction: Vector2)
signal player_damaged(hurt_box: HurtBox)

var invulnerable: bool = false
var hp: int = 6 #export?
var max_hp: int = 6

func _ready() -> void:
	PlayerManager.player = self
	state_machine.initialize(self)
	hurtbox.damaged.connect(_take_damage)
	update_hp(max_hp) # Every time he gets made he gets full hp, maybe change?

func _process(_delta: float) -> void:
	direction = Vector2(
		Input.get_axis("left", "right"),
		Input.get_axis("up", "down")
	).normalized()

	# Calculate aim direction from player to mouse cursor
	var mouse_pos = get_global_mouse_position()
	var aim_vec = mouse_pos - global_position
	if aim_vec.length() > 0:
		aim_direction = aim_vec.normalized()

func _physics_process(_delta: float) -> void:
	move_and_slide()

func set_direction() -> bool:
	# Update cardinal direction based on aim (mouse) direction
	var new_dir: Vector2 = cardinal_direction

	# Determine cardinal direction from aim - prioritize horizontal/vertical based on which is larger
	if abs(aim_direction.x) > abs(aim_direction.y):
		new_dir = Vector2.LEFT if aim_direction.x < 0 else Vector2.RIGHT
	else:
		new_dir = Vector2.UP if aim_direction.y < 0 else Vector2.DOWN

	if new_dir == cardinal_direction:
		return false
	cardinal_direction = new_dir

	direction_changed.emit(new_dir)

	return true

func update_animation(state: String) -> void:
	# Kill any existing placeholder tween and reset sprite
	if _placeholder_tween:
		_placeholder_tween.kill()
	sprite.position = Vector2.ZERO

	# Placeholder for attack and walk, replace with real animations
	if state == 'attack':
		# Lunge toward facing direction, then snap back
		_placeholder_tween = create_tween()
		_placeholder_tween.tween_property(sprite, "position", cardinal_direction * 8, 0.1)
		_placeholder_tween.tween_property(sprite, "position", Vector2.ZERO, 0.1)
		animation_player.play("idle" + "_" + anim_direction())
	elif state == 'walk':
		animation_player.speed_scale = 4 + (walk.move_speed / 100)
		animation_player.play("idle" + "_" + anim_direction())
	else:
		animation_player.play(state + "_" + anim_direction())
		animation_player.speed_scale = 1


	
func anim_direction() -> String:
	if cardinal_direction == Vector2.DOWN:
		return "down"
	elif cardinal_direction == Vector2.UP:
		return "up"
	elif cardinal_direction == Vector2.LEFT:
		return "left"
	else:
		return "right"

func _take_damage(hit_box: HitBox) -> void:
	if invulnerable == true:
		return
	update_hp(-hit_box.damage)
	
	if hp > 0:
		player_damaged.emit(hit_box)
	else:
		# Really Temp Placeholder - Add Real Death Handling Function - He slides after too
		player_damaged.emit(hit_box)
		Hud.show_dialogue.emit("player_death")
		PlayerManager.player_spawned = false
		ZoneManager.load_new_zone('res://Zones/prison.tscn', '', Vector2(0,0))
		update_hp(max_hp)

func update_hp(delta: int) -> void:
	hp = clampi(hp + delta, 0, max_hp)
	Hud.update_hp_display(hp, max_hp)

func make_invulnerable(_duration: float = 0.5) -> void:
	invulnerable = true
	hurtbox.monitoring = false
	
	await get_tree().create_timer(_duration).timeout
	
	invulnerable = false
	hurtbox.monitoring = true
