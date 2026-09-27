extends Control

@onready var Qname: Label = $Panel/Quests
@onready var Qdesc: RichTextLabel = $"Panel/Quest Desc"
@onready var Qrew: RichTextLabel = $"Panel/Quest Rewards"

func _ready() -> void:
	load_quests()
	quest_content()

func load_json(path:String) -> Dictionary:
	var file = FileAccess.open(path, FileAccess.READ)
	var karga = file.get_as_text()
	file.close()
	
	var json = JSON.new()
	var par = json.parse(karga)
	
	return json.get_data()
func load_quests():
	var data = load_json("res://DataBase/Quests.json")
	if data.has("Village_1_Quest"):
		V1Q.merge(data["Village_1_Quest"],true)

var V1Q := {
	"Name": "",
	"Description": "",
	"Rewards": ""
	}
func quest_content() -> void:
	Qname.text = V1Q["Name"]
	Qdesc.text = V1Q["Description"]
	Qrew.text = V1Q["Rewards"]
	

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("uid://c07yycqhh86kk")
