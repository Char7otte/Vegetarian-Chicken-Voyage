extends Node
class_name InteractComponent

var has_interacted = false


func _on_player_interact():
	has_interacted = true
	print("Interacted with: " + name)


func _on_player_looking_at():
	if has_interacted == true:
		return
	
	print("Looking at" + name)
