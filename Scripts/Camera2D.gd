extends Camera2D

var player 

var rooms

var u_bound = 0
var r_bound = 1920
var d_bound = 1820
var l_bound = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node("..")
	var game_node = player.get_parent()
	game_node.rooms_loaded.connect(connect_signals_on_level_load)
	limit_top = u_bound
	limit_right = r_bound
	limit_bottom = d_bound
	limit_left = l_bound
	
	
func connect_signals_on_level_load():
	rooms = get_tree().get_nodes_in_group("rooms")
	for room in rooms:
		var area = room.find_child("Area2D")
		area.body_entered.connect(_on_body_entered)
		area.loc_and_size.connect(_loc_and_size)

func _loc_and_size(pos_and_size):
	print(pos_and_size.position, pos_and_size.size)
	u_bound = pos_and_size.position.y
	r_bound = pos_and_size.position.x + pos_and_size.size.x
	d_bound = (pos_and_size.position.y + pos_and_size.size.y)
	l_bound = pos_and_size.position.x
	

func _on_body_entered(body):
	if "Player" in body.name:
		limit_top = u_bound
		print("top ", u_bound)
		limit_right = r_bound
		print("right ", r_bound)
		limit_bottom = d_bound
		print("down ", d_bound)
		limit_left = l_bound
		print("left ", l_bound)


