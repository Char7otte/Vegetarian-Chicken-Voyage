extends Node

signal make_option_labels_invisible
signal make_option_labels_visible

@onready var dialogue_text_timer = $Timer

@onready var dialogue_box = %DialogueBox

var dialogue_lines_0 = [
	"Hello, Honey!", 
	"How was your sleep?"
]

var dialogue_lines_1 = [
	"Here are what needs doing today in the house:",
	"TASK 1 HERE",
	"TASK 2 HERE",
	"TASK 3 HERE"
]

var dialogue_lines_count = 0
var dialogue_lines_dictionary = {
	0 : dialogue_lines_0,
	1 : dialogue_lines_1
}

func _ready():
	await get_tree().create_timer(0.1).timeout
	
	dialogue_box.option_selected.connect(on_option_selected)
	
	change_dialogue_lines()


func start_dialogue(dialogue_lines):
	make_option_labels_invisible.emit()
	print("=== \nDIALOGUE STARTED")
	
	for line in dialogue_lines:
		await dialogue_box.change_subtitle_label_text(line)
	
	print("DIALOGUE FINISHED\n===")
	make_option_labels_visible.emit()


func change_dialogue_lines():
	start_dialogue(dialogue_lines_dictionary[dialogue_lines_count])


func on_option_selected():
	dialogue_lines_count += 1
	change_dialogue_lines()
