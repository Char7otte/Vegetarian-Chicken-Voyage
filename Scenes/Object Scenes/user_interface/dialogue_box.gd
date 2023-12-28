extends Control

@onready var subtitle_label = %SubtitleLabel
@onready var option_labels = [%Option1, %Option2, %Option3]

func change_subtitle_label_text(new_subtitle_text):
	subtitle_label.text = new_subtitle_text


func change_options_label_text(option_element, new_option_text):
	option_labels[option_element].text = new_option_text
