extends Button

@export var speaker_name: String = "Tutorial"

@export_multiline var dialogue_lines: Array[String] = [
	"Hello.",
	"In this tutorial we will teach you the basics of this game",
	"Try moving around [insert key binds needed for movement]",
	"Great! Now try attacking",
	"Its a bit complicated but we're sure you will pick it up easily",
	"Choose the attack you will use then click on [insert skill/attack name]",
	"Amazing. You're a fast learner",
	"Now, in certain situations, the enemy can be too difficult",
	"But you also have the option to run away from the fight. Click on the evade button right here",
	"Excellent, now for dungeons, see that bar over there?",
	"Thats your energy bar, you use them up when entering a dungeon room or when certain actions require them",
	"And once it runs out, you will exit the dungeon and go sleep for recover your energy bar",
	"Looks like you're all set, good luck adventurer!"
]

func _ready() -> void:
	add_to_group("dialogue_buttons")
	pressed.connect(_on_button_pressed)

func _on_button_pressed() -> void:
	%DialoguePanel.start_dialogue(speaker_name, dialogue_lines)
	
	
