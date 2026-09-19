extends Control

@onready var S2: Label = $HBoxContainer/VBoxContainer2/Label2
@onready var S3: Label = $HBoxContainer/VBoxContainer3/Label2
@onready var S1: Label = $HBoxContainer/VBoxContainer/Label2
@onready var name_input: Panel = $Panel

func _ready() -> void:
	label_content()

func label_content() -> void:

	if Save1.stats["player_name"] != '':
		S1.text = Save1.stats["player_name"]
	if Save2.stats["player_name"] != '':
		S2.text = Save2.stats["player_name"]	
	if Save3.stats["player_name"] != '':
		S3.text = Save3.stats["player_name"]
	else:
		print(Save1.stats["player_name"])
		print("no player_name found")

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("uid://ckxcjkvo71ibl")

func _on_s1b_pressed() -> void:
	name_input.visible = true
	MainMenu.GS = 1
func _on_s2b_pressed() -> void:
	name_input.visible = true
	MainMenu.GS = 2
func _on_s3b_pressed() -> void:
	name_input.visible = true
	MainMenu.GS = 3

func _on_nameback_pressed() -> void:
	var a = $Panel/LineEdit
	name_input.visible = false
	a.clear()
func _on_confirm_pressed() -> void:
	var named = ($Panel/LineEdit).text.capitalize()
	var welcome: Label = $Panel/Label
	if MainMenu.GS == 1:
		Save1.stats["player_name"] = named
		print(Save1.stats["player_name"])
		welcome.text = "Welcome " + str(Save1.stats['player_name'])
	elif MainMenu.GS == 2:
		Save2.stats["player_name"] = named
		welcome.text = "Welcome " + str(Save2.stats["player_name"])
	elif MainMenu.GS == 3:
		Save3.stats["player_name"] = named
		welcome.text = "Welcome " + str(Save3.stats["player_name"])
