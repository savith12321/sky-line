extends KinematicBody2D


const UP = Vector2(0, -1)
const ACCELERATION = 50
const MAX_SPEED = 200
const JUMP_HIGHT = 500
const GRAVITY = 20
var motion = Vector2()

func _physics_process(delta):
	motion.y += GRAVITY
	var friction = false
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
		$Sprite.play("run")
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)
		$Sprite.play("run")
	else:
		friction = true
		$Sprite.play("idle")
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = -JUMP_HIGHT
		if friction == true:
				motion.x = lerp(motion.x, 0, 0.2)
			
	else:
		$Sprite.play("jump")
		if friction == true:
				motion.x = lerp(motion.x, 0, 0.05)
	if Input.is_action_pressed("R"):
		get_tree().reload_current_scene()
	motion = move_and_slide(motion, UP)
