extends Node
class_name TaskComponent

var is_activated: int

func _ready():
	if is_activated == 0:
		var interact_component = get_parent().get_node("InteractComponent")
		interact_component.disable_interaction()
		return
	
	var animation_player = get_parent().get_node("Model").get_node("AnimationPlayer")
	animation_player.play("Break Anim")
