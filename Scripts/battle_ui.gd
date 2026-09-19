extends Control
@onready var label: Label = $Buttons2/Label

func _on_attack_pressed() -> void:
	label.text = "Attack"

func _on_action_pressed() -> void:
	label.text = "Actions"

func _on_items_pressed() -> void:
	label.text = "Items"

func _on_run_pressed() -> void:
	label.text = "Run"
