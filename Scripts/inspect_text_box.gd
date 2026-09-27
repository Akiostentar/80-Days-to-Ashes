extends Panel

@onready var inspect_text: Panel = $"."
@onready var text_box: Label = $TextBox

func _ready() -> void:
	inspect_text.visible = false
	text_box.text = ""

func clean_text():
	inspect_text.visible = false
	text_box.text = ""


 #Menu Buttons Entered (Hover)
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
		PLaceholder Text Here"

func _on_ao_2_mouse_entered() -> void:
	inspect_text.visible = true
	text_box.text = "Action 2:
		Placeholder Text Here"

func _on_ao_3_mouse_entered() -> void:
	inspect_text.visible = true
	text_box.text = "Focus:
		Gain 10 Energy"

func _on_ao_4_mouse_entered() -> void:
	inspect_text.visible = true
	text_box.text = "Sheild:
		Block 80% of incoming damage"


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


func _on_slot_base_mouse_entered() -> void:
	pass # Replace with function body.


func _on_slot_base_mouse_exited() -> void:
	pass # Replace with function body.
