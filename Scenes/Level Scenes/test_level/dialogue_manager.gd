extends Node

@export var dialogue_box: PackedScene


func change_subtitle_label_text(new_text):
	dialogue_box.subtitle_label.text = new_text


func change_option_label_text(option_element, new_text):
	dialogue_box.option_labels[option_element].text = new_text
