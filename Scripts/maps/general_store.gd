extends Control

@onready var Box: Panel = $Panel
@onready var Name: Label = $Panel/Name
@onready var Picture: TextureRect = $Panel/Picture
@onready var Desc: Label = $Panel/Desc

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

func _on_I2_pressed() -> void:
	var texture = preload("uid://bblgxqdel7dfq")
	Box.visible = true
	Name.text = "Item 2 Name"
	Picture.texture = texture
	Desc.text = "lorem ipsu"

func _on_I3_pressed() -> void:
	var texture = preload("uid://bblgxqdel7dfq")
	Box.visible = true
	Name.text = "Item 3 Name"
	Picture.texture = texture
	Desc.text = "lorem ipsu"

func _on_I4_pressed() -> void:
	var texture = preload("uid://bblgxqdel7dfq")
	Box.visible = true
	Name.text = "Item 4 Name"
	Picture.texture = texture
	Desc.text = "lorem ipsu"

func _on_I5_pressed() -> void:
	var texture = preload("uid://bblgxqdel7dfq")
	Box.visible = true
	Name.text = "Item 5 Name"
	Picture.texture = texture
	Desc.text = "lorem ipsu"

func _on_I6_pressed() -> void:
	var texture = preload("uid://bblgxqdel7dfq")
	Box.visible = true
	Name.text = "Item 6 Name"
	Picture.texture = texture
	Desc.text = "lorem ipsu"

func _on_cancel_pressed() -> void:
	Box.visible = false
