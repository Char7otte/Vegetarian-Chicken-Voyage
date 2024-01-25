extends Node

var dialogue_directory = DirAccess.open("res://resources/dialogue/")
var days_counter = 1

func get_dialogue_lines_for_the_day():
	var dialogue_resource_array = dialogue_directory.get_files()
	var file_name: String
	if dialogue_resource_array.size() <= days_counter:
		file_name = dialogue_resource_array[0]
	else:
		file_name = dialogue_resource_array[days_counter]
	
	file_name = file_name.trim_suffix(".remap")
	return load("res://resources/dialogue/" + file_name)

func disable_gameplay_nodes():
	var nodes_to_disable: Array[Node] = []
	
	var player = get_tree().current_scene.get_node("Player")
	nodes_to_disable.append(player)
	
	var dialogue_box = get_tree().current_scene.get_node("UserInterface").get_node("DialogueBox")
	nodes_to_disable.append(dialogue_box)
	
	for node in nodes_to_disable:
		node.process_mode = Node.PROCESS_MODE_DISABLED

func go_to_next_level():
	days_counter += 1
