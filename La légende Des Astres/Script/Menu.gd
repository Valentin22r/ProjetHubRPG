extends Control


func _on_new_game_pressed():
	get_tree().change_scene_to_file("res://Scene/NewGame.tscn")

func _on_load_pressed():
	get_tree().change_scene_to_file("res://Scene/NewGame.tscn")

func _on_quit_pressed():
	get_tree().quit()
