@tool
class_name WeaponPickup extends Node

@export var weapon_data: WeaponData: set = _set_weapon_data

@onready var area_2d: Area2D = $Area2D
@onready var sprite_2d: Sprite2D = $Sprite2D

func _ready() -> void:
	_update_texture()
	if Engine.is_editor_hint():
		return
	area_2d.body_entered.connect(_on_body_entered)

func _on_body_entered(b) -> void:
	if b is Player:
		if weapon_data:
			if PlayerManager.INVENTORY_DATA.add_weapon(weapon_data) == true:
				weapon_picked_up()
	pass

func weapon_picked_up() -> void:
	area_2d.body_entered.disconnect(_on_body_entered)
	queue_free()
	pass

func _set_weapon_data(value: WeaponData) -> void:
	weapon_data = value
	_update_texture()

func _update_texture() -> void:
	if weapon_data and sprite_2d:
		sprite_2d.texture = weapon_data.texture
	pass
