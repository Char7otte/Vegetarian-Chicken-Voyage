extends RayCast3D
class_name PlayerInteractRaycast

func _process(_delta):
	if is_colliding():
		var colliding_object_task_component = get_collider().get_node_or_null("TaskComponent")
		if colliding_object_task_component == null:
			return
		if Input.is_action_just_pressed("interact"):
			colliding_object_task_component.on_player_interact()
