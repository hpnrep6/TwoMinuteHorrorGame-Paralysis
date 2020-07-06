extends KinematicBody

const speed = 1.7
const slopeSpeed = 5
var acceleration = 10
var gravity = 9 # around 1.5x gravity
var jump = 2

var mouseSensitivity = 0.1

var direction = Vector3()
var velocity = Vector3()
var fall = Vector3()

var freeze = false
var ending = false

var fadeTime = 5

onready var head = $Head
onready var fade = $AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(deg2rad(-event.relative.x * mouseSensitivity))
		head.rotate_x(deg2rad(-event.relative.y * mouseSensitivity))
		head.rotation.x = clamp(head.rotation.x, deg2rad(-90), deg2rad(90))

func _physics_process(delta):
	if freeze == true:
		if ending == true:
			if fadeTime > 0:
				fadeTime -= delta
			else:
				returnToMenu()
			return
		return
	var hasMoved = false # variable to check if the player should be moving or not, prevents sliding down slopes (and stairs)
	var moveSpeed = speed
	
	direction = Vector3()
	if Input.is_action_pressed("moveForward"):
		hasMoved = true
		direction -= transform.basis.z
	elif Input.is_action_pressed("moveBackward"):
		hasMoved = true
		direction += transform.basis.z
	if Input.is_action_pressed("moveLeft"):
		hasMoved = true
		direction -= transform.basis.x
	elif Input.is_action_pressed("moveRight"):
		hasMoved = true
		direction += transform.basis.x
		
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			fall.y = jump
			hasMoved = true
		elif (get_floor_normal().y > 0.1 and get_floor_normal().y < 0.9):
			moveSpeed = slopeSpeed
	else:
		hasMoved = true
		fall.y -= gravity * delta

	direction = direction.normalized()
	velocity = velocity.linear_interpolate(direction * moveSpeed, acceleration * delta)
	if hasMoved == true:
		velocity = move_and_slide(velocity, Vector3.UP)
		move_and_slide(fall, Vector3.UP)
		
func getLight():
	head.enableLight()
	
func freeze():
	freeze = true

func endGame():
	ending = true
	fade.play("FadeBlack")

func returnToMenu():
	get_tree().change_scene("res://Scenes/StartMenu.tscn")

