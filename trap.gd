extends KinematicBody2D

signal dead
var isOpened = true

func _on_Area2D_body_entered(body):
	$AnimatedSprite.animation = "closed"
	if isOpened:
		$beartrapaudio.play()
		isOpened = false
		emit_signal("dead")
	else:
		pass
