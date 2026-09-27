extends Panel

@onready var inspect_text: Panel = $"."
@onready var move_name_box: Label = $MoveNameBox
@onready var description_box: Label = $DescriptionBox

func _ready() -> void:
	inspect_text.visible = false
	move_name_box.text = ""
	description_box.text = ""




 ##Menu Buttons Entered (Hover)
## Actions Options
#func _on_ao_1_mouse_entered() -> void:
	#inspect_text.visible = true
	#text_box.text = "Action 1:
		#PLaceholder Text Here"
#
#
#
## Inventory Slots
#func _on_slot_1_mouse_entered() -> void:
	#inspect_text.visible = true
	#text_box.text = "Item 1:
		#Description"
#
#
## Mercy Options
#func _on_mo_1_mouse_entered() -> void:
	#inspect_text.visible = true
	#text_box.text = "Spare:
		#Attempt to spare the enemy"
#
#func _on_mo_2_mouse_entered() -> void:
	#inspect_text.visible = true
	#text_box.text = "Flee:
		#Attempt to flee from the enemy"


# Menu Buttons Entered (Un-Hover)
# Action Options
#func _on_ao_1_mouse_exited() -> void:
	#clean_text()
#
#
## Inventory Slots
#func _on_slot_1_mouse_exited() -> void:
	#clean_text()
#
#
## Mercy Options
#func _on_mo_1_mouse_exited() -> void:
	#clean_text()
#
#func _on_mo_2_mouse_exited() -> void:
	#clean_text()


func _on_slot_base_mouse_entered() -> void:
	pass # Replace with function body.


func _on_slot_base_mouse_exited() -> void:
	pass # Replace with function body.
