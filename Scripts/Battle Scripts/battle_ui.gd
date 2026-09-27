extends Control

@onready var label: Label = $"Action Menu/Menu/Label"
@onready var fight: HBoxContainer = $"Action Menu/Menu/Fight"
@onready var act: HBoxContainer = $"Action Menu/Menu/Act"
@onready var mercy: HBoxContainer = $"Action Menu/Menu/Mercy"
@onready var inventory: ScrollContainer = $"Action Menu/Menu/Inventory"
@onready var hp: TextureProgressBar = $"Category Menu/HP"
@onready var attack_cat: Button = $"Category Menu/HBoxContainer/Attack"
@onready var action_cat: Button = $"Category Menu/HBoxContainer/Action"
@onready var items_cat: Button = $"Category Menu/HBoxContainer/Items"
@onready var mercy_cat: Button = $"Category Menu/HBoxContainer/Mercy"

var current_state = "Attack"


func _ready() -> void:
	logic_update()
	hp.value = 100.0


func reset_ui():
	fight.visible = false
	act.visible = false
	inventory.visible = false
	mercy.visible = false
	attack_cat.disabled = false
	action_cat.disabled = false
	items_cat.disabled = false
	mercy_cat.disabled = false


func logic_update():
	reset_ui()
	if current_state == "Attack":
		label.text = "Attack"
		fight.visible = true
		attack_cat.disabled = true
	elif current_state == "Action":
		label.text = "Actions"
		act.visible = true
		action_cat.disabled = true
	elif current_state == "Items":
		label.text = "Item"
		inventory.visible = true
		items_cat.disabled = true
	elif current_state == "Mercy":
		label.text = "Mercy"
		mercy.visible = true
		mercy_cat.disabled = true


# Category Checking
func _on_attack_pressed() -> void:
	current_state = "Attack"
	logic_update()

func _on_action_pressed() -> void:
	current_state = "Action"
	logic_update()


func _on_items_pressed() -> void:
	current_state = "Items"
	logic_update()


func _on_run_pressed() -> void:
	current_state = "Mercy"
	logic_update()



func _on_fo_1_pressed() -> void:
	pass
	#FO1_pressed.emit()
	#print("Attack 1 Pressed!")
	#fo_1.disabled = true
	#fo_2.disabled = true


func _on_fo_2_pressed() -> void:
	pass # Replace with function body.


func _on_ao_1_pressed() -> void:
	pass # Replace with function body.


func _on_ao_2_pressed() -> void:
	pass # Replace with function body.


func _on_ao_3_pressed() -> void:
	pass # Replace with function body.


func _on_ao_4_pressed() -> void:
	pass # Replace with function body.


func _on_mo_1_pressed() -> void:
	pass # Replace with function body.


func _on_mo_2_pressed() -> void:
	pass # Replace with function body.
