extends Button

@export var speaker_name: String = "Blacksmith"

@export_multiline var dialogue_lines: Array[String] = [
	"Hello.",
	"I am [insert name] ",
	"look aroung the shop and see if anything ctaches your eye",
	#These are some dialogues for the blacksmith
	"A simple straight sword, cheap and light weight",
	"You dont look like an axe type of person but i can't judge a man and his weapon", 
	"Dont you think this sword is a bit too heavy for you? eh you gotta build up strength for that too",
	"Daggers. Light weight and sharp, hope you got the agility for it",
	"The mace huh? barely see anyone using this anymore",
	"A shield? Hah, lets see how long this'll last",
	"Gauntlets? You sure about that one, I mean they do fit you well",
	"Well thats all I currently got",
	"If you find some rare materials to use in making weapons",
	"Give them to me and I'll fix up a weapon worthy for you, that you'll pay for half price",
	#end of dialogue
	"See ya later young man!"
]

func _ready() -> void:
	add_to_group("dialogue_buttons")
	pressed.connect(_on_button_pressed)

func _on_button_pressed() -> void:
	%DialoguePanel.start_dialogue(speaker_name, dialogue_lines)
	
	
