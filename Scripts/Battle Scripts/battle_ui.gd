extends Control

@onready var label: Label = $"Action Menu/Menu/Label"
@onready var fight: HBoxContainer = $"Action Menu/Menu/Fight"
@onready var act: HBoxContainer = $"Action Menu/Menu/Act"
@onready var mercy: HBoxContainer = $"Action Menu/Menu/Mercy"
@onready var inventory: ScrollContainer = $"Action Menu/Menu/Inventory"
@onready var enemy_slot: HBoxContainer = $"Action Menu/Menu/Enemies"

@onready var attack_cat: Button = $"Category Menu/HBoxContainer/Attack"
@onready var action_cat: Button = $"Category Menu/HBoxContainer/Action"
@onready var items_cat: Button = $"Category Menu/HBoxContainer/Items"
@onready var mercy_cat: Button = $"Category Menu/HBoxContainer/Mercy"
@onready var back: Button = $"Action Menu/Menu/Enemies/Back"
@onready var atkbase: Button = $"Action Menu/Menu/Fight/Base"
@onready var enemybase: Button = $"Action Menu/Menu/Enemies/Base"

@onready var inspect_text_box: Panel = $"Inspect Text Box"
@onready var move_name_box: Label = $"Inspect Text Box/MoveNameBox"
@onready var description_box: Label = $"Inspect Text Box/DescriptionBox"

@export var player: Node2D
@export var enemies: Array[Enemy] = []

var current_state = "Attack"
var chosen_attack: PlayerMoveSetData
var chosen_enemy: Node

signal attack_enemy(move: PlayerMoveSetData, enemy: Node2D)

func _ready() -> void:
	find_attack_movesets()
	logic_update()

func reset_ui():
	fight.visible = false
	act.visible = false
	inventory.visible = false
	mercy.visible = false
	enemy_slot.visible = false
	attack_cat.disabled = false
	action_cat.disabled = false
	items_cat.disabled = false
	mercy_cat.disabled = false

func clean_text():
	inspect_text_box.visible = false
	move_name_box.text = ""
	description_box.text = ""

func logic_update():
	reset_ui()
	match current_state:
		"Attack":
			label.text = "Attack"
			fight.visible = true
			attack_cat.disabled = true
		"Action":
			label.text = "Actions"
			act.visible = true
			action_cat.disabled = true
		"Items":
			label.text = "Item"
			inventory.visible = true
			items_cat.disabled = true
		"Mercy":
			label.text = "Mercy"
			mercy.visible = true
			mercy_cat.disabled = true
		"Selection":
			label.text = "Choose an Enemy"
			fight.visible = false
			enemy_slot.visible = true
			attack_cat.disabled = true
			action_cat.disabled = true
			items_cat.disabled = true
			mercy_cat.disabled = true
			find_enemies()
		"End Turn":
			label.text = "Attack"
			fight.visible = true
			enemy_slot.visible = false
			attack_cat.disabled = true
			action_cat.disabled = true
			items_cat.disabled = true
			mercy_cat.disabled = true
			disable_attack_buttons()

func disable_attack_buttons():
	for button in fight.get_children():
		if button != atkbase:
			button.disabled = true

func enable_attack_buttons():
	for button in fight.get_children():
		if button != atkbase:
			button.disabled = false

func find_attack_movesets():
	for buttons in fight.get_children():
		if buttons != atkbase:
			buttons.queue_free()
	
	for move in player.moveset:
		if move.category != MoveSetData.Category.Attack:
			continue
		var button = atkbase.duplicate()
		button.text = move.move_name
		button.visible = true
		button.pressed.connect(_on_attack_button_pressd.bind(move))
		button.mouse_entered.connect(_on_attack_button_mouse_entered.bind(move, button))
		button.mouse_exited.connect(_on_attack_button_mouse_exited.bind())
		fight.add_child(button)

func find_enemies():
	for buttons in enemy_slot.get_children():
		if buttons != enemybase and buttons != back:
			buttons.queue_free()
	for enemy in enemies:
		var button = enemybase.duplicate()
		button.text = enemy.enemy_name
		button.visible = true
		button.pressed.connect(_on_enemy_button_pressed.bind(enemy))
		enemy_slot.add_child(button)
		enemy_slot.move_child(back, enemy_slot.get_child_count() - 1)

# Category Checking
func _on_attack_pressed() -> void:
	current_state = "Attack"
	logic_update()
	find_attack_movesets()

func _on_action_pressed() -> void:
	current_state = "Action"
	logic_update()

func _on_items_pressed() -> void:
	current_state = "Items"
	logic_update()

func _on_mercy_pressed() -> void:
	current_state = "Mercy"
	logic_update()

func _on_back_pressed() -> void:
	current_state = "Attack"
	logic_update()


# Button presses 
func _on_attack_button_pressd(move: PlayerMoveSetData) -> void:
	chosen_attack = move
	current_state = "Selection"
	logic_update()

func _on_attack_button_mouse_entered(move: PlayerMoveSetData, button: Button) -> void:
	if button.disabled:
		return
	inspect_text_box.visible = true
	move_name_box.text = move.move_name
	description_box.text = move.description

func _on_attack_button_mouse_exited():
	clean_text()

func _on_enemy_button_pressed(enemy):
	chosen_enemy = enemy
	attack_enemy.emit(chosen_attack, chosen_enemy)
	current_state = "End Turn"
	logic_update()
