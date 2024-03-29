extends Node

signal make_reply_labels_invisible
signal make_reply_labels_visible
signal dialogue_finished

@onready var game_manager = get_node("/root/GameManager")
@onready var dialogue_box = %DialogueBox

var dialogue_progress: int
var speaker_text: Array[PackedStringArray]
var reply_options: Array[PackedStringArray]
var is_talking: bool

func _ready():
	dialogue_box.option_selected.connect(on_option_selected)
	
	var NPCs = get_tree().get_nodes_in_group("NPC")
	for NPC in NPCs:
		NPC.start_dialogue.connect(on_start_dialogue)

func on_start_dialogue(dialogue_component):
	if is_talking == true:
		print("Already in a conversation.")
		return
	dialogue_progress = 0
	is_talking = true
	
	dialogue_finished.connect(dialogue_component.on_dialogue_finished)
	
	var dialogue_lines = dialogue_component.dialogue_lines
	speaker_text = dialogue_lines.speaker_text
	reply_options = dialogue_lines.reply_options
	change_lines()

func change_lines():
	make_reply_labels_invisible.emit()
	if speaker_text.size() <= dialogue_progress:
		end_dialogue()
		return
	
	for text in speaker_text[dialogue_progress]:
		await dialogue_box.change_speaker_text(text)
	
	if reply_options[dialogue_progress].is_empty():
		end_dialogue()
		return
	
	make_reply_labels_visible.emit()
	dialogue_box.change_replies_text(reply_options[dialogue_progress])

func on_option_selected():
	dialogue_progress += 1
	change_lines()

func end_dialogue():
	dialogue_box.change_speaker_text("")
	is_talking = false
	dialogue_finished.emit()
