extends Node

@onready var ui: CanvasLayer = $Player/UI
@onready var player: Node2D = $Player
@onready var battle_ui: Control = $"Player/UI/Battle UI"
@export var player_chr : Node2D
@export var enemy : Node2D

var current_chr : Node2D
var game_over : bool = false

func _ready() -> void:
	battle_ui.attack_enemy.connect(_on_attack_enemy)
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
		battle_ui.current_state = "Attack"
		print(battle_ui.current_state)
		battle_ui.logic_update()
		battle_ui.enable_attack_buttons()
	else:
		ui.visible = false
		var wait_time = randf_range(0.5, 1.5)
		await get_tree().create_timer(wait_time).timeout
		enemy_decide_combat_action()
		await get_tree().create_timer(0.5).timeout
		next_turn()

func player_cast_combat_action():
	if player_chr != current_chr:
		return

	await get_tree().create_timer(0.5).timeout
	next_turn()

func enemy_decide_combat_action():
	if enemy != current_chr:
		return

func _on_attack_enemy(move: PlayerMoveSetData, target: Enemy) -> void:
	await target.take_damage(move)
	player_cast_combat_action()
	
	var enemy_died = await target.take_damage(move)
	
	if enemy_died:
		game_over = true
		enemy = null
		return
	
	player_cast_combat_action()
