extends Node

var level_template = preload("res://Scenes/level_template.tscn")
signal rooms_loaded

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(Globals.get_grid_array().x):
		for j in range(Globals.get_grid_array().y):
			var level = level_template.instantiate()
			level.add_to_group("rooms")
			# note to self, simplify with get_rect
			var new_position = Vector2(i* Globals.get_screen_dims().x, j * Globals.get_screen_dims().y)
			level.position = new_position
			add_child(level)
	emit_signal("rooms_loaded")

