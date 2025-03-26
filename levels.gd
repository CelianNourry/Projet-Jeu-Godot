extends Control



func _on_level1_button_pressed():
	$click.play()
	get_tree().change_scene("res://Main.tscn")


func _on_Retour_pressed():
	$click.play()
	get_tree().change_scene("res://titlescreen.tscn")
