extends Control

const SV1 = preload("uid://dpikte7ybok0u")
const SV2 = preload("uid://cy7t10cp5trqt")
const SV3 = preload("uid://ba8qubhgxsrt6")
var Save1 = SV1.new()
var Save2 = SV2.new()
var Save3 = SV3.new()


@onready var S2: Label = $HBoxContainer/VBoxContainer2/Label2
@onready var S3: Label = $HBoxContainer/VBoxContainer3/Label2
@onready var S1: Label = $HBoxContainer/VBoxContainer/Label2
@onready var name_input: Panel = $Panel

func _ready() -> void:
	label_content()

func label_content() -> void:
	var data1 = Save1.stats
	var data2 = Save2.stats
	var data3 = Save3.stats

	if data1["player_name"] != '':
		print(data1["player_name"])
		S1.text = data1["player_name"]
	if data2["player_name"] != '':
		S2.text = data2["player_name"]	
	if data3["player_name"] != '':
		S3.text = data3["player_name"]
	else:
		print("no player_name found")

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("uid://ckxcjkvo71ibl")

var which_save = 0
func _on_s1b_pressed() -> void:
	name_input.visible = true
	which_save = 1
func _on_s2b_pressed() -> void:
	name_input.visible = true
	which_save = 2
func _on_s3b_pressed() -> void:
	name_input.visible = true
	which_save = 3

func _on_nameback_pressed() -> void:
	var a = $Panel/LineEdit
	name_input.visible = false
	a.clear()
func _on_confirm_pressed() -> void:
	var named = ($Panel/LineEdit).text.capitalize()
	var welcome: Label = $Panel/Label
	if which_save == 1:
		Save1.stats["player_name"] = named
		welcome.text = "Welcome " + str(Save1.stats['player_name'])
	elif which_save == 2:
		Save2.stats["player_name"] = named
		welcome.text = "Welcome " + str(Save2.stats["player_name"])
	else:
		Save3.stats["player_name"] = named
		welcome.text = "Welcome " + str(Save3.stats["player_name"])
