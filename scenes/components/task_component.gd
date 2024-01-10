extends Node
class_name TaskComponent

@export var task_message: String

func _init():
	add_to_group("InteractableObjects")
	print("Added to group.")

func activate_interaction():
	var animation_player = get_parent().get_node("Model").get_node("AnimationPlayer")
	animation_player.play("Break Anim")

func deactivate_interaction():
	var interact_component = get_parent().get_node("InteractComponent")
	interact_component.disable_interaction()


