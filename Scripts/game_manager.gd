extends Node

@onready var ui: CanvasLayer = $Player/UI
@onready var player: CharacterBody2D = $Player
@export var player_chr : CharacterBody2D
@export var enemy : CharacterBody2D
var current_chr : CharacterBody2D

var game_over : bool = false

func _ready() -> void:
	current_chr = null
	next_turn()

func next_turn():
	if game_over or player.ran_away:
		return
	
	if current_chr != null:
		current_chr.end_turn()
	
	if current_chr == enemy or current_chr == null:
		current_chr = player_chr
	else:
		current_chr = enemy
	
	current_chr.begin_turn()
	
	if current_chr == player_chr:
		ui.visible = true
	else:
		ui.visible = false
		var wait_time = randf_range(0.5, 1.5)
		await get_tree().create_timer(wait_time).timeout
		enemy_decide_combat_action()
		await get_tree().create_timer(0.5).timeout
		next_turn()

func player_cast_combat_action(action):
	if player_chr != current_chr:
		return
	player.combat_action(action, enemy)
	# disable player UI
	await get_tree().create_timer(0.5).timeout
	next_turn()

func enemy_decide_combat_action():
	pass
