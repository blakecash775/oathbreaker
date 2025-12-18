class_name InventoryData extends Resource

@export var slots: Array[SlotData]

func add_weapon(item: WeaponData) -> bool: #Itemdata, quantity https://www.youtube.com/watch?v=pNArNH9G42A&list=PLfcCiyd_V9GH8M9xd_QKlyU8jryGcy3Xa&index=17
	for i in slots.size():
		if slots[i] == null: #this is extensible for full inventory, but for now we just have one item
				var new = SlotData.new()
				new.weapon_data = item
				slots[i] = new
				return true
	
	return false
