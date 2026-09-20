extends Panel

signal dialogue_ended

enum State { READY, READING, FINISHED }
var current_state: State = State.READY

@export var char_texture: Texture2D
@export var fade_overlay: ColorRect
var sequence_queue: Array[Dictionary] = []
var tween: Tween = null
const CHARACTER_READ_RATE: float = 0.03

var auto_show_buttons_on_end: bool = true

func _get_overlay() -> ColorRect:
	if fade_overlay:
		return fade_overlay
	if has_node("%FadeOverlay"):
		return %FadeOverlay as ColorRect
	return get_tree().get_first_node_in_group("fade_overlay") as ColorRect

func _ready() -> void:
	self.hide()
	%NamePanel.hide()
	%CharacterSprite.hide()
	if has_node("%FadeOverlay"):
		%FadeOverlay.hide()

func start_dialogue(speaker: String, lines: Array[String], _portrait: Texture2D = null, auto_show_buttons: bool = true) -> void:
	var active_tex = _portrait if _portrait else char_texture
	var formatted_sequence: Array[Dictionary] = []
	for line in lines:
		formatted_sequence.append({
			"name": speaker,
			"text": line,
			"portrait": active_tex
		})
	start_sequence(formatted_sequence, auto_show_buttons)

func start_sequence(sequence: Array[Dictionary], auto_show_buttons: bool = true) -> void:
	auto_show_buttons_on_end = auto_show_buttons
	sequence_queue = sequence.duplicate()
	
	get_tree().call_group("dialogue_buttons", "hide")
	
	self.show()
	
	self.scale = Vector2(0.1, 0.1)
	var pop_tween = create_tween().set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
	pop_tween.tween_property(self, "scale", Vector2(1, 1), 0.4)
	
	load_next_text()

func load_next_text() -> void:
	var overlay = _get_overlay()
	if sequence_queue.is_empty():
		self.hide()
		%NamePanel.hide()
		%CharacterSprite.hide()
		if overlay:
			overlay.modulate.a = 0.0
			overlay.hide()
		
		current_state = State.READY
		dialogue_ended.emit()
		
		if auto_show_buttons_on_end:
			get_tree().call_group("dialogue_buttons", "show")
		return
	
	var current_entry: Dictionary = sequence_queue.pop_front()
	var is_monologue: bool = current_entry.get("monologue", false)
	var has_name: bool = current_entry.has("name") and current_entry["name"] !=""
	var hide_name: bool = current_entry.get("hide_name", false) or is_monologue or not has_name
	
	if overlay:
		if is_monologue:
				if has_node("%FlashbackLabel"):
					%FlashbackLabel.text = ""
				overlay.modulate.a = 1.0
				overlay.show()
		else:
				overlay.modulate.a = 0.0
				overlay.hide()
			
	if hide_name:
		%NamePanel.hide()
	else:
		%NamePanel.show()
		%NamePanel/NameLabel.text = current_entry.get("name", "")
		
	var tex = current_entry.get("portrait", char_texture)
	if tex:
		%CharacterSprite.texture = tex
		%CharacterSprite.show()
	else:
		%CharacterSprite.hide()
	
	var next_text: String = current_entry.get("text", "")
	%DialogueLabel.show()
	%DialogueLabel.text = next_text
	%DialogueLabel.visible_ratio = 0.0
	
	current_state = State.READING
	
	if tween and tween.is_running():
		tween.kill()
	
	var duration = next_text.length() * CHARACTER_READ_RATE
	tween = create_tween()
	tween.tween_property(%DialogueLabel, "visible_ratio", 1.0, duration)
	tween.finished.connect(func(): current_state = State.FINISHED)

func _gui_input(event: InputEvent) -> void:
	if current_state == State.READY:
		return
	
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		accept_event()
		advance_dialogue()

func _unhandled_input(event: InputEvent) -> void:
	if not self.visible or current_state == State.READY:
		return
		
	if event.is_action_pressed("ui_accept"):
		get_viewport().set_input_as_handled()
		advance_dialogue()

func advance_dialogue() -> void:
	if current_state == State.READING:
		if tween and tween.is_running():
			tween.kill()
		%DialogueLabel.visible_ratio = 1.0
		current_state = State.FINISHED
	elif current_state == State.FINISHED:
		load_next_text()
