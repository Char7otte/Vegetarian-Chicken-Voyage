extends Control

@onready var option_labels_parent = %OptionLabels
@onready var subtitle_label = %SubtitleLabel

var option_labels: Array

func _ready():
	option_labels = option_labels_parent.get_children()
