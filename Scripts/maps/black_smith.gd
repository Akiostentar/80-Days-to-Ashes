extends Control

@onready var Box: Panel = $Panel
@onready var Money: Label = $Money
@onready var Notif: Label = $Notif
@onready var Choice: GridContainer = $Choice
@onready var Weapons: GridContainer = $Weapons
@onready var Armor: GridContainer = $Armors
@onready var back: Button = $bck2ch
@onready var Amount: SpinBox = $Panel/Amount
@onready var item_name: Label = $"Panel/Item Name"
@onready var item_desc: Label = $"Panel/Item Desc"
@onready var item_price: Label = $"Panel/Item Price"
@onready var item_pic: TextureRect = $"Panel/Picture"
@onready var sell: HBoxContainer = $ScrollContainer/Sell
@onready var sure: Label = $Panel2/Details
@onready var SellCon: Panel = $Panel2

var price = 0

func _ready() -> void:
	upd_money()
	upd_sell()

func upd_money() -> void:
	if MainMenu.GS == 1:
		Money.text = str(Save1["growth"]["money"])
	if MainMenu.GS == 2:
		Money.text = str(Save2["growth"]["money"])
	if MainMenu.GS == 3:
		Money.text = str(Save3["growth"]["money"])

#------------------------------------------------

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("uid://c07yycqhh86kk")
func _on_weapon_pressed() -> void:
	Choice.visible = false
	Weapons.visible = true
	back.visible = true
func _on_armor_pressed() -> void:
	Choice.visible = false
	Armor.visible = true
	back.visible = true
func _on_bck_2_ch_pressed() -> void:
	Choice.visible = true
	Armor.visible = false
	Weapons.visible = false
	back.visible = false
func _on_W1_pressed() -> void:
	var texture = preload("uid://dm47f72q5wi5i")
	Box.visible = true
	item_name.text = StaticData.ItemDataBase["Weapons"]["sword1"]["item_name"]
	item_desc.text = StaticData.ItemDataBase["Weapons"]["sword1"]["item_desc"]
	price = StaticData.ItemDataBase["Weapons"]["sword1"]["item_price"]
	item_price.text = str(price)
	item_pic.texture = texture
func _on_W2_pressed() -> void:
	var texture = preload("uid://dm47f72q5wi5i")
	Box.visible = true
	item_name.text = StaticData.ItemDataBase["Weapons"]["dagger1"]["item_name"]
	item_desc.text = StaticData.ItemDataBase["Weapons"]["dagger1"]["item_desc"]
	price = StaticData.ItemDataBase["Weapons"]["dagger1"]["item_price"]
	item_price.text = str(price)
	item_pic.texture = texture
func _on_W3_pressed() -> void:
	var texture = preload("uid://dm47f72q5wi5i")
	Box.visible = true
	item_name.text = StaticData.ItemDataBase["Weapons"]["bataxe1"]["item_name"]
	item_desc.text = StaticData.ItemDataBase["Weapons"]["bataxe1"]["item_desc"]
	price = StaticData.ItemDataBase["Weapons"]["bataxe1"]["item_price"]
	item_price.text = str(price)
	item_pic.texture = texture
func _on_A1_pressed() -> void:
	var texture = preload("uid://dm47f72q5wi5i")
	Box.visible = true
	item_name.text = StaticData.ItemDataBase["Armor"]["shield1"]["item_name"]
	item_desc.text = StaticData.ItemDataBase["Armor"]["shield1"]["item_desc"]
	price = StaticData.ItemDataBase["Armor"]["shield1"]["item_price"]
	item_price.text = str(price)
	item_pic.texture = texture	
func _on_A2_pressed() -> void:
	var texture = preload("uid://dm47f72q5wi5i")
	Box.visible = true
	item_name.text = StaticData.ItemDataBase["Armor"]["armor1"]["item_name"]
	item_desc.text = StaticData.ItemDataBase["Armor"]["armor1"]["item_desc"]
	price = StaticData.ItemDataBase["Armor"]["armor1"]["item_price"]
	item_price.text = str(price)
	item_pic.texture = texture
func _on_cancel_pressed() -> void:
	Box.visible = false
func _on_amount_value_changed(value: float) -> void:
	var amt = int(Amount.value)
	var calc = price * amt
	item_price.text = str(calc)
func _on_buy_pressed() -> void:
	if MainMenu.GS == 1:
		if Save1.growth["money"] >= int(item_price.text):
			for i in range(int(Amount.value)):
				Save1.growth["money"] -= price
				Save1.inventory.append(item_name.text)
			Notif.text = str(Amount.value) + " " + str(item_name.text) + " successfully purchased"
			upd_money()
			upd_sell()
			await get_tree().create_timer(1.0).timeout
			Notif.text = ""
			Box.visible = false
		else:
			Notif.text = "not enough money"
			await get_tree().create_timer(1).timeout
			Notif.text = ""
			Box.visible = false
	elif MainMenu.GS == 2:
		if Save2.growth["money"] >= int(item_price.text):
			for i in range(Amount):
				Save2.growth["money"] -= price
				Save2.inventory.append(item_name.text)
			Notif.text = str(Amount.value) + " " + str(item_name.text) + " successfully purchased"
			upd_money()
			upd_sell()
			await get_tree().create_timer(1.0).timeout
			Notif.text = ""
			Box.visible = false
		else:
			Notif.text = "not enough money"
			await get_tree().create_timer(1).timeout
			Notif.text = ""
			Box.visible = false
	else:
		if Save3.growth["money"] >= int(item_price.text):
			for i in range(Amount.value):
				Save3.growth["money"] -= price
				Save3.inventory.append(item_name.text)
			Notif.text = str(Amount) + " " + str(item_name.text) + " successfully purchased"
			upd_money()
			upd_sell()
			await get_tree().create_timer(1.0).timeout
			Notif.text = ""
			Box.visible = false
		else:
			Notif.text = "not enough money"
			await get_tree().create_timer(1).timeout
			Notif.text = ""
			Box.visible = false

#---------------------------------------------------

func upd_sell() -> void:
	for child in sell.get_children():
		child.queue_free()
	for item in Save1.inventory:
		var button = Button.new()
		button.text = item
		button.size_flags_vertical = Control.SIZE_EXPAND_FILL
		button.pressed.connect(_on_bs_pressed.bind(button))
		sell.add_child(button)

func get_value(data: Dictionary, target_name: String):
	for category in data:
		var items = data[category]
		for item_id in items:
			if items[item_id].get("item_name") == target_name:
				return item_id
	return null
func get_category(data: Dictionary, target_id: String):
	for category in data:
		var items = data[category]
		if items.has(target_id):
			return category
	return null

var on_yes_pressed: Callable
var on_no_pressed: Callable

func _on_bs_pressed(btn: Button):
	var item = btn.text
	var itemID = get_value(StaticData.ItemDataBase, item)
	var itemcat = get_category(StaticData.ItemDataBase, str(itemID))
	var cashback = 0
	if not itemcat == "Misc":
		cashback = StaticData.ItemDataBase[itemcat][itemID]["item_price"]*0.7
	else:
		cashback = StaticData.ItemDataBase[itemcat][itemID]["item_price"]*0.5
	
	sure.text = item + " for " + str(cashback) + " gold?"
	SellCon.visible = true
	
	if on_yes_pressed.is_valid() and $Panel2/Yes.pressed.is_connected(on_yes_pressed):
		$Panel2/Yes.pressed.disconnect(on_yes_pressed)
	if on_no_pressed.is_valid() and $Panel2/No.pressed.is_connected(on_no_pressed):
		$Panel2/No.pressed.disconnect(on_no_pressed)
	
	on_yes_pressed = func():
		btn.queue_free()
		Save1.inventory.erase(item) 
		Save1.growth["money"] += cashback
		upd_money()
		await get_tree().create_timer(1).timeout
		SellCon.visible = false
	on_no_pressed = func():
		SellCon.visible = false
	
	$Panel2/Yes.pressed.connect(on_yes_pressed)
	$Panel2/No.pressed.connect(on_no_pressed)
