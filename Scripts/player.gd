extends CharacterBody2D

signal levels_loaded

@export var speed = 5
var limit_pos_top = 0
var limit_pos_right = 0
var limit_pos_bottom = 0
var limit_pos_left = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.rooms_loaded.connect(_on_game_rooms_loaded)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	velocity = Vector2.ZERO	
	
	if Input.is_action_pressed("ui_up"):
		velocity.y = -1 * speed
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
	if Input.is_action_pressed("ui_down"):
		velocity.y = speed
	if Input.is_action_pressed("ui_left"):
		velocity.x = -1 * speed
		
	
	if global_position.y < limit_pos_top:
		global_position.y = limit_pos_top
		
	if global_position.x > limit_pos_right:
		global_position.x = limit_pos_right
		
	if global_position.y > limit_pos_bottom:
		global_position.y = limit_pos_bottom
		
	if global_position.x < limit_pos_left:
		global_position.x = limit_pos_left
	
	move_and_slide()
	
func _on_game_rooms_loaded():
	print("should do some shit")
	var rooms = get_tree().get_nodes_in_group("rooms")
	var half = round(float(len(rooms)) / 2) - 1
	var mid_room = rooms[half]
	var mid_room_rect = mid_room.find_child("Background").get_rect()
	var mid_room_center: Vector2 = Vector2(mid_room.global_position.x + mid_room_rect.size.x /2,
											mid_room.global_position.y + mid_room_rect.size.y /2) 
	global_position = mid_room_center
	
	limit_pos_top = rooms[0].global_position.y
	limit_pos_right = rooms[-1].global_position.x + mid_room_rect.size.x
	limit_pos_bottom = rooms[-1].global_position.y  + mid_room_rect.size.y
	limit_pos_left = rooms[0].global_position.x
	
