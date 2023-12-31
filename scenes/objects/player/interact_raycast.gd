extends RayCast3D
class_name PlayerInteractRaycast

func _process(_delta):
	if is_colliding():
		var colliding_object_interact_component = get_collider().get_node_or_null("InteractComponent")
		if colliding_object_interact_component == null:
			print("Error: Interact Component not found.")
			return
		
		if Input.is_action_just_pressed("interact"):
			colliding_object_interact_component.on_player_interact()
