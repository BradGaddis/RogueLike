extends CharacterBody2D

signal levels_loaded

@export var speed = 5
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


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
		
	move_and_slide()
	
