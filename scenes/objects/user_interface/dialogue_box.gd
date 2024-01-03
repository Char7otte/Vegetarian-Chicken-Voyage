extends Control

@onready var option_labels_parent = %OptionLabels
@onready var subtitle_label = %SubtitleLabel
@onready var subtitle_scroll_speed_timer = %SubtitleTextScrollSpeedTimer

var option_labels: Array
var dialogue_manager: Node

func _ready():
	option_labels = option_labels_parent.get_children()
	on_dialogue_manager_make_option_labels_invisible()
	
	dialogue_manager = get_parent().get_parent().get_node("DialogueManager")
	dialogue_manager.make_option_labels_invisible.connect(on_dialogue_manager_make_option_labels_invisible)
	dialogue_manager.make_option_labels_visible.connect(on_dialogue_manager_make_option_labels_visible)


func _process(_delta):
	if option_labels_parent.visible:
		if Input.is_action_just_pressed("talk_option_one"):
			print("Dialogue option 1 selected.")
		if Input.is_action_just_pressed("talk_option_two"):
			print("Dialogue option 2 selected.")
		if Input.is_action_just_pressed("talk_option_three"):
			print("Dialogue option 3 selected.")


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


func on_dialogue_manager_make_option_labels_invisible():
	option_labels_parent.set_visible(false)


func on_dialogue_manager_make_option_labels_visible():
	option_labels_parent.set_visible(true)
