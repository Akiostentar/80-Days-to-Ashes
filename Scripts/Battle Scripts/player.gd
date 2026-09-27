extends Node2D

@export var max_hp: int = 100
@export var strength: int = 5
@export var actspeed: int = 5
@export var moveset: Array[PlayerMoveSetData] = []
@export var level: int



var energy: int = 100
var ran_away: bool = false


func begin_turn():
	print("Player's turn")

func end_turn():
	print("It's the enemy's turn!")

@warning_ignore("unused_parameter")
func take_damage(amount: int):
	pass

@warning_ignore("unused_parameter")
func heal(amount: int):
	pass

func _on_attack_enemy(action, opponent: Node2D) -> void:
	print("Attack is ", action.move_name, ", while opponent is ", opponent.enemy_name)
