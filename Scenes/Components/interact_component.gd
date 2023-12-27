extends Node
class_name InteractComponent

func on_player_looking_at():
	print("Looking at: " + get_parent().name)


func on_player_interact():
	print("Interacted with: " + get_parent().name)
	disable_interaction()

func disable_interaction():
	get_parent().set_collision_layer_value(2, false)
	queue_free()


