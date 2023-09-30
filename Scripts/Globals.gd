extends Node2D
#class_name DefaultVals

@export var screen_dims: Vector2 = Vector2(1920, 1080)
@export var num_screens: int = 3
@export var grid_array: Vector2 = Vector2(3,3)
var rooms: Array = []

func get_screen_dims() -> Vector2:
	return screen_dims
	
func get_grid_array() -> Vector2:
	return grid_array

func update_rooms(roomsInput):
	rooms = roomsInput
