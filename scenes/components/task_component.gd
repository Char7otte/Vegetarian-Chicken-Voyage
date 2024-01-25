extends Node
class_name TaskComponent

signal task_completed(task_id)

@export var task_message: String

@onready var task_manager = get_tree().current_scene.get_node("TaskManager")

var task_id: int

func activate_interaction():
	get_parent().set_collision_layer_value(2, true)
	var animation_player = get_parent().get_node("Model").get_node_or_null("AnimationPlayer")
	if !animation_player:
		print("Animation Player not found on ", get_parent().name)
		return;
	animation_player.play("Break Anim")

func disable_interaction():
	get_parent().set_collision_layer_value(2, false)

func on_player_interact():
	disable_interaction()
	
	task_completed.emit(task_id)
	
	var animation_player = get_parent().get_node("Model").get_node_or_null("AnimationPlayer")
	if !animation_player:
		print("Animation player not found in", get_parent().name)
		return
	animation_player.play("Fix Anim")
