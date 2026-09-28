extends Control

@onready var Box: Panel = $Panel
@onready var Name: Label = $Panel/Name
@onready var Picture: TextureRect = $Panel/Picture
@onready var Desc: Label = $Panel/Desc
@onready var Price: Label = $Panel/Price
@onready var Amount: LineEdit = $Panel/Amount
@onready var Money: Label = $Label
@onready var Notif: Label = $Notif
@onready var Sell: HBoxContainer = $ScrollContainer/HBoxContainer
@onready var Item1: Button = $"GridContainer/Item 1"
@onready var Item2: Button = $"GridContainer/Item 2"
@onready var Item3: Button = $"GridContainer/Item 3"
@onready var Item4: Button = $"GridContainer/Item 4"
@onready var Item5: Button = $"GridContainer/Item 5"
@onready var Item6: Button = $"GridContainer/Item 6"
@onready var SellCon: Panel = $Panel2
@onready var Sure: Label = $Panel2/Details

var price = 0

func _ready() -> void:
	upd_money()
	upd_sell()
	 # INSERT DIALOGUE HERE

func upd_money() -> void:
	if MainMenu.GS == 1:
		Money.text = str(Save1["growth"]["money"])
	if MainMenu.GS == 2:
		Money.text = str(Save2["growth"]["money"])
	if MainMenu.GS == 3:
		Money.text = str(Save3["growth"]["money"])
#-------------------------------------------- 
func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("uid://c07yycqhh86kk")
func _on_I1_pressed() -> void:
	var texture = preload("uid://bblgxqdel7dfq")
	Box.visible = true
	Name.text = StaticData.ItemDataBase["Misc"]["torch"]["item_name"]
	Picture.texture = texture
	Desc.text = StaticData.ItemDataBase["Misc"]["torch"]["item_desc"]
	price = StaticData.ItemDataBase["Misc"]["torch"]["item_price"]
	Price.text = str(price)
func _on_I2_pressed() -> void:
	var texture = preload("uid://bblgxqdel7dfq")
	Box.visible = true
	Name.text = StaticData.ItemDataBase["Misc"]["mscroll"]["item_name"]
	Picture.texture = texture
	Desc.text = StaticData.ItemDataBase["Misc"]["mscroll"]["item_desc"]
	price = StaticData.ItemDataBase["Misc"]["mscroll"]["item_price"]
	Price.text = str(price)
func _on_I3_pressed() -> void:
	var texture = preload("uid://bblgxqdel7dfq")
	Box.visible = true
	Name.text = StaticData.ItemDataBase["Misc"]["ring"]["item_name"]
	Picture.texture = texture
	Desc.text = StaticData.ItemDataBase["Misc"]["ring"]["item_desc"]
	price = StaticData.ItemDataBase["Misc"]["ring"]["item_price"]
	Price.text = str(price)
func _on_I4_pressed() -> void:
	var texture = preload("uid://bblgxqdel7dfq")
	Box.visible = true
	Name.text = StaticData.ItemDataBase["Misc"]["hppot1"]["item_name"]
	Picture.texture = texture
	Desc.text = StaticData.ItemDataBase["Misc"]["hppot1"]["item_desc"]
	price = StaticData.ItemDataBase["Misc"]["hppot1"]["item_price"]
	Price.text = str(price)
func _on_I5_pressed() -> void:
	var texture = preload("uid://bblgxqdel7dfq")
	Box.visible = true
	Name.text = StaticData.ItemDataBase["Misc"]["manapot1"]["item_name"]
	Picture.texture = texture
	Desc.text = StaticData.ItemDataBase["Misc"]["manapot1"]["item_desc"]
	price = StaticData.ItemDataBase["Misc"]["manapot1"]["item_price"]
	Price.text = str(price)
func _on_I6_pressed() -> void:
	var texture = preload("uid://bblgxqdel7dfq")
	Box.visible = true
	Name.text = StaticData.ItemDataBase["Misc"]["manapot2"]["item_name"]
	Picture.texture = texture
	Desc.text = StaticData.ItemDataBase["Misc"]["manapot2"]["item_desc"]
	price = StaticData.ItemDataBase["Misc"]["manapot2"]["item_price"]
	Price.text = str(price)
func _on_cancel_pressed() -> void:
	Box.visible = false
	Amount.text = "1"
func _on_amount_value_changed(value: float) -> void:
	var manu = int(Amount.value)
	var comp_price = price * manu 
	Price.text = str(comp_price)
func _on_buy_pressed() -> void:
	if MainMenu.GS == 1:
		if Save1.growth["money"] >= int(Price.text):
			for i in range(int(Amount.text)):
				Save1.inventory.append(Name.text)
				Save1.growth["money"] -= price
			Notif.text = Amount.text + " " + Name.text +  " succesfully purchased"
			upd_money()
			upd_sell()
			await get_tree().create_timer(1.0).timeout
			Notif.text = ""
			Box.visible = false
			Amount.text = "1"
		else:
			Notif.text = "Not enough money"
			await get_tree().create_timer(1).timeout
			Notif.text = ""
	if MainMenu.GS == 2:
		if Save1.growth["money"] >= int(Price.text):
			for i in range(int(Amount.text)):
				Save1.inventory.append(Name.text)
				Save1.growth["money"] -= price
			Notif.text = Amount.text + " " + Name.text +  " succesfully purchased"
			upd_money()
			upd_sell()
			await get_tree().create_timer(1.0).timeout
			Notif.text = "0"
			Box.visible = false
			Amount.text = "1"
		else:
			Notif.text = "Not enough money"
			await get_tree().create_timer(1).timeout
			Notif.text = ""
	if MainMenu.GS == 3:
		if Save1.growth["money"] >= int(Price.text):
			for i in range(int(Amount.text)):
				Save1.inventory.append(Name.text)
				Save1.growth["money"] -= price
			Notif.text = Amount.text + " " + Name.text +  " succesfully purchased"
			upd_money()
			upd_sell()
			await get_tree().create_timer(1.0).timeout
			Notif.text = ""
			Box.visible = false
			Amount.text = "1"
		else:
			Notif.text = "Not enough money"
			await get_tree().create_timer(1).timeout
			Notif.text = ""

#--------------------------------------------

func upd_sell() -> void:
	for child in Sell.get_children():
		child.queue_free()
	for item in Save1.inventory:
		var button = Button.new()
		button.text = item
		button.size_flags_vertical = Control.SIZE_EXPAND_FILL
		button.pressed.connect(_on_bs_pressed.bind(button))
		Sell.add_child(button)

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
	var itemcateg = get_category(StaticData.ItemDataBase, str(itemID))
	var cashback = 0
	if itemcateg == "Misc":
		cashback = StaticData.ItemDataBase["Misc"][itemID]["item_price"]*0.7
	else:
		cashback = StaticData.ItemDataBase["Misc"][itemID]["item_price"]*0.5
	
	Sure.text = item + " for " + str(cashback) + " gold?"
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
