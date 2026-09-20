class_name ItemData
extends Resource

@export var display_name: String 
@export var description: String
@export var max_stack_size: int = 1
@export var icon: AtlasTexture
@export var equip_scene: PackedScene
@export_enum("Common", "Uncommon", "Rare") var rarity = "Common"
@export var upgradable: bool
@export var max_upgrade: int
