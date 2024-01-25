extends Node

@onready var game_manager = get_node("/root/GameManager")
@onready var dialogue_component = %DialogueComponent

func _ready():
	dialogue_component.dialogue_lines = game_manager.get_dialogue_lines_for_the_day()
