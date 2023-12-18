extends StaticBody3D
class_name InteractComponent

func interacted():
	print("Interacted with " + get_parent().name)
	queue_free()
