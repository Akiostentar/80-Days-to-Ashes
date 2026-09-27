extends Button

@export var speaker_name: String = "Enchanter's Apprentice"

@export_multiline var dialogue_lines: Array[String] = [
	#These are some dialogues for the seller
	"O-Oh okay, the enchant is done",
	"Phew that was a success", 
	"W-what about this enchant?",
	"Hopefully t-this enchant is to your liking",
	"Are you fine with this?",
	"O-oh n- wait that was a success",
	"Now I can do more powerful enchants, h-however I need more rare enchant spells.",
	#end of dialogue
	"T-thank you coming!"
]

func _ready() -> void:
	add_to_group("dialogue_buttons")
	pressed.connect(_on_button_pressed)

func _on_button_pressed() -> void:
	%DialoguePanel.start_dialogue(speaker_name, dialogue_lines)
	
	
