extends Resource

#Since typed dictionaries don't exist in Godot yet, I elected to create multiple resource files,
#loading them in order into an array for each day. So, each resource should have subtitle text
#and the following dialogue options for the player.

@export var speaker_text: Array[PackedStringArray]
@export var reply_options: Array[PackedStringArray]
