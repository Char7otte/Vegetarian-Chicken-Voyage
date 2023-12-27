extends RayCast3D
class_name PlayerInteractRaycast

var colliding_object_interact_component: InteractComponent

func _process(_delta):
	if is_colliding():
		colliding_object_interact_component = get_collider().get_node("InteractComponent")
		if colliding_object_interact_component == null:
			print("Error: Interact Component not found.")
			return
		
		colliding_object_interact_component.on_player_looking_at()
		
		if Input.is_action_just_pressed("interact"):
			colliding_object_interact_component.on_player_interact()
