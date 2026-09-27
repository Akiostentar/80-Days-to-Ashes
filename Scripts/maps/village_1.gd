extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_MH_pressed() -> void:
	get_tree().change_scene_to_file("uid://cg60rvktwkhra")

func _on_BS_pressed() -> void:
	get_tree().change_scene_to_file("uid://bmvcn4vr14y3i")

func _on_GS_pressed() -> void:
	get_tree().change_scene_to_file("uid://djikfq55m6ru5")

func _on_outside_pressed() -> void:
	get_tree().quit()
