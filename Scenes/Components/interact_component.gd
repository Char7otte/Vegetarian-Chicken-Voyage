extends Node
class_name InteractComponent


func _on_player_interact():
	print("")
	print("Interacted with: " + name)


func _on_player_looking_at():
	print("Looking at: " + name)
