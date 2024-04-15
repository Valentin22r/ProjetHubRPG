extends Node

var PlayerScene = preload("res://Scene/player.tscn")

func _ready():
	var player = PlayerScene.instantiate()
	player.position.x = 0
	player.position.y = 2
	player.position.z = 0
	add_child(player)
