extends KinematicBody2D

signal atemeat
var iseaten = false

func _on_Area2D_body_entered(body):
	$AnimatedSprite.animation = "void"
	if not iseaten:
		$meat.play()
		emit_signal("atemeat")
		iseaten = true
	else:
		pass
