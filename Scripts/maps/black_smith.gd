extends Control

@onready var Money: Label = $Money
@onready var Notif: Label = $Label
@onready var Choice: GridContainer = $Choice
@onready var Weapons: GridContainer = $Weapons
@onready var Armor: GridContainer = $Armors


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("uid://c07yycqhh86kk")

func upd_money() -> void:
	if MainMenu.GS == 1:
		Money.text = str(Save1["growth"]["money"])
	if MainMenu.GS == 2:
		Money.text = str(Save2["growth"]["money"])
	if MainMenu.GS == 3:
		Money.text = str(Save3["growth"]["money"])
