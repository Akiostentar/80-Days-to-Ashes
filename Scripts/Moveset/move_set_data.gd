class_name MoveSetData
extends Resource

enum Category {Attack, Heal, Defend}

@export var move_name: String
@export var category: Category = Category.Attack
@export_enum("single", "all ememies", "self") var target_type = "Single"
@export var condition: String
@export var heal: int
@export var damage: int
