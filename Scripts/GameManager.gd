extends Node

var level_generator = load("res://Scripts/LevelGenerator.gd")

# Called when the node enters the scene tree for the first time.
func _ready():
	# get the current level we are on
	# call method that generates surrounding levels
	# load the adjacent levels (9 in total)
	print(level_generator)	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
