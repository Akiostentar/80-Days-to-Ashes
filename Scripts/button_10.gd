extends Button

@export var speaker_name: String = "merchant"

@export_multiline var dialogue_lines: Array[String] = [
	"Hello.",
	"I am [insert name] ",
	"look aroung the shop",
	#These are some dialogues for the merchant
	"Interesting choice",
	"Thank you for the purchase sir", 
	"So you want more of this?",
	"Oho so you like this stuff",
	"As long as you give me the money it, its yours",
	"This should last you around 2 days I suppose",
	"Thats some delicious stuff right there",
	"Well thats all I currently got",
	"I'll try going back to get more stuff soon",
	#end of dialogue
	"Thank you for purchasing my goods"
]

func _ready() -> void:
	add_to_group("dialogue_buttons")
	pressed.connect(_on_button_pressed)

func _on_button_pressed() -> void:
	%DialoguePanel.start_dialogue(speaker_name, dialogue_lines)
