class_name InventoryUI extends Control

const Inventory_SLOT = preload("uid://bl7peno2ciktr")

@export var data: InventoryData

func _ready() -> void:
	Pause.shown.connect(update_inventory)
	Pause.hidden.connect(clear_inventory) # more performant to do this in background always or only on press?
	pass

func clear_inventory() -> void:
	for c in get_children():
		c.queue_free()

func update_inventory() -> void:
	for s in data.slots:
		var new_slot = Inventory_SLOT.instantiate()
		add_child(new_slot)
		new_slot.slot_data = s
		
		get_child(0).grab_focus() #Idk what this does
