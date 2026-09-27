extends CharacterBody2D

@export var health: int = 35
@export var damage: int = 10
@export var actspeed: int = 5

@export var description: String
@export var moveset_path = "res://DataBase/Movesets/Goblin/Goblin"
var moveset_type_num = 1
var moveset: Array[Resource]

func _ready() -> void:
	#find_next_moveset()
	pass

func find_next_moveset() -> void:
	var base_path: String = moveset_path + "%d.tres" # %d means placeholder deciaml int
	var current_path: String = base_path % moveset_type_num
	
	while FileAccess.file_exists(current_path):
		# add moveset into a dictionary/array to be stored in the enemy.
		moveset_type_num += 1

	
	print("Cannot find " + base_path % moveset_type_num)


func begin_turn():
	if health >= health*0.5:
		# combat_action(action)
		pass
	else:
		# heal_action(action)
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
func heal_action(amount: int):
	pass

@warning_ignore("unused_parameter")
func combat_action(action):
	pass
