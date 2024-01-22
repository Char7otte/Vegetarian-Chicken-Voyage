extends Control

signal option_selected

@onready var speaker_label = %SpeakerLabel
@onready var speaker_speed_timer = %SpeakerSpeedTimer
@onready var reply_labels_parent = %Replies
@onready var reply_labels = %Replies.get_children()

var dialogue_manager: Node

func _ready():
	make_reply_labels_invisible()
	
	dialogue_manager = get_parent().get_parent().get_node("DialogueManager")
	dialogue_manager.make_reply_labels_invisible.connect(make_reply_labels_invisible)
	dialogue_manager.make_reply_labels_visible.connect(make_reply_labels_visible)

func _process(_delta):
	if reply_labels_parent.is_visible():
		if Input.is_action_just_pressed("talk_option_one"):
			print("Dialogue option 1 selected.")
			option_selected.emit()
		if Input.is_action_just_pressed("talk_option_two"):
			print("Dialogue option 2 selected.")
		if Input.is_action_just_pressed("talk_option_three"):
			print("Dialogue option 3 selected.")

func change_speaker_text(new_text):
	speaker_label.text = new_text
	print("DIALOGUE: ",new_text)
	
	speaker_speed_timer.start()
	await speaker_speed_timer.timeout

func change_replies_text(new_replies_array):
	for label in reply_labels:
		label.text = new_replies_array[0]
		new_replies_array.remove_at(0)
		print("REPLY: ", label.text)

func make_reply_labels_invisible():
	reply_labels_parent.set_visible(false)

func make_reply_labels_visible():
	reply_labels_parent.set_visible(true)
