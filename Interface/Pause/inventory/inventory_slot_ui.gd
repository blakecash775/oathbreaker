class_name InventorySlotUI extends Button

var slot_data: SlotData: set = set_slot_data

@onready var texture_rect: TextureRect = $TextureRect

func _ready() -> void:
	texture_rect.texture = null
	focus_entered.connect(item_focused)
	focus_exited.connect(item_unfocused)

func set_slot_data(value: SlotData) -> void:
	slot_data = value
	if slot_data == null:
		return
	texture_rect.texture = slot_data.item_data.texture

func item_focused() -> void:
	if slot_data != null:
		if slot_data.item_data != null:
			Pause.update_item_flavor_text(slot_data.item_data.flavor_text)
	pass

func item_unfocused() -> void:
	Pause.update_item_flavor_text('')
	pass
