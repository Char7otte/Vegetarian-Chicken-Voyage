extends Node

signal change_subtitle_label_text(new_text)
signal change_option_labels_text(option_element, new_text)

@export var dialogue_text_timer_wait_time: float

@onready var dialogue_text_timer = $Timer

func emit_change_subtitle_label_text(new_text):
	change_subtitle_label_text.emit(new_text)


func emit_change_option_labels_text(options_element, new_text):
	change_option_labels_text.emit(options_element, new_text)

func _ready():
	emit_change_subtitle_label_text("Hello, Honey!")
	dialogue_text_timer.start()
	emit_change_subtitle_label_text("How was your sleep?")
