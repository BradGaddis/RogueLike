extends Node

var level_template = preload("res://Scenes/level_template.tscn")
signal rooms_loaded

@onready var root_game_node = get_node("/root/Game")
var mid_room_center: Vector2

# Used to limit the player to within the game bounds
var limit_pos_top: int = 0
var limit_pos_right: int = 0
var limit_pos_bottom: int = 0
var limit_pos_left: int = 0

# Will change how the rooms are laid out
var grid_array: Vector2 = Vector2(3,3)

var rooms
var room_size: Vector2 = Vector2.ZERO
var mid_room_rect
var lair_rooms : Array = []
var boss_lair_types = ["straw", "stick", "brick"]
var total_rooms = grid_array.x * grid_array.y
var mid_room_num: int = round(total_rooms / 2) - 1

# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(.25).timeout
	load_rooms()
	set_lair_rooms()

func set_lair_rooms():
	#return a list with 3 indexes for which rooms should spawn a lair\
	var cur_index = 0
	while len(lair_rooms) < len(boss_lair_types):
		var cur_type = boss_lair_types[cur_index]
		var rand_num = randi_range(0, total_rooms - 1)
		if not rand_num in lair_rooms and not rand_num == mid_room_num:
			lair_rooms.append({"type" : cur_type, "index" : rand_num})
		
func load_rooms():
	for i in range(grid_array.x):
		for j in range(grid_array.y):
			var level = level_template.instantiate()
			if room_size == Vector2.ZERO:
				var bg = level.find_child("Background")
				room_size = bg.get_rect().size
				print(room_size)
			level.add_to_group("rooms")
			# note to self, simplify with get_rect
			var new_position = Vector2(i* room_size.x, j * room_size.y)
			level.position = new_position
			root_game_node.add_child(level)
			var rooms = get_tree().get_nodes_in_group("rooms")
	rooms = get_tree().get_nodes_in_group("rooms")
	var half = round(float(len(rooms)) / 2) - 1
	var mid_room = rooms[half]
	mid_room_rect = mid_room.find_child("Background").get_rect()
	mid_room_center = Vector2(mid_room.global_position.x + mid_room_rect.size.x /2,
											mid_room.global_position.y + mid_room_rect.size.y /2) 
	rooms_loaded.emit()
	print("rooms loaded")
