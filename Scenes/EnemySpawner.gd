extends Node

var enemy_scene = preload("res://Scenes/enemy.tscn")

@onready var SpawnPositions = $EnemySpawnPositions
@onready var boss = $Boss

func _ready():
	for i in range(get_num_enemies()):
		var position = get_random_position()
		spawn_enemy(position)
		
func randomize_marker_positions():
	# The markers should be withing a minimum radius of each other
	# The markers should spawn in random places
	pass

func should_boss_generate(num_levels_generated):
	# if a lair has generated, yet, otherwise no
	pass

func generate_boss():
	pass

func position_boss():
	# get the bosses lair position
#	after getting the bosses lair and position of it, place the boss in proximity
	pass

func get_num_enemies(level_num = null, min_enimes:int = 1 ,max_enimes: int = 5) -> int:
	var num_enemies = (randi() % max_enimes + min_enimes) 
	print("The number of enemies generated is ",num_enemies)
	return num_enemies

func generate_enemies(num_enemies):
	var position = Vector2.ZERO
	for i in range(num_enemies):
		spawn_enemy(position)

func get_random_position():
	var children = SpawnPositions.get_children()
	return children.pick_random().global_position

	
func spawn_enemy(position):
	var enemy_instance = enemy_scene.instantiate()
	add_child(enemy_instance)
	enemy_instance.global_position = position
	print("enemy spawned at position: ", position)
