extends Node

signal make_option_labels_visible
signal make_option_labels_invisible

@onready var dialogue_text_timer = $Timer
@onready var dialogue_box = %DialogueBox

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
