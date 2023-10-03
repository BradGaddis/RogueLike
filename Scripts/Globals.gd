extends Node2D
#class_name DefaultVals

@export var screen_dims: Vector2 = Vector2(1920, 1080)
@export var num_screens: int = 3
@export var grid_array: Vector2 = Vector2(3,3)

var boss_lair_types = ["straw", "clay", "brick"]
var lair_rooms : Array = []
var total_rooms = grid_array.x * grid_array.y
var mid_room_num: int = round(total_rooms / 2) - 1

func _ready():
	set_lair_rooms()
	print("lairs choses in rooms: ", lair_rooms)
	
func set_lair_rooms():
	#return a list with 3 indexes for which rooms should spawn a lair\
	var cur_index = 0
	while len(lair_rooms) < len(boss_lair_types):
		var cur_type = boss_lair_types[cur_index]
		var rand_num = randi_range(0, total_rooms - 1)
		if not rand_num in lair_rooms and not rand_num == mid_room_num:
			lair_rooms.append({"type" : cur_type, "index" : rand_num})
	
	
func get_lair_rooms():
	return lair_rooms
	

func get_screen_dims() -> Vector2:
	return screen_dims
	
func get_grid_array() -> Vector2:
	return grid_array

