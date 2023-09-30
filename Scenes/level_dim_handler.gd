extends Area2D
# This script is solely to pass off this Node's position and size to whoever asks for it
@onready var bg : TextureRect = $"../Background"
signal loc_and_size(size)
var pos_and_size

func how_big_am_i():
	pos_and_size = bg.get_rect()
	pos_and_size = {"position": global_position, "size": pos_and_size.size}

func _on_body_entered(body):
	if body.name == "Player":
		how_big_am_i()
		emit_signal("loc_and_size", pos_and_size)
