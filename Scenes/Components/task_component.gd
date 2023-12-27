extends Node
class_name TaskComponent

var is_activated: int

func _ready():
	if is_activated == 0:
		var interact_component = get_parent().get_node("InteractComponent")
		interact_component.disable_interaction()
		return
	
	var parent_node = get_parent()
	var object_model = parent_node.get_node("Model")
	var animation_player = object_model.get_node("AnimationPlayer")
	animation_player.play("Break Anim")
