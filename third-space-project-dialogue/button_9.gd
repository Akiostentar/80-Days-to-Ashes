extends Button

@export var speaker_name: String = "Main Character"
@export var character_texture: Texture2D

func _ready() -> void:
	add_to_group("dialogue_buttons")
	pressed.connect(_on_button_pressed)

func _on_button_pressed() -> void:
	get_tree().call_group("dialogue_buttons", "hide")
	%FlashbackLabel.text = "Before entering the dungeon"
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
			"text": "Hmmm, It seems people here are forming teams with others",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Companion",
			"text": "Hello sir, is it okay if i can join you in this dungeon?",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "Oh sure, I'm a new guy here so I need all the help I can get",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Companion",
			"text": "Its nice to have some people help especially with the dungeon",
			"portrait": character_texture,
			"monologue": false
		},
		{
			
			"text": "(after the dungeon)",
			"monologue": true
			
		},
		{
			"name": "Companion",
			"text": "So how was it?",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "Which the dungeon or the city?",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Companion",
			"text": "Both",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "Well this city is amazing, better than my old village",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Companion",
			"text": "Well thats reasonable and the dungeon?",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "Well it was quite the experience.",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "It made me scared at first since this is my first time seeing these monsters up close.",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "But I also had to accept that this would be my life and I knew these people know what they were facing so I did'nt really want compare myself with them.",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Companion",
			"text": "Well thats fair, we all start out scared but we learn to conquer them eventually",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "Heh you're a real good friend [insert name]",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "so why did you really help me?",
			"portrait": character_texture, 
			"monologue": false
		},
		{
			"name": "Companion",
			"text": "I just saw you there alone, helpless, as if you had a goal that needed to be accomplished",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"text": "I say my goodbyes and ready myself to go sleep in the stables",
			"monologue": true
		},
		{
			"name": "Main Character",
			"text": "*Sign* Can I really last 80 days doing this?",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "Can I...",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"text": "Can I really save my family.",
			"monologue": true
		}
	]
	
	%DialoguePanel.start_sequence(flashback_sequence, true)
