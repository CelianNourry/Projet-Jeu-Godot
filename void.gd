extends KinematicBody2D

signal felldown

func _on_Area2D_body_entered(body):
	emit_signal("felldown")
