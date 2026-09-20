extends Control

var GS = 1 #game save

func _ready() -> void:
	pass # Replace with function body.

func _on_play_pressed():
	get_tree().change_scene_to_file("uid://2a3g0r6d8ovv") # Replace with function body.

func _on_settings_pressed() -> void:
	print("Settings") 

func _on_exit_pressed() -> void:
	get_tree().quit() # Replace with function body.
