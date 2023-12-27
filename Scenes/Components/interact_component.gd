extends Node
class_name InteractComponent

func on_player_looking_at():
	print("Looking at: " + get_parent().name)


func on_player_interact():
	print("Interacted with: " + get_parent().name)
	
	var animation_player = get_parent().get_node("Model").get_node("AnimationPlayer")
	animation_player.play("Fix Anim")
	
	disable_interaction()


func disable_interaction():
	get_parent().set_collision_layer_value(2, false)
	queue_free()
