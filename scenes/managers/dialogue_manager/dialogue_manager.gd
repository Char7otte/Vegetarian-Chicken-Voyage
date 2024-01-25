extends Node

signal make_reply_labels_invisible
signal make_reply_labels_visible

@onready var game_manager = get_node("/root/GameManager")
@onready var dialogue_box = %DialogueBox

var dialogue_progression: int
var speaker_text: Array[PackedStringArray]
var reply_options: Array[PackedStringArray]

func _ready():
	dialogue_box.option_selected.connect(on_option_selected)
	
	var NPCs = get_tree().get_nodes_in_group("NPC")
	for NPC in NPCs:
		NPC.start_dialogue.connect(on_start_dialogue)

func on_start_dialogue(dialogue_component):
	var dialogue_lines = dialogue_component.dialogue_lines
	speaker_text = dialogue_lines.speaker_text
	reply_options = dialogue_lines.reply_options
	change_lines()

func change_lines():
	make_reply_labels_invisible.emit()
	if speaker_text.size() <= 0:
		return
	for text in speaker_text[dialogue_progression]:
		await dialogue_box.change_speaker_text(text)
	if reply_options[dialogue_progression].is_empty():
		dialogue_box.change_speaker_text("")
		dialogue_progression = 0
		return
	
	make_reply_labels_visible.emit()
	dialogue_box.change_replies_text(reply_options[dialogue_progression])
	
	await dialogue_box.option_selected

func on_option_selected():
	dialogue_progression += 1
	change_lines()
