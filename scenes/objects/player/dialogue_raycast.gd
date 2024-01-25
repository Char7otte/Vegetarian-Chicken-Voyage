extends RayCast3D

@onready var dialogue_manager = get_tree().current_scene.get_node("DialogueManager")

func _process(_delta):
	if is_colliding():
		if Input.is_action_just_pressed("interact"):
			var collided_npc_dialogue_component = get_collider().get_node("DialogueComponent")
			if collided_npc_dialogue_component.talking == true:
				return
			collided_npc_dialogue_component.emit_start_dialogue()
