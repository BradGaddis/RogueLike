extends Camera2D

var player 

var screen_height = 1080 
var screen_width = 1920

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node("..")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Update_Camera_Limit()

func Update_Camera_Limit():
	var player_pos = player.global_position
#	print(player_pos)
	
	if player_pos.x >= 1920:
		limit_right = 1920*2
