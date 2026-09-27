extends Button

@export var speaker_name: String = "Person 1"
@export var character_texture: Texture2D

@export_multiline var dialogue_lines: Array[String] = [
	"Testing Dialogue",
	"Checking if dialogue continues.",
	"Checking if dialogue ends correctly.",
	"Testing dialogue fonts",
	"Tesing If clicks work globally",
	"Testing if we can skip entire dialogue",
	"Testing if 2 sprites can be seen",
	"Testing if we have a ui removal"
]

func _ready() -> void:
	add_to_group("dialogue_buttons")
	pressed.connect(_on_button_pressed)

func _on_button_pressed() -> void:
	%DialoguePanel.start_dialogue(speaker_name, dialogue_lines, character_texture)
