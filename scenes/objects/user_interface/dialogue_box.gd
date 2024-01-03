extends Control

@onready var option_labels_parent = %OptionLabels
@onready var subtitle_label = %SubtitleLabel
@onready var subtitle_scroll_speed_timer = %SubtitleTextScrollSpeedTimer

var option_labels: Array

func _ready():
	option_labels = option_labels_parent.get_children()
func change_subtitle_label_text(new_text):
	subtitle_label.text = new_text
	print(new_text)
	subtitle_scroll_speed_timer.start()
	await subtitle_scroll_speed_timer.timeout


func change_option_label_text(new_option_label_1_text, new_option_label_2_text, new_option_label_3_text):
	option_labels[0].text = new_option_label_1_text
	option_labels[1].text = new_option_label_2_text
	option_labels[2].text = new_option_label_3_text
	print("1: " + new_option_label_1_text)
	print("2: " + new_option_label_2_text)
	print("3: " + new_option_label_3_text)


func _on_dialogue_manager_make_option_labels_invisible():
	option_labels_parent.set_visible(false)


func _on_dialogue_manager_make_option_labels_visible():
	option_labels_parent.set_visible(true)
