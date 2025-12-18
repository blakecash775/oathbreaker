class_name weapon_data extends Resource

@export var name: String = ""
@export_multiline var flavor_text: String = ""
@export var texture: Texture2D
@export var abilities: Array[ability_data] = [] # PLACEHOLDER
@export var style: String = "" # PLACEHOLDER
@export var speed: String = "" # PLACEHOLDER
@export var base_damage: String = "" # PLACEHOLDER
@export var passives: String = "" # PLACEHOLDER - Passives system unsupported

# Variable range (Spear vs Sword vs Bow) and hitbox types (Size, disjoint, projectile) need to be supported as you add to this
