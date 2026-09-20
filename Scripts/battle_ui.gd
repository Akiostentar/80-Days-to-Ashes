extends Control

@onready var label: Label = $"Action Menu/Menu/Label"
@onready var actions: HBoxContainer = $"Action Menu/Menu/Actions"
@onready var inventory: ScrollContainer = $"Action Menu/Menu/Inventory"

func _ready() -> void:
	label.text = "Attack"
	actions.visible = true
	inventory.visible = false


func _on_attack_pressed() -> void:
	label.text = "Attack"
	actions.visible = true
	inventory.visible = false

func _on_action_pressed() -> void:
	label.text = "Actions"
	actions.visible = true
	inventory.visible = false

func _on_items_pressed() -> void:
	label.text = "Items"
	actions.visible = false
	inventory.visible = true

func _on_run_pressed() -> void:
	label.text = "Run"
	actions.visible = true
	inventory.visible = false
