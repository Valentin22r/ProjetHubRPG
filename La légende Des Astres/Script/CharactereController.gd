extends CharacterBody3D

var MOUSE_SENSITIVITY = 0.003
var SPEED = 5.0
const JUMP_VELOCITY = 10
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var _mouse_input : bool = false
var _rotation_input : float
var life = 3

# Sprint and close
func _input(event):
	if event.is_action_pressed("exit"):
		get_tree().quit()
	if event.is_action_pressed("sprint"):
		SPEED = 10
	if event.is_action_released("sprint"):
		SPEED = 5

# Camera
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _unhandled_input(event):
	_mouse_input = event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED
	if _mouse_input:
		_rotation_input = -event.relative.x * MOUSE_SENSITIVITY
		rotate(Vector3(0, 1, 0), _rotation_input)

# Mouvement 
func _physics_process(delta):
	var input_dir = Input.get_vector("left", "right", "forward", "backward")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()

	if not is_on_floor():
		velocity.y -= gravity * delta * 3
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

func _on_area_3d_area_entered(area):
	life -= 1
	if life == 0:
		get_tree().change_scene_to_file("res://Scene/Game.tscn")
