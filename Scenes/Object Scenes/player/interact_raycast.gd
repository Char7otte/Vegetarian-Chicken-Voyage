extends RayCast3D
class_name PlayerInteractRaycast

#signal looking_at
#signal interact

var colliding_object
var colliding_object_interact_component


func _process(_delta):
	if is_colliding():
		colliding_object = get_collider()
		colliding_object_interact_component = colliding_object.get_node("InteractComponent")
		colliding_object_interact_component.on_player_looking_at()
		#looking_at.emit()
		
		if Input.is_action_just_pressed("interact"):
			colliding_object_interact_component.on_player_interact()
			#interact.emit()
