extends Node

signal make_option_labels_visible
signal make_option_labels_invisible

@onready var dialogue_text_timer = $Timer
@onready var dialogue_box = %DialogueBox

#var current_subtitle: String
#var current_option_1: String
#var current_option_2: String
#var current_option_3: String
#
#var new_subtitle: String
#var new_option_1: String
#var new_option_2: String
#var new_option_3: String
#
#var dialogue_options_dictionary = { 
	#current_subtitle : new_subtitle,
	#current_option_1 : new_option_1, 
	#current_option_2 : new_option_2,
	#current_option_3 : new_option_3
	#}

func _ready():
	await get_tree().create_timer(0.1).timeout
	
	var tutorial_dialogue_lines = ["Hello, Honey!", "How was your sleep?"]
	start_dialogue(tutorial_dialogue_lines)


func start_dialogue(dialogue_lines):
	make_option_labels_invisible.emit()
	print("=== \nDIALOGUE STARTED")
	
	for line in dialogue_lines:
		await dialogue_box.change_subtitle_label_text(line)
	
	print("DIALOGUE FINISHED\n===")
	make_option_labels_visible.emit()
