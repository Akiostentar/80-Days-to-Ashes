extends Control

@onready var label: Label = $"Action Menu/Menu/Label"
@onready var fight: HBoxContainer = $"Action Menu/Menu/Fight"
@onready var act: HBoxContainer = $"Action Menu/Menu/Act"
@onready var mercy: HBoxContainer = $"Action Menu/Menu/Mercy"
@onready var inventory: ScrollContainer = $"Action Menu/Menu/Inventory"
@onready var text_box: Label = $"Inspect Text Box/TextBox"
@onready var inspect_text: Panel = $"Inspect Text Box"
@onready var hp: TextureProgressBar = $"Category Menu/HP"

func _ready() -> void:
	label.text = "Attack"
	clear_ui()
	fight.visible = true
	inspect_text.visible = false
	text_box.text = ""
	hp.value = 100.0
	
func clear_ui():
	fight.visible = false
	act.visible = false
	inventory.visible = false
	mercy.visible = false

func clean_text():
	inspect_text.visible = false
	text_box.text = ""

# Category Checking
func _on_attack_pressed() -> void:
	label.text = "Attack"
	clear_ui()
	fight.visible = true

func _on_action_pressed() -> void:
	label.text = "Actions"
	clear_ui()
	act.visible = true

func _on_items_pressed() -> void:
	label.text = "Items"
	clear_ui()
	inventory.visible = true

func _on_run_pressed() -> void:
	label.text = "Mercy"
	clear_ui()
	mercy.visible = true


# Menu Buttons Entered (Hover)
# Fight Options
func _on_fo_1_mouse_entered() -> void:
	inspect_text.visible = true
	text_box.text = "Regular Attack:
		Deals 10 damage"

func _on_fo_2_mouse_entered() -> void:
	inspect_text.visible = true
	text_box.text = "Charged Attack:
		Uses 10 Energy, Deals 25 damage"


# Actions Options
func _on_ao_1_mouse_entered() -> void:
	inspect_text.visible = true
	text_box.text = "Action 1:
		Ability"

func _on_ao_2_mouse_entered() -> void:
	inspect_text.visible = true
	text_box.text = "Action 2:
		Ability"

func _on_ao_3_mouse_entered() -> void:
	inspect_text.visible = true
	text_box.text = "Action 3:
		Ability"

func _on_ao_4_mouse_entered() -> void:
	inspect_text.visible = true
	text_box.text = "Action 4:
		Ability"


# Inventory Slots
func _on_slot_1_mouse_entered() -> void:
	inspect_text.visible = true
	text_box.text = "Item 1:
		Description"


# Mercy Options
func _on_mo_1_mouse_entered() -> void:
	inspect_text.visible = true
	text_box.text = "Spare:
		Attempt to spare the enemy"

func _on_mo_2_mouse_entered() -> void:
	inspect_text.visible = true
	text_box.text = "Flee:
		Attempt to flee from the enemy"


# Menu Buttons Entered (Un-Hover)
# Fight Options
func _on_fo_1_mouse_exited() -> void:
	clean_text()

func _on_fo_2_mouse_exited() -> void:
	clean_text()


# Fight Options
func _on_ao_1_mouse_exited() -> void:
	clean_text()

func _on_ao_2_mouse_exited() -> void:
	clean_text()

func _on_ao_3_mouse_exited() -> void:
	clean_text()

func _on_ao_4_mouse_exited() -> void:
	clean_text()


# Inventory Slots
func _on_slot_1_mouse_exited() -> void:
	clean_text()


# Mercy Options
func _on_mo_1_mouse_exited() -> void:
	clean_text()

func _on_mo_2_mouse_exited() -> void:
	clean_text()
