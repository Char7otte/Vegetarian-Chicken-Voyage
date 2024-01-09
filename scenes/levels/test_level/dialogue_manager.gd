extends Node

signal make_option_labels_invisible
signal make_option_labels_visible

@export var dialogue_lines_resource: Resource

@onready var dialogue_box = %DialogueBox

var dialogue_lines_count = 0
var subtitle_text_array: Array[PackedStringArray]
var dialogue_options_array: Array[PackedStringArray]


func _ready():
	await get_tree().create_timer(0.1).timeout
	
	subtitle_text_array = dialogue_lines_resource.subtitle_text_array
	dialogue_options_array = dialogue_lines_resource.dialogue_options_array
	
	dialogue_box.option_selected.connect(on_option_selected)
	
	change_dialogue_lines()


func change_dialogue_lines():
	make_option_labels_invisible.emit()
	print("=== \nDIALOGUE STARTED")
	
	for line in subtitle_text_array[dialogue_lines_count]:
		await dialogue_box.change_subtitle_label_text(line)
	
	print("DIALOGUE FINISHED\n===")
	make_option_labels_visible.emit()
	
	change_dialogue_options()
	await dialogue_box.option_selected


func change_dialogue_options():
	dialogue_box.change_option_label_text(dialogue_options_array[dialogue_lines_count])
	pass


func on_option_selected():
	dialogue_lines_count += 1
	change_dialogue_lines()
