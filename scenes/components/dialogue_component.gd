extends Node
class_name DialogueComponent

signal start_dialogue

@export var dialogue_lines: Resource

@onready var dialogue_manager = get_tree().current_scene.get_node("DialogueManager")

var talking = false

func _init():
	add_to_group("NPC")

func emit_start_dialogue():
	if talking:
		return
	talking = true
	start_dialogue.emit(self)
