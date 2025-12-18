extends Control

const DialogueData = preload("res://Interface/dialogue_data.gd")

@onready var label: Label = $Label
@onready var sprite: Sprite2D = $Sprite2D

@export var passive_timer_min: float = 60.0
@export var passive_timer_max: float = 600.0

var _caption_tween: Tween
var _current_text: String
var _current_character: String
var _dialogue_queue: Array = []
var _passive_timer: Timer
var conditions: Dictionary = {}

const PORTRAITS = {
	"Jailer One": preload("uid://ds2n42y8kn0y8"),
	"Jailer Two": preload("uid://36jojg0svt4n"),
}

func _ready():
	_setup_passive_timer()

func _setup_passive_timer() -> void:
	_passive_timer = Timer.new()
	_passive_timer.one_shot = true
	_passive_timer.timeout.connect(_on_passive_timer)
	add_child(_passive_timer)
	_restart_passive_timer()

func _restart_passive_timer() -> void:
	_passive_timer.start(randf_range(passive_timer_min, passive_timer_max))

func set_conditions(new_conditions: Dictionary) -> void:
	conditions = new_conditions

# There's an argument for just having this listen to signals and not manually update - Unsure which is more performant.
func _refresh_conditions() -> void:
	var new_conditions = {}
	if PlayerManager.player:
		var hp_percent = float(PlayerManager.player.hp) / float(PlayerManager.player.max_hp)
		new_conditions["low_hp"] = hp_percent < 0.3
	new_conditions["zone"] = ZoneManager.current_zone
	# Additional conditions go here. Flags?
	set_conditions(new_conditions)

func _on_passive_timer() -> void:
	_refresh_conditions()
	var matching = _get_matching_passive_scripts()
	if matching.size() > 0:
		var script = _weighted_pick(matching)
		_play_script(script)
	else:
		_restart_passive_timer()

func _get_matching_passive_scripts() -> Array:
	var matching = []
	for key in DialogueData.DIALOGUES:
		var scripts_array = DialogueData.DIALOGUES[key]
		for script in scripts_array:
			if not script.get("passive", false):
				continue
			if _conditions_match(script.get("conditions", {})):
				matching.append(script)
	return matching

func _conditions_match(required: Dictionary) -> bool:
	for key in required:
		if conditions.get(key) != required[key]:
			return false
	return true

func _weighted_pick(scripts: Array) -> Dictionary:
	var total_weight = 0
	for script in scripts:
		total_weight += script.get("chance", 1)

	var roll = randi_range(0, total_weight - 1)
	var cumulative = 0
	for script in scripts:
		cumulative += script.get("chance", 1)
		if roll < cumulative:
			return script

	return scripts[0]  # Fallback - Why do we need this? Can't we just have the math be right?

func play_dialogue(key: String) -> void:
	_refresh_conditions()

	var scripts_array = DialogueData.DIALOGUES.get(key)
	if not scripts_array:
		push_warning("Dialogue key not found: " + key)
		return

	# Filter to matching conditions
	var matching = []
	for script in scripts_array:
		if _conditions_match(script.get("conditions", {})):
			matching.append(script)

	if matching.size() == 0:
		_restart_passive_timer()
		return

	var selected = _weighted_pick(matching)
	_play_script(selected)

func _play_script(script: Dictionary) -> void:
	_restart_passive_timer()

	var lines = script.get("script", [])
	if lines.size() == 0:
		return

	_dialogue_queue = lines.duplicate()
	_play_next_line()

func _play_next_line() -> void:
	if _dialogue_queue.size() == 0:
		return

	var line = _dialogue_queue.pop_front()
	_render_caption(line.get("text", ""), line.get("character", "none"))

func _render_caption(text: String, character: String = "none") -> void:
	if _caption_tween:
		_caption_tween.kill()

	var content_changed = text != _current_text or character != _current_character
	_current_text = text
	_current_character = character

	label.text = text
	_assign_sprite(character)

	# I think I hate tweens - Look into getting rid of this eventually
	_caption_tween = create_tween()
	if content_changed:
		modulate.a = 0.0
		_caption_tween.tween_property(self, "modulate:a", 1.0, 0.1)
	_caption_tween.tween_interval(4.0)
	_caption_tween.tween_property(self, "modulate:a", 0.0, 0.1)
	_caption_tween.tween_callback(_on_caption_finished)

func _on_caption_finished() -> void:
	if _dialogue_queue.size() > 0:
		_play_next_line()
	else:
		_clear_caption()

func _clear_caption() -> void:
	label.text = ""
	sprite.texture = null
	_current_text = ""
	_current_character = ""

func _assign_sprite(character: String) -> void:
	sprite.texture = PORTRAITS.get(character)
