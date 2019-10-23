extends KinematicBody2D

var motion = Vector2()
var grav = 30
var jmp = -600
var mSpd = 400
var jmpNum = 0
const jmpMax = 2
const UP = Vector2(0, -1)


func _physics_process(delta):
	if Input.is_key_pressed(KEY_D) && !Input.is_key_pressed(KEY_A):
		motion.x = mSpd
		#$AnimatedSprite.flip_h = false
		#$AnimatedSprite.play("Run")
	elif Input.is_key_pressed(KEY_A) && !Input.is_key_pressed(KEY_D):
		motion.x = -mSpd
		#$AnimatedSprite.flip_h = true
		#$AnimatedSprite.play("Run")
	else:
		motion.x = 0
		#$AnimatedSprite.play("Idle")
		
	if Input.is_key_pressed(KEY_SPACE) && is_on_floor():
		motion.y = jmp
		jmpNum += 1
	elif Input.is_key_pressed(KEY_SPACE) && !is_on_floor() && jmpNum < jmpMax:
		motion.y = jmp
		jmpNum += 1
	
	#if !is_on_floor() && motion.y > 0:
		#$AnimatedSprite.play("Rise")
	#elif !is_on_floor() && motion.y <= 0:
		#$AnimatedSprite.play("Fall")
	
	if !is_on_floor():
		motion.y += grav
	else:
		jmpNum = 0
	
	move_and_slide(motion, UP)
	pass