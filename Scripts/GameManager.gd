extends Node

var level_template = preload("res://Scenes/level_template.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(3):
		for j in range(3):
			var level = level_template.instantiate()
			var new_position = Vector2(i* Defaults.get_screen_dims().x, j * Defaults.get_screen_dims().y)
			level.position = new_position
			add_child(level)
