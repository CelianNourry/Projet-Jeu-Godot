extends KinematicBody2D
signal win

func _on_Area2D_body_entered(body):
	emit_signal("win")
