extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body

func _on_Blacksmith_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/BattleUI.tscn")

func _on_MainHall_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/BattleUI.tscn")

func _on_Gen_Store_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/BattleUI.tscn")
