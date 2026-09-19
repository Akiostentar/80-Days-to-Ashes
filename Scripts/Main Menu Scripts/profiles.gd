extends Control

@onready var S2: Label = $HBoxContainer/VBoxContainer2/Label2
@onready var S3: Label = $HBoxContainer/VBoxContainer3/Label2
@onready var S1: Label = $HBoxContainer/VBoxContainer/Label2
@onready var name_input: Panel = $Panel

func _ready() -> void:
	label_content()

func label_content() -> void:

	if Save1.stats["player_name"] != '':
		S1.text = Save1.stats["player_name"] + "\n \n" + Save1.growth['level']  + "\n \n" +  Save1.level
	if Save2.stats["player_name"] != '':
		S2.text = Save2.stats["player_name"] + "\n \n" + Save2.growth['level']  + "\n \n" +  Save2.level	
	if Save3.stats["player_name"] != '':
		S3.text = Save3.stats["player_name"] + "\n \n" + Save3.growth['level']  + "\n \n" +  Save3.level
	else:
		pass

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("uid://ckxcjkvo71ibl")

func _on_s1b_pressed() -> void:
	if Save1.stats['name'] == "":
		name_input.visible = true
		MainMenu.GS = 1
	else:
		pass
func _on_s2b_pressed() -> void:
	if Save2.stats['name'] == "":
		name_input.visible = true
		MainMenu.GS = 2
	else:
		pass
func _on_s3b_pressed() -> void:
	if Save3.stats['name'] == '':
		name_input.visible = true
		MainMenu.GS = 3
	else:
		pass

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
	await get_tree().create_timer(2.0).timeout
	name_input.visibility = false
