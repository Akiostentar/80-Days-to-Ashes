extends Button

@export var speaker_name: String = "Main Character"
@export var character_texture: Texture2D

func _ready() -> void:
	add_to_group("dialogue_buttons")
	pressed.connect(_on_button_pressed)

func play_fade_overlay(title_text: String) -> void:
	%FlashbackLabel.text = title_text
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

func _on_button_pressed() -> void:
	get_tree().call_group("dialogue_buttons", "hide")
	
	await play_fade_overlay("Before entering the dungeon")
	
	var sequence_part_1: Array[Dictionary] = [
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
		
		#Lines for dungeon: (start off with you then companion then switch)
		#so whats your name?
		#oh im [insert main character name]
		#Hello [ur name], im [insert companion name]
		#Well hello, so uhm.. can you help me understand the dungeon?
		#The dungeon is labyrinth full of monsterbut also hide all kinds of valuables, thats about it really
		#Wait huh why are monsters still appearing here?
		#Well we think that at the lowest floor holds a magic core that creates monsters and items each day.
		#Okay has anybody tried seeing what happens to dungeon when the time reaches midnight?
		#People have tried and are never to be seen again
		#Hmmm...
		#Well just focus on getting as much stuff here before they close the dungeon
		
		{
			
			"text": "After the dungeon",
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
		},
]

	%DialoguePanel.start_sequence(sequence_part_1, false)
	await %DialoguePanel.dialogue_ended

	await play_fade_overlay("Day 2")

	var sequence_part_2: Array[Dictionary] = [
		{
			"name": "Main Character",
			"text": "Nngh... Ugh",
			"portrait": null,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "Wh-What time is it?",
			"portrait": character_texture, 
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "Dammit I woke up late, I need to hurry and meet [insert companion name]",
			"portrait": character_texture,
			"monlogue": false
		},
		{
			"name": "Main Character",
			"text": "I hope he's still there waiting for me",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"text": "15 minutes later...",
			"monologue": true
		},
		{
			"name": "Companion",
			"text": "*Sign*, You're late",
			"portrait": character_texture,  
			"monologue": false  
		},
		{
			"name": "Main Character",
			"text": "Haha... Sorry still getting used to my bed",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Companion",
			"text": "Well atleast you did'nt make wait that long, and look the dungeon is about to open, lets go",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "Right behing you",
			"portrait": character_texture,
			"monologue": false
		}
		
		#Lines for dungeon:
		#Ever heard of [insert evil guild name]
		#Oh them? they have destroyed countless villages and enslaved so many people
		#If everyone knows what they did, why can't the higher ups to something?
		#It's due to their connections with other cities and powerful people, one wrong move and you could start a war 
		#(Can I really beat them? If they have all this power, what can I do with this frail body of mine)
		#Their boss is also very strong, when he came here to try out our dungeon, he went downn 128 floors in one day 
		#And who is he?
		#His name is [Insert Evil Guild Boss Name]
		#[Insert Evil Guild Boss name], huh (I'll make sure to remember that name)
		
	]
	
	%DialoguePanel.start_sequence(sequence_part_2, true)
