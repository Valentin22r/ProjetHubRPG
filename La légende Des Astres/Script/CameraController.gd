extends Node3D

var MOUSE_SENSITIVITY = 0.003
var _tilt_input : float
var _mouse_input : bool = false
var BulletScene = preload("res://Scene/bullet.tscn")

func _unhandled_input(event):
	_mouse_input = event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED
	if _mouse_input:
		_tilt_input = -event.relative.y * MOUSE_SENSITIVITY
		if (rotation_degrees.x < 90 and rotation_degrees.x > -90):
			rotate(Vector3(1, 0, 0), _tilt_input)
		if (rotation_degrees.x >= 90):
			rotation_degrees.x -= 1
		if (rotation_degrees.x <= -90):
			rotation_degrees.x += 1
