extends Node2D
#class_name DefaultVals

@export var screen_dims: Vector2 = Vector2(1920, 1080)
@export var num_screens: int = 3
@export var grid_array: Vector2 = Vector2(3,3)

func get_screen_dims() -> Vector2:
	return screen_dims
