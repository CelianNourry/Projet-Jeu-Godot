extends Control



func _on_Play_again_pressed():
	$click.play()
	get_tree().change_scene("res://Main.tscn")


func _on_Quitter_pressed():
	$click.play()
	get_tree().quit()
