extends CharacterBody3D

signal interact

@export var player_speed: float
@export var mouse_sensitivity: float

@onready var player_camera = %PlayerCamera
@onready var interact_raycast = %InteractRaycast

var player_movement_vector: Vector3


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _process(_delta):
	player_movement_vector = get_player_movement_vector()
	player_movement_vector = player_movement_vector.rotated(Vector3.UP, rotation.y) 
	#rotates the player accordingly with the camera
	
	if interact_raycast.is_colliding():
		var collided_object = interact_raycast.get_collider()
		print(collided_object)
		
		if Input.is_action_just_pressed("interact"):
			interact.emit()
			interact_raycast.set_enabled(false)


func _physics_process(_delta):
	velocity = player_movement_vector * player_speed
	move_and_slide()


func _input(event):
	mouse_camera_control(event)
	


func get_player_movement_vector():
	var movement_vector = Vector3.ZERO
	
	if Input.is_action_pressed("move_forward"):
		movement_vector += Vector3.FORWARD
	if Input.is_action_pressed("move_backward"):
		movement_vector += Vector3.BACK
	if Input.is_action_pressed("move_left"):
		movement_vector += Vector3.LEFT
	if Input.is_action_pressed("move_right"):
		movement_vector += Vector3.RIGHT
	
	movement_vector = movement_vector.normalized()
	return movement_vector


func mouse_camera_control(event):
	if event is InputEventMouseMotion:
		rotation_degrees.y -= mouse_sensitivity * event.relative.x
		player_camera.rotation_degrees.x -= mouse_sensitivity * event.relative.y
		player_camera.rotation_degrees.x = clamp(player_camera.rotation_degrees.x, -90, 90)
		interact_raycast.rotation_degrees = player_camera.rotation_degrees
