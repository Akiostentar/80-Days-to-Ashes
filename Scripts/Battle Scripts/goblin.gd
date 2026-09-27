class_name Enemy
extends Node2D

@export var enemy_name: String
@export var description: String
@export var health: int = 35
@export var damage: int = 10
@export var actspeed: int = 5
@export var moveset: Array[EnemyMoveSetData]

@onready var battle_ui: Control = $"../../Player/UI/Battle UI"

func begin_turn():
	pass

func end_turn():
	pass

func take_damage(move: PlayerMoveSetData):
	health -= move.damage
	print(health)
	if health > 0:
		# damage anim
		return false
	if health <= 0:
		# die anim
		queue_free()
		return true

@warning_ignore("unused_parameter")
func heal_action(amount: int):
	pass

@warning_ignore("unused_parameter")
func combat_action(action):
	pass
