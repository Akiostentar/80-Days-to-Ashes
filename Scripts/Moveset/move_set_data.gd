class_name MoveSetData
extends Resource

@export var move_name: String
@export_enum("Attack", "Heal", "Defend") var category = "Attack"
@export_enum("single", "all ememies", "self") var target_type = "Single"
@export var condition: String
@export var heal: int
@export var damage: int
