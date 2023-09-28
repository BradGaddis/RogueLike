extends Node

var tree1_scene = preload("res://Scenes/tree_1.tscn")
var rock1_scene = preload("res://Scenes/rock_1.tscn")

@onready var SpawnPositions = $EnvSpawnPositions

var positions_filled = []

func _ready():
	generate_trees(get_num_trees())
	generate_rocks(get_num_rocks())
	
func randomize_marker_positions():
	# The markers should be withing a minimum radius of each other
	# The markers should spawn in random places	
	pass

func get_num_trees(level_num = null, min_trees:int = 1 ,max_trees: int = 5) -> int:
	var num_trees = randi_range(min_trees, max_trees)
	return num_trees

func generate_trees(num_trees):
	for i in range(num_trees):
		var position = get_random_position()
		spawn_tree(position)
		
func get_num_rocks(level_num = null, min_rocks:int = 1 ,max_rocks: int = 5) -> int:
	var num_rocks = randi_range(max_rocks , min_rocks) 
	return num_rocks

func generate_rocks(num_rocks):
	for i in range(num_rocks):
		var position = get_random_position()
		spawn_rock(position)

# handles position of every environment object
func get_random_position():
	var children = SpawnPositions.get_children()
	var pos = children.pick_random().position
	while pos in positions_filled:
		pos = children.pick_random().position
	positions_filled.append(pos)
	return pos


func spawn_tree(position):
	# might need to group these and call from the group
	var tree_instance = tree1_scene.instantiate()
	add_child(tree_instance)
	tree_instance.position = position

func spawn_rock(position):
	# might need to group these and call from the group
	var rock_instance = rock1_scene.instantiate()
	add_child(rock_instance)
	rock_instance.position = position
