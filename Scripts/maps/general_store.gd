extends Control

@onready var Box: Panel = $Panel
@onready var Name: Label = $Panel/Name
@onready var Picture: TextureRect = $Panel/Picture
@onready var Desc: Label = $Panel/Desc
@onready var Price: Label = $Panel/Price
@onready var Money: Label = $Label
@onready var Notif: Label = $Notif
@onready var Sell: HBoxContainer = $ScrollContainer/HBoxContainer
@onready var Item1: Button = $"GridContainer/Item 1"
@onready var Item2: Button = $"GridContainer/Item 2"
@onready var Item3: Button = $"GridContainer/Item 3"
@onready var Item4: Button = $"GridContainer/Item 4"
@onready var Item5: Button = $"GridContainer/Item 5"
@onready var Item6: Button = $"GridContainer/Item 6"

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
func upd_butt_cont() -> void:
	Item1
#-------------------------------------------- 
func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("uid://c07yycqhh86kk")
func _on_I1_pressed() -> void:
	var texture = preload("uid://bblgxqdel7dfq")
	Box.visible = true
	Name.text = StaticData.ItemDataBase["Misc"]["torch"]["item_name"]
	Picture.texture = texture
	Desc.text = StaticData.ItemDataBase["Misc"]["torch"]["item_desc"]
	Price.text = str(StaticData.ItemDataBase["Misc"]["torch"]["item_price"])
func _on_I2_pressed() -> void:
	var texture = preload("uid://bblgxqdel7dfq")
	Box.visible = true
	Name.text = StaticData.ItemDataBase["Misc"]["mscroll"]["item_name"]
	Picture.texture = texture
	Desc.text = StaticData.ItemDataBase["Misc"]["mscroll"]["item_desc"]
	Price.text = str(StaticData.ItemDataBase["Misc"]["mscroll"]["item_price"])
func _on_I3_pressed() -> void:
	var texture = preload("uid://bblgxqdel7dfq")
	Box.visible = true
	Name.text = StaticData.ItemDataBase["Misc"]["ring"]["item_name"]
	Picture.texture = texture
	Desc.text = StaticData.ItemDataBase["Misc"]["ring"]["item_desc"]
	Price.text = str(StaticData.ItemDataBase["Misc"]["ring"]["item_price"])
func _on_I4_pressed() -> void:
	var texture = preload("uid://bblgxqdel7dfq")
	Box.visible = true
	Name.text = StaticData.ItemDataBase["Misc"]["hppot1"]["item_name"]
	Picture.texture = texture
	Desc.text = StaticData.ItemDataBase["Misc"]["hppot1"]["item_desc"]
	Price.text = str(StaticData.ItemDataBase["Misc"]["hppot1"]["item_price"])
func _on_I5_pressed() -> void:
	var texture = preload("uid://bblgxqdel7dfq")
	Box.visible = true
	Name.text = StaticData.ItemDataBase["Misc"]["manapot1"]["item_name"]
	Picture.texture = texture
	Desc.text = StaticData.ItemDataBase["Misc"]["manapot1"]["item_desc"]
	Price.text = str(StaticData.ItemDataBase["Misc"]["manapot1"]["item_price"])
func _on_I6_pressed() -> void:
	var texture = preload("uid://bblgxqdel7dfq")
	Box.visible = true
	Name.text = StaticData.ItemDataBase["Misc"]["manapot2"]["item_name"]
	Picture.texture = texture
	Desc.text = StaticData.ItemDataBase["Misc"]["manapot2"]["item_desc"]
	Price.text = str(StaticData.ItemDataBase["Misc"]["manapot2"]["item_price"])
func _on_cancel_pressed() -> void:
	Box.visible = false
func _on_buy_pressed() -> void:
	if MainMenu.GS == 1:
		if Save1.growth["money"] >= int(Price.text)*int($Panel/Amount.text):
			for i in range(int($Panel/Amount.text)):
				Save1.inventory.append(Name.text)
				Save1.growth["money"] -= int(Price.text)
			Notif.text = $Panel/Amount.text + " " + Name.text +  " succesfully purchased"
			upd_money()
			upd_sell()
			await get_tree().create_timer(1.0).timeout
			Notif.text = ""
			Box.visible = false
		else:
			Notif.text = "Not enough money"
			await get_tree().create_timer(1).timeout
			Notif.text = ""
	if MainMenu.GS == 2:
		if Save1.growth["money"] >= int(Price.text)*int($Panel/Amount.text):
			for i in range(int($Panel/Amount.text)):
				Save1.inventory.append(Name.text)
				Save1.growth["money"] -= int(Price.text)
			Notif.text = $Panel/Amount.text + " " + Name.text +  " succesfully purchased"
			upd_money()
			upd_sell()
			await get_tree().create_timer(1.0).timeout
			Notif.text = "0"
			Box.visible = false
		else:
			Notif.text = "Not enough money"
			await get_tree().create_timer(1).timeout
			Notif.text = ""
	if MainMenu.GS == 3:
		if Save1.growth["money"] >= int(Price.text)*int($Panel/Amount.text):
			for i in range(int($Panel/Amount.text)):
				Save1.inventory.append(Name.text)
				Save1.growth["money"] -= int(Price.text)
			Notif.text = $Panel/Amount.text + " " + Name.text +  " succesfully purchased"
			upd_money()
			upd_sell()
			await get_tree().create_timer(1.0).timeout
			Notif.text = ""
			Box.visible = false
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

func _on_bs_pressed(btn: Button):
	var item = btn.text
	print(item)
	btn.queue_free()
	Save1.inventory.erase(item) 
	Save1.growth["money"] += 100
	upd_money()
