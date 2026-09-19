extends Control

func _ready() -> void:
	AP()
	Attribute_Counter.text = 'Attribute Points Left: ' + str(Attribute_Points)

#-------- Needed Vars ----------------------#
@onready var Description_Box: Label = $Panel/Up_Desc
@onready var Attribute_Counter: Label = $Panel/Up_left
@onready var Vitality_Counter: Label = $Panel/HBoxContainer/Count/Vit_count
@onready var Strength_Counter: Label = $Panel/HBoxContainer/Count/Str_count
@onready var Defense_Counter: Label = $Panel/HBoxContainer/Count/Def_count
@onready var Agility_Counter: Label = $Panel/HBoxContainer/Count/Agi_count
@onready var Intelligence_Counter: Label = $Panel/HBoxContainer/Count/Int_count
@onready var Dexterity_Counter: Label = $Panel/HBoxContainer/Count/Dex_count


var Attribute_Points = 0
func AP() -> void:
	if MainMenu.GS == 1:
		Attribute_Points = Save1.growth['attribute_points']
	if MainMenu.GS == 2:
		Attribute_Points = Save2.growth['attribute_points']
	else:
		Attribute_Points = Save3.growth['attribute_points']

var Vit_count = 0
var Str_count = 0
var Def_count = 0
var Agi_count = 0
var Int_count = 0
var Dex_count = 0

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

#-------- Attribute Buttons ----------------#
func _on_vit_plus_pressed() -> void:
	if Attribute_Points != 0:
		Attribute_Points -= 1
		Vit_count += 1
		Vitality_Counter.text = str(Vit_count)
		Attribute_Counter.text = 'Attribute Points Left: ' + str(Attribute_Points)
	else:
		pass
func _on_vit_minus_pressed() -> void:
	if  Vit_count != 0:
		Vit_count -= 1
		Attribute_Points += 1
		Vitality_Counter.text = str(Vit_count)
		Attribute_Counter.text = 'Attribute Points Left: ' + str(Attribute_Points)
	else:
		pass

func _on_str_plus_pressed() -> void:
	if Attribute_Points != 0:
		Attribute_Points -= 1
		Str_count += 1
		Strength_Counter.text = str(Str_count)
		Attribute_Counter.text = 'Attribute Points Left: ' + str(Attribute_Points)
	else:
		pass
func _on_str_minus_pressed() -> void:
	if  Str_count != 0:
		Str_count -= 1
		Attribute_Points += 1
		Strength_Counter.text = str(Str_count)
		Attribute_Counter.text = 'Attribute Points Left: ' + str(Attribute_Points)
	else:
		pass

func _on_def_plus_pressed() -> void:
	if Attribute_Points != 0:
		Attribute_Points -= 1
		Def_count += 1
		Defense_Counter.text = str(Def_count)
		Attribute_Counter.text = 'Attribute Points Left: ' + str(Attribute_Points)
	else:
		pass
func _on_def_minus_pressed() -> void:
	if  Def_count != 0:
		Def_count -= 1
		Attribute_Points += 1
		Defense_Counter.text = str(Def_count)
		Attribute_Counter.text = 'Attribute Points Left: ' + str(Attribute_Points)
	else:
		pass

func _on_agi_plus_pressed() -> void:
	if Attribute_Points != 0:
		Attribute_Points -= 1
		Agi_count += 1
		Agility_Counter.text = str(Agi_count)
		Attribute_Counter.text = 'Attribute Points Left: ' + str(Attribute_Points)
	else:
		pass
func _on_agi_minus_pressed() -> void:
	if  Agi_count != 0:
		Agi_count -= 1
		Attribute_Points += 1
		Agility_Counter.text = str(Agi_count)
		Attribute_Counter.text = 'Attribute Points Left: ' + str(Attribute_Points)
	else:
		pass

func _on_int_plus_pressed() -> void:
	if Attribute_Points != 0:
		Attribute_Points -= 1
		Int_count += 1
		Intelligence_Counter.text = str(Int_count)
		Attribute_Counter.text = 'Attribute Points Left: ' + str(Attribute_Points)
	else:
		pass
func _on_int_minus_pressed() -> void:
	if  Int_count != 0:
		Int_count -= 1
		Attribute_Points += 1
		Intelligence_Counter.text = str(Int_count)
		Attribute_Counter.text = 'Attribute Points Left: ' + str(Attribute_Points)
	else:
		pass

func _on_dex_plus_pressed() -> void:
	if Attribute_Points != 0:
		Attribute_Points -= 1
		Dex_count += 1
		Dexterity_Counter.text = str(Dex_count)
		Attribute_Counter.text = 'Attribute Points Left: ' + str(Attribute_Points)
	else:
		pass
func _on_dex_minus_pressed() -> void:
	if  Dex_count != 0:
		Dex_count -= 1
		Attribute_Points += 1
		Dexterity_Counter.text = str(Dex_count)
		Attribute_Counter.text = 'Attribute Points Left: ' + str(Attribute_Points)
	else:
		pass

#-------- Confirm Button -------------------#
func _on_confirm_pressed() -> void:
	var Confirm: Panel = $Confirm
	Confirm.visible = true
func _on_confirm_yes_pressed() -> void:
	var Confirm: Panel = $Confirm
	var Confirmed: Label = $Confirm/Label
	if MainMenu.GS == 1:
		Save1.stats["player_health"] += Vit_count
		Save1.stats["player_strength"] += Str_count
		Save1.stats["player_defense"] += Def_count
		Save1.stats["player_agility"] += Agi_count
		Save1.stats["player_intelligence"] += Int_count
		Save1.stats["player_dexterity"] += Dex_count
		Vit_count = 0
		Str_count = 0
		Def_count = 0
		Agi_count = 0
		Int_count = 0
		Dex_count = 0
		Vitality_Counter.text = str(0)
		Strength_Counter.text = str(0)
		Defense_Counter.text = str(0)
		Agility_Counter.text = str(0)
		Intelligence_Counter.text = str(0)
		Dexterity_Counter.text = str(0)
		Confirmed.text = "Confirmed"
		await get_tree().create_timer(2.0).timeout
		Confirm.visible = false
	elif MainMenu.GS == 2:
		Save2.stats["player_health"] += Vit_count
		Save2.stats["player_strength"] += Str_count
		Save2.stats["player_defense"] += Def_count
		Save2.stats["player_agility"] += Agi_count
		Save2.stats["player_intelligence"] += Int_count
		Save2.stats["player_dexterity"] += Dex_count
		Vit_count = 0
		Str_count = 0
		Def_count = 0
		Agi_count = 0
		Int_count = 0
		Dex_count = 0
		Vitality_Counter.text = str(0)
		Strength_Counter.text = str(0)
		Defense_Counter.text = str(0)
		Agility_Counter.text = str(0)
		Intelligence_Counter.text = str(0)
		Dexterity_Counter.text = str(0)
		Confirmed.text = "Confirmed"
		await get_tree().create_timer(2.0).timeout
		Confirm.visible = false
	else:
		Save3.stats["player_health"] += Vit_count
		Save3.stats["player_strength"] += Str_count
		Save3.stats["player_defense"] += Def_count
		Save3.stats["player_agility"] += Agi_count
		Save3.stats["player_intelligence"] += Int_count
		Save3.stats["player_dexterity"] += Dex_count
		Vit_count = 0
		Str_count = 0
		Def_count = 0
		Agi_count = 0
		Int_count = 0
		Dex_count = 0
		Vitality_Counter.text = str(0)
		Strength_Counter.text = str(0)
		Defense_Counter.text = str(0)
		Agility_Counter.text = str(0)
		Intelligence_Counter.text = str(0)
		Dexterity_Counter.text = str(0)
		Confirmed.text = "Confirmed"
		await get_tree().create_timer(2.0).timeout
		Confirm.visible = false
func _on_confirm_no_pressed() -> void:
	var Confirm: Panel = $Confirm
	Confirm.visible = false
