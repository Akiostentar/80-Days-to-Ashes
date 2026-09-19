extends CharacterBody2D

@export var health: int = 35
@export var damage: int = 10
@export var actspeed: int = 5
@export var moveset: Dictionary
@export var description: String


func begin_turn():
	pass

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
func combat_action(action):
	pass
