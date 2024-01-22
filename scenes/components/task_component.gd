extends Node
class_name TaskComponent

@export var task_message: String

@onready var task_manager = get_node("/root/TaskManager")

var task_number: int

func _init():
	add_to_group("InteractableObjects")
	print("Added to group.")

func activate_interaction():
	var animation_player = get_parent().get_node("Model").get_node_or_null("AnimationPlayer")
	if !animation_player:
		print("Animation Player not found on ", get_parent().name)
		return;
	animation_player.play("Break Anim")

func on_player_interact():
	disable_interaction()
	task_manager.task_completed.emit(task_number)
	
	var animation_player = get_parent().get_node("Model").get_node_or_null("AnimationPlayer")
	if !animation_player:
		print("Animation player not found in", get_parent().name)
		return
	animation_player.play("Fix Anim")

func disable_interaction():
	get_parent().set_collision_layer_value(2, false)
