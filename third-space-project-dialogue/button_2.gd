extends Button

@export var speaker_name: String = "Main Character"
@export var character_texture: Texture2D
@export_multiline var dialogue_lines: Array[String] = [
	"H-how...",
	"How could this happen."
]

func _ready() -> void:
	add_to_group("dialogue_buttons")
	pressed.connect(_on_button_pressed)

func _on_button_pressed() -> void:
	%DialoguePanel.start_dialogue(speaker_name, dialogue_lines, character_texture, false)
	await %DialoguePanel.dialogue_ended
	
	get_tree().call_group("dialogue_buttons", "hide")
	
	%FlashbackLabel.text = "3 hours ago..."
	%FadeOverlay.modulate.a = 0.0
	%FadeOverlay.show()
	
	var fade_out = create_tween()
	fade_out.tween_property(%FadeOverlay, "modulate:a", 1.0, 1.0)
	await fade_out.finished
	
	await get_tree().create_timer(1.5).timeout
	
	var fade_in = create_tween()
	fade_in.tween_property(%FadeOverlay, "modulate:a", 0.0, 1.0)
	await fade_in.finished
	%FadeOverlay.hide()
	
	var flashback_sequence: Array[Dictionary] = [
		{
			"name": "Village Chief",
			"text": "Hey you [name], can you go to the nearest town and fetch some supplies.",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "Supplies?... Are we running low?",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Village Chief",
			"text": "Yes, our crops will take more time to grow and our blades are getting dull.",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "Okay, I'll be back in a few hours.",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"text": "(I come back to my village just to be met with the smell of ash and blood.)",
			"monologue": true
		},
		{
			"text": "(The amount of lifeless bodies all piled up, I search every body, every burnt house but I see that my family is missing.)",
			"monologue": true
		},
		{
			"text": "(I go back to my home, its all burned and they took everything from me-)",
			"monologue": true
		},
		{
			"name": "Main Character",
			"text": "Huh?",
			"monologue": true
		},
		{
			"text": "(I see a piece of paper on the floor.)",
			"monologue": true
		},
		{
			"name": "Main Character",
			"text": "An...Auction? Held by the [insert evil guild name].",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "So these are the people who have destroyed my village.",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "My family could be held at this auction, but how can I do this, I am too weak and they have taken all my valuables.",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "The City! Their dungeon will help improve my combat and there are jobs I can apply for to earn the money as well.",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "Hmm...According to the paper the auction will be held in 80 days, I just hope I can make it.",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "(I grab the supplies and other valuables that I find in the village, I set off to begin my journey.)",
			"portrait": character_texture,
			"monologue": false
		}
	]
	
	%DialoguePanel.start_sequence(flashback_sequence, true)
