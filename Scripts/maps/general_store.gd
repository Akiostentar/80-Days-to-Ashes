extends Control

@onready var Box: Panel = $Panel
@onready var Name: Label = $Panel/Name
@onready var Picture: TextureRect = $Panel/Picture
@onready var Desc: Label = $Panel/Desc
@onready var Price: Label = $Panel/Price

func _ready() -> void:
	pass # INSERT DIALOGUE HERE
func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("uid://c07yycqhh86kk")
func _on_I1_pressed() -> void:
	var texture = preload("uid://bblgxqdel7dfq")
	Box.visible = true
	Name.text = "Item 1 Name"
	Picture.texture = texture
	Desc.text = "lorem ipsumm"
	Price.text = "100"
func _on_I2_pressed() -> void:
	var texture = preload("uid://bblgxqdel7dfq")
	Box.visible = true
	Name.text = "Item 2 Name"
	Picture.texture = texture
	Desc.text = "lorem ipsu"
	Price.text = "200"
func _on_I3_pressed() -> void:
	var texture = preload("uid://bblgxqdel7dfq")
	Box.visible = true
	Name.text = "Item 3 Name"
	Picture.texture = texture
	Desc.text = "lorem ipsu"
	Price.text = "100"
func _on_I4_pressed() -> void:
	var texture = preload("uid://bblgxqdel7dfq")
	Box.visible = true
	Name.text = "Item 4 Name"
	Picture.texture = texture
	Desc.text = "lorem ipsu"
	Price.text = "300"
func _on_I5_pressed() -> void:
	var texture = preload("uid://bblgxqdel7dfq")
	Box.visible = true
	Name.text = "Item 5 Name"
	Picture.texture = texture
	Desc.text = "lorem ipsu"
	Price.text = "500"
func _on_I6_pressed() -> void:
	var texture = preload("uid://bblgxqdel7dfq")
	Box.visible = true
	Name.text = "Item 6 Name"
	Picture.texture = texture
	Desc.text = "lorem ipsu"
	Price.text = "100"
func _on_cancel_pressed() -> void:
	Box.visible = false

func _on_buy_pressed() -> void:
	if MainMenu.GS == 1:
		if Save1.growth["money"] >= int(Price.text):
			for i in range(int($Panel/Amount.text)):
				Save1.inventory.append(Name.text)
				Save1.growth["money"] -= int(Price.text)
		else:
			print("u is broke lol")
