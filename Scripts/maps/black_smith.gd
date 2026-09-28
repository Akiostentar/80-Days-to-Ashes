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
@onready var sell: HBoxContainer = $Sell

var price = 0

func _ready() -> void:
	upd_money()

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
			for i in range(Amount):
				Save1.growth["money"] -= price
				Save1.inventory.append(item_name.text)
			Notif.text = str(Amount) + " " + str(item_name.text) + " successfully purchased"
			upd_money()
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
			Notif.text = str(Amount) + " " + str(item_name.text) + " successfully purchased"
			upd_money()
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
			for i in range(Amount):
				Save3.growth["money"] -= price
				Save3.inventory.append(item_name.text)
			Notif.text = str(Amount) + " " + str(item_name.text) + " successfully purchased"
			upd_money()
			await get_tree().create_timer(1.0).timeout
			Notif.text = ""
			Box.visible = false
		else:
			Notif.text = "not enough money"
			await get_tree().create_timer(1).timeout
			Notif.text = ""
			Box.visible = false
