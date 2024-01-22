extends Node

signal make_reply_labels_invisible
signal make_reply_labels_visible

@onready var game_manager = get_node("/root/GameManager")
@onready var dialogue_box = %DialogueBox

var dialogue_progression: int
var dialogue_lines: Resource
var speaker_text: Array[PackedStringArray]
var reply_options: Array[PackedStringArray]

func _ready():
	await get_tree().create_timer(0.1).timeout
	
	dialogue_lines = game_manager.get_lines_for_the_day()
	speaker_text = dialogue_lines.speaker_text
	reply_options = dialogue_lines.reply_options
	
	dialogue_box.option_selected.connect(on_option_selected)
	
	change_lines()

func change_lines():
	make_reply_labels_invisible.emit()
	for text in speaker_text[dialogue_progression]:
		await dialogue_box.change_speaker_text(text)
	if reply_options[dialogue_progression].is_empty():
		dialogue_box.change_speaker_text("")
		return
	
	make_reply_labels_visible.emit()
	dialogue_box.change_replies_text(reply_options[dialogue_progression])
	
	await dialogue_box.option_selected

func on_option_selected():
	dialogue_progression += 1
	change_lines()
