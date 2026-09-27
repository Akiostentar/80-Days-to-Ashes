extends Node

func _ready() -> void:
	load_data()

func load_json(path:String) -> Dictionary:
	var file = FileAccess.open(path, FileAccess.READ)
	var karga = file.get_as_text()
	file.close()
	
	var json = JSON.new()
	var par = json.parse(karga)
	
	return json.get_data()

func load_data():
	var data = load_json("res://DataBase/Save3.json")
	if data.has("stats"):
		stats.merge(data["stats"],true)
	if data.has("growth"):
		stats.merge(data["growth"],true)	
	if data.has("progression"):
		stats.merge(data["progression"],true)	
	if data.has("equipped"):
		stats.merge(data["equipped"],true)	
	inventory = data.get("inventory", [])


var stats := {
	"player_name": '',
	"player_health": 100,
	"player_strength": 5,
	"player_defense": 5,
	"player_agility": 10,
	"player_intelligence": 50,
	"player_dexterity": 10
	}
var growth := {
	"level": 2,
	"exp": 0,
	"attribute_points": 10,
	}
var progression := {
		"day": 0,
		"prologue": false
	}
var equipped := {
		"weapon": "none",
		"off-hand": "none",
		"armor": "none",
	}
var inventory = []
