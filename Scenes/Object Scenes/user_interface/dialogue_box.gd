extends Control

@onready var option_labels_parent = %OptionLabels
@onready var subtitle_label = %SubtitleLabel

var option_labels: Array

func _ready():
	option_labels = option_labels_parent.get_children()


func _on_dialogue_manager_change_subtitle_label_text(new_text):
	subtitle_label.text = new_text


func _on_dialogue_manager_change_option_labels_text(options_element, new_text):
	option_labels[options_element] = new_text
