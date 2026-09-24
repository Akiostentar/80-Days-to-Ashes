extends Button

@export var speaker_name: String = "Seller"

@export_multiline var dialogue_lines: Array[String] = [
	"Hello.",
	"I am [insert name] and I buy treasures and anything of value from people",
	#These are some dialogues for the seller
	"Hmm I think I can make use out of this",
	"You really want to sell that", #Use this if the players might sell something VERY valuable
	"Best I can give you is this much for it",
	"I think this would go well with this project here",
	"Ooh this looks valuable enough",
	"Thanks for selling this",
	"Ooh got anymore of that",
	"This item is strange but I'll buy it of your hands",
	"Ooh this looks rare thanks for letting me have it",
	"This stuff looks weird, but thanks anyways",
	#end of dialogue
	"Thank you coming!"
]

func _ready() -> void:
	add_to_group("dialogue_buttons")
	pressed.connect(_on_button_pressed)

func _on_button_pressed() -> void:
	%DialoguePanel.start_dialogue(speaker_name, dialogue_lines)
	
	
