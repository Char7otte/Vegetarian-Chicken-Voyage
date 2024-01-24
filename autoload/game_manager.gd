extends Node

var dialogue_directory = DirAccess.open("res://resources/dialogue/test_level")
var task_day_multiplier = 2
var days_counter = 1

func go_to_next_level():
	days_counter += 1

func get_lines_for_the_day():
	var dialogue_resource_array = dialogue_directory.get_files()
	if dialogue_resource_array.size() <= days_counter:
		return load("res://resources/dialogue/test_level/" + dialogue_resource_array[0])
	else:
		return load("res://resources/dialogue/test_level/" + dialogue_resource_array[days_counter])
