extends CharacterBody2D

@export var max_hp: int = 100
@export var strength: int = 5
@export var actspeed: int = 5

@export var level: int
var ran_away: bool = false

func begin_turn():
	print("Player's turn")

func end_turn():
	pass

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	pass

@warning_ignore("unused_parameter")
func take_damage(amount: int):
	pass

@warning_ignore("unused_parameter")
func heal(amount: int):
	pass

@warning_ignore("unused_parameter")
func combat_action(action, opponent: CharacterBody2D):
	pass
