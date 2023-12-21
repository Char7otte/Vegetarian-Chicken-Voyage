extends Node
class_name InteractComponent

var has_interacted = false


func on_player_looking_at():
	if has_interacted == true:
		return
	
	print("Looking at: " + get_parent().name)


func on_player_interact():
	if has_interacted == true:
		return
	
	has_interacted = true
	print("Interacted with: " + get_parent().name)



