extends Control

@onready var Description_Box: Label = $Panel/Up_Desc

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
