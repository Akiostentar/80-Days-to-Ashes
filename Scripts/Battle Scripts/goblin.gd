extends CharacterBody2D

@export var health: int = 35
@export var damage: int = 10
@export var actspeed: int = 5

@export var description: String
@export var moveset_path = "res://DataBase/Movesets/Goblin"
var moveset_type = "Act"
var moveset_type_num = 1
var moveset: Array[Resource]

func _ready() -> void:
	find_next_moveset()

func find_next_moveset() -> void:
	var base_path: String = moveset_path + moveset_type + "%d.tres" # %d means placeholder deciaml int
	var current_path: String = base_path % moveset_type_num
	
	while FileAccess.file_exists(current_path):
		
		moveset_type_num += 1

	
	moveset_type = "Atk"
	print("Cannot find " + base_path % moveset_type_num)

	
	#test_file()
#
#func test_file():
	#if FileAccess.file_exists(moveset_path + moveset_type + str(moveset_type_num) + ".tres"):
		#moveset_type_num += 1
		#print("new moveset number is " + str(moveset_type_num))
		#test_file()
	#else:
		#print("no worky")
		#moveset_type = "Atk"
		#moveset_type_num = 1
		#test_file()
	

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
