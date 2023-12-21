extends Node
class_name InteractComponent

#@export var player_interact_raycast: PlayerInteractRaycast

var has_interacted = false

#func _ready():
	#player_interact_raycast.looking_at.connect(on_player_looking_at)
	#player_interact_raycast.interact.connect(on_player_interact)


func on_player_looking_at():
	if has_interacted == true:
		return
	
	print("Looking at: " + name)

func on_player_interact():
	if has_interacted == true:
		return
	
	has_interacted = true
	print("Interacted with: " + name)



