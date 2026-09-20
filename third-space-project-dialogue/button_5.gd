extends Button

@export var speaker_name: String = "Main Character"
@export var character_texture: Texture2D

func _ready() -> void:
	add_to_group("dialogue_buttons")
	pressed.connect(_on_button_pressed)

func _on_button_pressed() -> void:
	get_tree().call_group("dialogue_buttons", "hide")
	%FlashbackLabel.text = "I open the door to the guild"
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
			"name": "Main Character",
			"text": "Ooh.. Now this place really looks like a guild",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Receptionist",
			"text": "Good Morning Sir, what do you need?",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "I need a permit for dungeon entrance?",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Receptionist",
			"text": "Very well sir, yoo may take a seat on the bench while waiting",
			"portrait": character_texture,
			"monologue": false
		},
		{
			
			"text": "(after 30 minutes of waiting)",
			"monologue": true
			
		},
		{
			"name": "Receptionist",
			"text": "Okay sir, here is your permit and since this is your first time, we have limited your dungeon expediton until the first 3 floors.",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "Oh its fine, I'm kind of a weak still",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Receptionist",
			"text": "Very well sir, and you said this is your first time here?",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "Oh, yes, why may I ask?",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Receptionist",
			"text": "Well,not to discriminate sir, but by the looks of things it seems you cant even afford a knife",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Receptionist",
			"text": "You don't even have a place to stay it seems",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "I- Uhm.",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "(I held back my words since I don't even have enough money for anything to buy here as well as a shelter for me to live in)",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Recptionist",
			"text": "*Sigh*, We can let you sleep in one of the stables, you can live with that right?",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "Y-yes that would be more tht grateful. Thank you ma'am.",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"text": "(I set up in one of the stables, its not exactly comfortable but atleast its better than sleeping outside without a roof on your head)",
			"monologue": true
		},
		{
			"name": "Main Character",
			"text": "Okay my gear is all set, I can now explore the dungeon",
			"portrait": character_texture,
			"monologue": false
		}
	]
	
	%DialoguePanel.start_sequence(flashback_sequence, true)
