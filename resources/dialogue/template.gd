extends Resource

#Since typed dictionaries don't exist in Godot yet, I elected to create multiple resource files,
#loading them in order into an array for each day. So, each resource should have subtitle text
#and the following dialogue options for the player.

@export var subtitle_text_array: Array[PackedStringArray]
@export var dialogue_options_array: Array[PackedStringArray]
