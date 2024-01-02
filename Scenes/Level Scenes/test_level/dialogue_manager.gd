extends Node

@onready var dialogue_text_timer = $Timer
@onready var dialogue_box = %DialogueBox

func _ready():
	await get_tree().create_timer(0.1).timeout
	await tutorial_dialogue()


func change_subtitle_label_text(new_text):
	dialogue_box.subtitle_label.text = new_text
	
	print(new_text)
	
	dialogue_text_timer.start()
	await dialogue_text_timer.timeout


func change_option_label_text(option_element, new_text):
	dialogue_box.option_labels[option_element].text = new_text


func tutorial_dialogue():
	print("=== \nStarted tutorial dialogue")
	await change_subtitle_label_text("Good morning, Honey!")
	await change_subtitle_label_text("How was your sleep?")
	print("Finished tutorial dialogue\n===")
