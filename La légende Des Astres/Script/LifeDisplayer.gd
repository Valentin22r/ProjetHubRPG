extends RichTextLabel

func _process(delta):
	text = str(PlayerData.life) + "/" + str(PlayerData.maxlife) 
