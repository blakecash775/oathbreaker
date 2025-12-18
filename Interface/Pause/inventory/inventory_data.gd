class_name InventoryData extends Resource

@export var slots: Array[SlotData]

func add_item(item: ItemData) -> bool: # quantity https://www.youtube.com/watch?v=pNArNH9G42A&list=PLfcCiyd_V9GH8M9xd_QKlyU8jryGcy3Xa&index=17
	for i in slots.size():
		if slots[i] == null:
				var new = SlotData.new()
				new.item_data = item
				slots[i] = new
				return true

	return false

func clear_entire_inventory() -> void:
	for i in slots.size():
		slots[i] = null
