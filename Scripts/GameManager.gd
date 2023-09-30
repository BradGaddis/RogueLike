extends Node

var level_template = preload("res://Scenes/level_template.tscn")
signal rooms_loaded


# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(Globals.get_grid_array().x):
#		rooms.append([])
		for j in range(Globals.get_grid_array().y):
			var level = level_template.instantiate()
			level.add_to_group("rooms")
			var new_position = Vector2(i* Globals.get_screen_dims().x, j * Globals.get_screen_dims().y)
			level.position = new_position
			add_child(level)
#			print("level added")
#			rooms[i].append(level)
#			Globals.update_rooms(rooms)
#	print(rooms)
	emit_signal("rooms_loaded")

