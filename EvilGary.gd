extends KinematicBody2D

var speed : Vector2
var velocity : Vector2
var turning : int

signal evilgaryhit
func _ready():
	speed = Vector2(30,0)
	velocity = Vector2(100,0)
	turning = 1
	
func _physics_process(delta):
	if turning > 0:
		$AnimatedSprite.animation = "turn"
		turning -= 1
	else:
		$AnimatedSprite.animation = "run"
		
	if velocity.x > 0:
		$AnimatedSprite.flip_h = false
	else:
		$AnimatedSprite.flip_h = true
	velocity = speed * velocity.normalized()
	if not (turning > 0):
		velocity = move_and_slide(velocity)


func _on_Area2D_body_entered(body):
	velocity.x = -velocity.x
	turning = 20
	emit_signal("evilgaryhit")
