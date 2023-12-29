extends Node

@onready var dialogue_text_timer = $Timer
@onready var dialogue_box = %DialogueBox

func change_subtitle_label_text(new_text):
	dialogue_box.subtitle_label.text = new_text


func change_option_label_text(option_element, new_text):
	dialogue_box.option_labels[option_element].text = new_text


func _ready():
	dialogue_text_timer.start()
	await dialogue_text_timer.timeout
	change_subtitle_label_text("Good morning, Honey!")
	
	dialogue_text_timer.start()
	await dialogue_text_timer.timeout
	change_subtitle_label_text("How was your sleep?")
