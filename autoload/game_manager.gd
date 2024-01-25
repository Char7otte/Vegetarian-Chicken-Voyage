extends Node

var dialogue_directory = DirAccess.open("res://resources/dialogue/test_level")
var days_counter = 1

func get_dialogue_lines_for_the_day():
	var dialogue_resource_array = dialogue_directory.get_files()
	if dialogue_resource_array.size() <= days_counter:
		return load("res://resources/dialogue/test_level/" + dialogue_resource_array[0])
	else:
		return load("res://resources/dialogue/test_level/" + dialogue_resource_array[days_counter])

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
