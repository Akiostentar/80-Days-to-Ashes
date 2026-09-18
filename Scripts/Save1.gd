extends Node

var player_name: String = ""
var player_health: int = 100
var player_strength: int = 5
var player_defense: int = 5
var player_agility: int = 10
var player_intelligence: int = 50
var player_dexterity: int = 10

func data() -> Dictionary:
	return {
		"name": player_name,
		"hp": player_health,
		"str": player_strength,
		"def": player_defense,
		"agi": player_agility,
		"int": player_intelligence,
		"dex": player_dexterity
	}
