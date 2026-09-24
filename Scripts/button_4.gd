extends Button

@export var speaker_name: String = "Main Character"
@export var character_texture: Texture2D

func _ready() -> void:
	add_to_group("dialogue_buttons")
	pressed.connect(_on_button_pressed)

func _on_button_pressed() -> void:
	get_tree().call_group("dialogue_buttons", "hide")
	%FlashbackLabel.text = "After finally arriving to the Gate"
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
			"text": "Phew I made it to the city gate.",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Guard",
			"text": "Identification?",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "What- Oh!, Sorry Sir",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "(I give him the card I use to enter towns when getting supplies, hopefully this is enough.)",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Guard",
			"text": "Hmm... Okay you're fine, OPEN THE GATES!",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "(Ouch, his shout is so strong my ears are already ringing.)",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "(I watch in awe as the gates reveal a nice and clean town.) Wow, this place is amazing, way better than my village.",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "NPC 1",
			"text": "Hello good sir, welcome to our lovely town, I will be your guide if you wish?",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "Oh, hello little girl, sure you can help, I'm trying to find the Guild to get my dungeon permit.",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "NPC 1",
			"text": "Oh the guild? here let me show you the way.",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "(She ran off to go to where the supposed location of the guild should be.)",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "Hey wait, (Agh, how do I know this isnt a trapped set up for tourists)",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "(I ready my blade incase I came across any danger)",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "(I followed her and she really did bring me to the guild, I guess this place isnt so bad after al-)",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "NPC 1",
			"text": "Pay up",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "...",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "What?",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "NPC 1",
			"text": "Pay up, I deserve it, I took you to your destination like I said did'nt I?",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "(She looks at me with her cute adorable eyes as if it we're poor dog looking at you for food.)",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "*Sigh* (I stopped holding back and I reached into my pouch and gave her 2 coins.)",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "NPC 1",
			"text": "Yeesh, I knew you were poor but not this broke.",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "(I don't know how I should feel about this, I'm a bit angry getting called broke but at the same time being dumb for not reading the huge sign of the guild.)",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "Well atleast I have arrived, now to get my permit.",
			"portrait": character_texture,
			"monologue": false
		}
	]
	
	%DialoguePanel.start_sequence(flashback_sequence, true)
