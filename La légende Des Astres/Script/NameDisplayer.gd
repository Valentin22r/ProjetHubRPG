extends RichTextLabel

func _process(delta):
	text = str(PlayerData.name) + " " + str(PlayerData.PlayerTitle)
	
