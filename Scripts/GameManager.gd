extends Node

var level_template = preload("res://Scenes/level_template.tscn")
signal rooms_loaded

@onready var root_game_node = get_node("/root/Game")
var mid_room_center: Vector2

var limit_pos_top = 0
var limit_pos_right = 0
var limit_pos_bottom = 0
var limit_pos_left = 0
var rooms
var mid_room_rect

# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(.25).timeout
	load_rooms()
		
func load_rooms():
	for i in range(Globals.get_grid_array().x):
		for j in range(Globals.get_grid_array().y):
			var level = level_template.instantiate()
			level.add_to_group("rooms")
			# note to self, simplify with get_rect
			var new_position = Vector2(i* Globals.get_screen_dims().x, j * Globals.get_screen_dims().y)
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
