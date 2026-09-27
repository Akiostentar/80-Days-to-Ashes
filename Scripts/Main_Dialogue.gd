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
		},
		
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
		#Bandits: Hey, You two, hand over your valuables
		#Main Character: (We're outnumbered what can we d-)
		#Companion: RUN!
		#A cloud of smoke appeard infront of us blinding the bandits
		#Bandits: *cough* *cough* GET THEM
		
		{
			"text": "After dungeon",
			"monologue": true
		},
		{
			"name": "Companion and Main Character",
			"text": "*panting*",
			"portrait": null,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "(Dammit we just had to run into some bandits)",
			"portrait": character_texture, 
			"monologue": false
		},
		{
			"name": "Companion",
			"text": "Good thing I brought some smoke pots with me",
			"portrait": character_texture,  
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "You *cough* really planned for the worst case scenario huh",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Companion",
			"text": "You need to be very cautious in the dungeon becuase the monsters are not the only danger there",
			"portrait": character_texture,
			"monlogue": false
		},
		{
			"name": "Main Character",
			"text": "(I sat in deep thought and never realized how serious this was)",
			"portrait": character_texture,  
			"monologue": false
		},
		{
			"name": "Companion",
			"text": "Well I'll be heading back now, safe travels [Insert Main Character Name]",
			"portrait": character_texture,  
			"monologue": false
		},
		{
			"text": "I pack up my things as well and get back to the stables",
			"monologue": true
		},
		{
			"name": "Main Character",
			"text": "Thinking back, why did I choose the dungeon, the only reason I am alive is because of [insert companion name]",
			"portrait": character_texture,  
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "I must get stronger, I can't rely too much on everyone that helps me",
			"portrait": character_texture,
			"monologue": false
		}
	]
	
	%DialoguePanel.start_sequence(sequence_part_2, false)
	await %DialoguePanel.dialogue_ended

	await play_fade_overlay("Day 3")

	var sequence_part_3: Array[Dictionary] = [
		{
			"name": "Main Character",
			"text": "I got up and visited the guild to see if I can apply for some jobs.",
			"portrait": character_texture,  
			"monologue": false
		},
		{
			"name": "Receptionist",
			"text": "Hmm...With your current skill level and knowledge...",
			"portrait": character_texture,  
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "(*Sigh* I get it I'm weak, don't need to make it fancy)",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Receptionist",
			"text": "Hmm... Our blacksmith currently needs materials to create more weapons",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "Alright, I'm off to meet the blacksmith",
			"portrait": character_texture,  
			"monologue": false
		},
		{
			"text": "Crap, I forgot I don't know my way here",
			"monologue": true
		},
		{
			"name": "Main Character",
			"text": "Come on, it can't be that hard to find a forge here",
			"portrait": character_texture,  
			"monologue": false
		},
		{
			"text": "I spot a certain someone on the way here",
			"monologue": true
		},
		{
			"name": "Main Character",
			"text": "Hey [insert companion name]!",
			"portrait": character_texture,  
			"monologue": false
		},
		{
			"name": "Companion",
			"text": "Oh hello again, it's odd seeing you here",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "Haha..Well I'm a bit lost trying to find the forge here",
			"portrait": character_texture,  
			"monologue": false
		},
		{
			"name": "Companion",
			"text": "Oh? But the forge is over there",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"text": "He points to the forge which is 2 buildings away from the guild",
			"monologue": true
		},
		{
			"name": "Main Character",
			"text": "...",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Companion",
			"text": "Uhm, [insert Main Character name]?",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "*Sign* (I sit down in shame, disappointed in myself)",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Companion",
			"text": "I-its okay, we all mistakes like that",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"text": "Upon arriving to the Blacksmith's forge",
			"monologue": true
		},
		{
			"name": "Blacksmith [insert name]",
			"text": "Hello young man, I reckon you have something for me?",
			"portrait": character_texture,  
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "Yes sir, I was told that you needed help in acquiring materials",
			"portrait": character_texture,  
			"monologue": false
		},
		{
			"name": "Blacksmith [insert name]",
			"text": "Yes, we are expecting a few guests soon who will need their weapons remade and sharpened",
			"portrait": character_texture, 
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "And what materials do you need?",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Blacksmith [insert name]",
			"text": "Iron or the weapons of the monsters, we can smelt that for more iron anyways",
			"portrait": character_texture,  
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "On it",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"text": "After dungeon",
			"monologue": true
		},
		{
			"name": "Main Character",
			"text": "Well here are the materials sir",
			"portait": character_texture,
			"monologue": false
		},
		{
			"name": "Blacksmith [insert name]",
			"text": "Much appreciated young man, here take this, as well as this weapon for your troubles",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"text": "You have acquired [Sharpened Iron Sword]",
			"monologue": true
		},
		{
			"name": "Main Character",
			"text": "Woah..",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Companion",
			"text": "Congrats, you just earned yourself your own blade",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "Thank you sir for the amazing gift",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Blacksmith [insert name]",
			"text": "Just swing by if you need a new weapo or if you need sharpening",
			"portrait": character_texture,  
			"monologue": false
		},
		{
			"name": "Blacksmith [insert name]",
			"text": "IF you have the money",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main CHaracter",
			"text": "O-Of course sir, haha...",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Companion",
			"text": "Did you really think everything would be free?",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "*Sigh* Lets just go",
			"portrait": character_texture,
			"monologue": false
		}
	]
	%DialoguePanel.start_sequence(sequence_part_3, false)
	await %DialoguePanel.dialogue_ended

	await play_fade_overlay("Day 4")

	var sequence_part_4: Array[Dictionary] = [
		{
			"name": "Main Character",
			"text": "*Yawn* I really wanted to sleep more",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Companion",
			"text": "Well if you wake up late, then you would'nt be able to get anything",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "Where exactly are we going?",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "([insert companion name] pointed to a small crowd but after walking a few, I see a merchant)",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "A merchant? Whats special about him?",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Companion",
			"text": "He sells a wide variety of items that most adventurers need",
			"portrait": character_texture,  
			"monologue": false
		},
		{
			"name": "Merchant",
			"text": "Welcome, Welcome, please take a look around, I have lots to sell",
			"portrait": character_texture,  
			"monologue": false
		},
		{
			"name": "Companion",
			"text": "Go take a look around, I'll be somewhere else for a while",
			"portrait": character_texture,  
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "Hmm.. lets see food, weapons, and-",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "In the corner of my eye, I spot some delicacies our village used to make",
			"portrait": character_texture,   
			"monologue": false
		},
		{
			"name": "Merchant",
			"text": "Ooh good choice sir, you don't know how many people reject this dessert without even trying a bite of it",
			"portrait": character_texture,  
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "Well its an acquired taste after all",
			"portrait": character_texture,  
			"monologue": false
		},
		{
			"name": "Merchant",
			"text": "Well enjoy it sir, the village that was making these is gone, the village was burnt to nothing and piles of corpses just left to rot",
			"portrait": character_texture,  
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "(I grit my teeth trying to hold back from doing something rash)",
			"portrait": character_texture,  
			"monologue": false
		},
		{
			"name": "Merchant",
			"text": "Well sir, keep looking, there might be other items waiting to be bought",
			"portrait": character_texture,  
			"monologue": false
		},
		{
			"text": "[Cue merchant dialogues when buying]",
			"monologue": true
		},
		{
			"name": "Companion",
			"text": "Well did you find anything you like?",
			"portrait": character_texture,  
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "Yeah...",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Companion",
			"text": "... Lets go to dungeon now since we're prepared now",
			"portrait": character_texture,
			"monologue": false
		},
		
		#Dungeon Dialogues: (starting off with Companion)
		#So what did you buy?
		#Oh just a few things and some treats from a village
		#Oh can I try some?
		#Oh sure, its going to taste weird since its you-
		#*cough* *cough*
		#Oh crap, are you okay?
		#What the *cough* what was in that
		#Uhm, its best not to know
		
		{
			"text": "After dungeom",
			"monologue": true
		},
		{
			"name": "Main Character", 
			"text": "This sword really helped me out",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Companion",
			"text": "Atleast you're growing stonger",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "Heh, soon I'll be stronger than you",
			"portrait": character_texture,  
			"monologue": false
		},
		{
			"name": "Companion",
			"text": "Keep dreaming",
			"portrait": character_texture,  
			"monologue": false
		},
	]
	%DialoguePanel.start_sequence(sequence_part_4, false)
	await %DialoguePanel.dialogue_ended

	await play_fade_overlay("Day 5")

	var sequence_part_5: Array[Dictionary] = [
		{
			"name": "Main Character",
			"text": "Hnngh...",
			"portrait": character_texture,  
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "Hmm I have *yawn* 3 hours to explore the city before the dungeon opens",
			"portrait": character_texture,  
			"monologue": false
		},
		{
			"text": "I walk around the city trying to find new places until something caught my eye",
			"monologue": true
		},
		{
			"name": "Main Character",
			"text": "Hmm whats this building here",
			"portrait": character_texture,  
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "Hello?",
			"portrait": character_texture, 
			"monologue": false
		},
		{
			"text": "I take a peek through the window and I can see prices on the wall so this is a shop",
			"monologue": true
		},
		{
			"name": "Main Character",
			"text": "The door is open, so I assmune they're open",
			"portrait": character_texture,  
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "(I open the door and enter the shop) Hello?",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "(I walk a few more steps until I reach a room)",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "???",
			"text": "AH!",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "I-Im so sorry, I was just walking and saw the door open in the building and I-",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "???",
			"text": "O-oh i-its fine, I just got startled by the sudden appearance",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Apprentice Enchanter [insert name]",
			"text": "M-my name is [insert name] and I am the apprentice enchanter",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "Oh hello, I'm [insert name]",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "So if you're the apprentice, wheres your master?",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Apprentice Enchanter [insert name]",
			"text": "W-well she's currently out doing her errands",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "Huh, isn't the apprentice supposed to do the errands?",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Apprentice Enchanter [insert name]",
			"text": "Uhm...I'm not sure why she left me here, but I'm sure she trusts me with the shop and she did it for my safety",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "(I have a thought, I'm not sure they want to hear it)",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "Wait you said you are an enchanter? What can you do?",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Apprentice Enchanter [insert name]",
			"text": "Uhm...enchant?",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "No I mean- *sign*, can you enchant my sword please",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Apprentice Enchanter [insert name]",
			"text": "O-Oh gladly, please come this way",
			"portrait": character_texture,
			"monologue": false 
		},
		{
			"text": "Cue enchant area dialogue",
			"monologue": true
		},
		{
			"name": "Main Character",
			"text": "Thanks a lot miss, and just in time for the dungeon to open",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Apprentice Enchanter [insert name]",
			"text": "U-Uhm come again and tell your friends about us",
			"portrait": character_texture,  
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "Heh, can't wait to show this [insert companion name]",
			"portrait": character_texture,  
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "Hmm...Where is he, the dungeon is already starting and he is always on time",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "I'll just enter the dungeon, he can find me if he's late, I'm just here in the lower floors anyway",
			"portrait": character_texture,  
			"monologue": false
		},
		{
			"text": "After dungeon",
			"monologue": true
		},
		{
			"name": "Main Character",
			"text": "He really did'nt show up huh",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "He's probably busy or doing something important, I should'nt bother him",
			"portrait": character_texture, 
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "I just hope my hunch was right",
			"portrait": character_texture,  
			"monologue": false
		}
	]
	%DialoguePanel.start_sequence(sequence_part_5, false)
	await %DialoguePanel.dialogue_ended

	await play_fade_overlay("Day 6")

	var sequence_part_6: Array[Dictionary] = [
		{
			"name": "Main Character",
			"text": "Hnngh...",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "(I immediately go to the dungeon to check if he's there)",
			"portrait": null,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "Damn, I still can't find the guy, where is he",
			"portrait": character_texture,  
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "I'll just go to the dungeon, I can just wait for him there",
			"portrait": character_texture, 
			"monologue": false
		},
		{
			"text": "After dungeon",
			"monologue": true
		},
		{
			"name": "Main Character",
			"text": "He still has'nt shown up",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "If he isn't here by tomorrow, I'll need to go check on him if he's okay",
			"portrait": character_texture,  
			"monologue": false
		}
	]
	%DialoguePanel.start_sequence(sequence_part_6, false)
	await %DialoguePanel.dialogue_ended
	
	await play_fade_overlay("Day 7")
	
	var sequence_part_7: Array[Dictionary] = [
		{
			"name": "Main Character",
			"text": "(As soon as I got up, I ran to the dungeon to see if he's there)",
			"portrait": character_texture,  
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "He",
			"portrait": character_texture,  
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "He's not here",
			"portrait": character_texture,  
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "(A thousand thoughts rush in my mind just thinking what could have happened)",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "(But one thing was for sure that I will be alone on this journey-)",
			"portrait": character_texture,  
			"monologue": false
		},
		{
			"name": "Companion",
			"text": "Well you sure are early today, guess I'm the one whos late now",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "Wha- [insert companion name]? Where have you been",
			"portrait": character_texture,  
			"monologue": false
		},
		{
			"name": "Companion",
			"text": "I've just been sick for a few days, I had to go buy medicine somewhere else since the merchant did'nt have any",
			"portrait": character_texture,  
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "Oh no wonder you were gone for all that time",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Companion",
			"text": "Mhm anyways the dungeon is about to open, let us prepare",
			"portrait": character_texture,  
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "Alright",
			"portrait": character_texture,  
			"monologue": false
		},
		
		#Dungeon Lines:
		#It seems you have made a lot of money while I was gone
		#Yeah.. I've been saving
		#For what? A house?
		#Eh I like my the stables
		#Really, your fine with that uncomfortable pile of dried leaves?
		#I have to live with something and I was broke at that time
		#I see... And you also met the enchanter's apprentice?
		#Oh yeah, now this sword will surely beat whatever comes my way
		#Heh, you will need something stronger soon, and your body is not in the shape yet
		#Hey, I'm fit enough 
		
		{
			"text": "After dungeon",
			"monologue": true
		},
		{
			"name": "Main Character",
			"text": "*gasping* Even after all that I still get tired by the end of the day",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Companion",
			"text": "Atleast we are getting stronger, we have went down to our highest floor yet",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "Your right about that, we definitely are getting stronger",
			"portrait": character_texture,  
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "Well, I'm getting tired, I think its time I head on",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"text": "After arriving to the stables to sleep",
			"monologue": true
		},
		{
			"name": "Main Character",
			"text": "Sigh... I thought I wanted to be stronger, not rely on anyone too much",
			"portrait": character_texture, 
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "In the end, I almost broke down just trying to find the person who has helped me through out this journey",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "I think its time I accept I can't do this alone, I need friends to help me in this journey",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Chracter",
			"text": "If I want to succeed, I'll need help",
			"portrait": character_texture,
			"monologue": false
		},
	]
	%DialoguePanel.start_sequence(sequence_part_7, false)
	await %DialoguePanel.dialogue_ended
	
	await play_fade_overlay("Day 10")
	
	var sequence_part_8: Array[Dictionary] = [
		{
			"text": "No dialogue really for day 8 and 9, [totally not me being lazy asf]",
			"monologue": true
		},
		{
			"name": "Main Character",
			"text": "So got anything planned for today?",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Companion",
			"text": "Same old routine, we enter the dungeon and go home after",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "Yeesh, its getting boring without anything eventful much happening around",
			"portrait": character_texture,  
			"monologue": false
		},
		{
			"name": "Companion",
			"text": "I prefer the quiet life, atleast we dont get as exhausted much as before",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "(At this rate I'll never save my family)",
			"portrait": character_texture, 
			"monologue": false
		},
	]
	%DialoguePanel.start_sequence(sequence_part_8, false)
	await %DialoguePanel.dialogue_ended
	
	await play_fade_overlay("Before leaving the dungeon")
	
	var sequence_part_9: Array[Dictionary] = [
		{
			"name": "Main Character",
			"text": "Well, the dungeon is about to close, lets head back",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Companion",
			"text": "Hmm... Something is up ahead",
			"portrait": character_texture,  
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "Huh where- oh its those bandits from last time",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Companion",
			"text": "It seems they're blocking the exit",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Companion",
			"text": "Lets just back away slowly and think of a way out-",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"text": "[Insert companion name] accidentally tripped and fell alerting some bandits on our way",
			"monologue": true
		},
		{
			"name": "Main Character",
			"text": "Well, since we're here, might as well fight them",
			"portrait": character_texture,
			"monologue": false
		},
	]
	%DialoguePanel.start_sequence(sequence_part_9, false)
	await %DialoguePanel.dialogue_ended
	
	await play_fade_overlay("After leaving the dungeon")
	
	var sequence_part_10: Array[Dictionary] = [
		{
			"name": "Main Character",
			"text": "Hah...Well that was one hell of a fight huh",
			"portrait": character_texture,  
			"monologue": false
		},
		{
			"name": "Companion",
			"text": "Well atleast we got a lot of money from them, here take this",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Main Character",
			"text": "Oh thanks, you sure we can take these?",
			"portrait": character_texture,
			"monologue": false
		},
		{
			"name": "Companion",
			"text": "What happens in the dungeon, stays in the dungeon",
			"portrait": character_texture,
			"monologue": false
		}
	]
	%DialoguePanel.start_sequence(sequence_part_10, false)
	
