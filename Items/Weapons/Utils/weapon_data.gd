class_name WeaponData extends ItemData

@export var abilities: Array[AbilityData] = [] # PLACEHOLDER - Max 2, 2 Handed if it has 2, 1 handed if it has 1
@export var style: String = "" # PLACEHOLDER - Implement Style Enum Later
@export var speed: int = 1 # PLACEHOLDER - Change to float?
@export var base_damage: int = 1 # PLACEHOLDER - Change to float?
@export var passives: String = "" # PLACEHOLDER - Passives system unsupported, later is an enum

# Variable range (Spear vs Sword vs Bow) and hitbox types (Size, disjoint, projectile) need to be supported as you add to this
# Eventually we'll want to support non-weapon equipment, probably just change this over giving it a new data script (Maybe just amulet, or something?)
