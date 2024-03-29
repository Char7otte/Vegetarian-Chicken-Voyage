extends Node
class_name DialogueComponent

signal start_dialogue

@export var dialogue_lines: Resource

@onready var dialogue_manager = get_tree().current_scene.get_node("DialogueManager")


func _init():
	add_to_group("NPC")

func emit_start_dialogue():
	start_dialogue.emit(self)

func on_dialogue_finished():
	dialogue_manager.dialogue_finished.disconnect(on_dialogue_finished)
