extends RayCast3D

signal looking_at
signal interact


func _process(_delta):
	if is_colliding():
		looking_at.emit()
		
		if Input.is_action_just_pressed("interact"):
			interact.emit()