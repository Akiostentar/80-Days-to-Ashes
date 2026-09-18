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
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label_content()

func label_content():
	var data1 = Save1.data()
	var data2 = Save2.data()
	var data3 = Save3.data()
	
	if data1["name"] != '':
		S2.text = data1["name"]
	if data2["name"] != '':
		S2.text = data2["name"]	
	if data3["name"] != '':
		S3.text = data3["name"]
	else:
		pass
	

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("uid://ckxcjkvo71ibl") # Replace with function body.
