extends KinematicBody2D

#Valeurs :
var JUMP_FORCE = -150
var JUMP_RELEASE_FORCE = -70
var MAX_SPEED = 75
var ACCELERATION = 10
var FRICTION = 10
var GRAVITY = 4
var ADDITIONAL_FALL_GRAVITY = 4

var trapcount =0

var bloody = false

var velocity = Vector2.ZERO

func _physics_process(delta):
	apply_gravity()
	var input = Vector2.ZERO
	input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if input.x == 0:
		apply_friction()
		if not bloody:
			$AnimatedSprite.animation = "idle"
		elif bloody:
			$AnimatedSprite.animation = "idlebloody"
	else:
		apply_acceleration(input.x)
		if not bloody:
			$AnimatedSprite.animation = "run"
		elif bloody:
			$AnimatedSprite.animation = "runbloody"
		if input.x > 0:
			$AnimatedSprite.flip_h = false
		if input.x < 0:
			$AnimatedSprite.flip_h = true
		
	if is_on_floor():
		if  Input.is_action_pressed("ui_up"):
			$jump.play()
			velocity.y = JUMP_FORCE
	else:
		if not bloody:
			$AnimatedSprite.animation = "fall"
		elif bloody:
			$AnimatedSprite.animation = "fallbloody"
			
		if  Input.is_action_just_pressed("ui_up") and velocity.y < JUMP_RELEASE_FORCE:
			velocity.y = JUMP_RELEASE_FORCE
			
		if velocity.y > 10:
			velocity.y += ADDITIONAL_FALL_GRAVITY
		
	velocity = move_and_slide(velocity, Vector2.UP)
	
func apply_gravity():
	velocity.y += GRAVITY
func apply_friction():
	velocity.x = move_toward(velocity.x, 0, FRICTION)
func apply_acceleration(amount):
	velocity.x = move_toward(velocity.x, MAX_SPEED * amount, ACCELERATION)
	
func _on_trap_dead():
	#On ajoute des debuffs quand on se prend un piège. 3 pièges = GAME OVER
	JUMP_FORCE += 30
	MAX_SPEED = MAX_SPEED / 1.5
	trapcount += 1
	$Label.text = str(trapcount)
	if MAX_SPEED < 25:
		queue_free()
		get_tree().change_scene("res://Game_over.tscn")
	bloody = true

func _on_meat_atemeat():
	JUMP_FORCE = -150
	MAX_SPEED = 75
	bloody = false
	
func _on_void_felldown():
	get_tree().change_scene("res://Game_over.tscn")

func _on_EvilGary_evilgaryhit():
	pass

func _on_WinArea_win():
	get_tree().change_scene("res://titlescreen.tscn")
