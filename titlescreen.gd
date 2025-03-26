extends Control



func _on_Quitter_pressed():
	$click.play()
	get_tree().quit()


func _on_Credits_pressed():
	pass


func _on_Jouer_pressed():
	$click.play()
	get_tree().change_scene("res://levels.tscn")
