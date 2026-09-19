extends Control

@onready var Description_Box: Label = $Panel/Up_Desc
@onready var Attribute_Counter: Label = $Panel/Up_left

func _ready() -> void:
	AP()
	Attribute_Counter.text = str('Remaining Attribute Points: ' + Attribute_Points)
#-------- Needed Vars ----------------------#
var Attribute_Points = 0
func AP() -> void:
	if MainMenu.GS == 1:
		Attribute_Points = Save1.growth['attribute_points']
	if MainMenu.GS == 2:
		Attribute_Points = Save2.growth['attribute_points']
	else:
		Attribute_Points = Save3.growth['attribute_points']


#-------- Attribute Descriptions -----------#
func _on_vitality_mouse_entered() -> void:
	Description_Box.text = 'viality description'
func _on_vitality_mouse_exited() -> void:
	Description_Box.text = 'Attribute Descriptions will show up here'

func _on_strength_mouse_entered() -> void:
	Description_Box.text = 'strength description'
func _on_strength_mouse_exited() -> void:
	Description_Box.text = 'Attribute Descriptions will show up here'

func _on_defense_mouse_entered() -> void:
	Description_Box.text = 'defense  description'
func _on_defense_mouse_exited() -> void:
	Description_Box.text = 'Attribute Descriptions will show up here'

func _on_agility_mouse_entered() -> void:
	Description_Box.text = 'agility description'
func _on_agility_mouse_exited() -> void:
	Description_Box.text = 'Attribute Descriptions will show up here'

func _on_intelligence_mouse_entered() -> void:
	Description_Box.text = 'intelligence description'
func _on_intelligence_mouse_exited() -> void:
	Description_Box.text = 'Attribute Descriptions will show up here'

func _on_dexterity_mouse_entered() -> void:
	Description_Box.text = 'dexterity description'
func _on_dexterity_mouse_exited() -> void:
	Description_Box.text = 'Attribute Descriptions will show up here'
