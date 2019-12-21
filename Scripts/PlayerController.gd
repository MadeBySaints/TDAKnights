extends KinematicBody2D
class_name PlayerController

const MAX_SPEED = 50
const ACCEL = 350
var velocity = Vector2()


func _ready():
	pass

#func _input(event):
#	if event.is_action_pressed("Attack"):
#		#get nearest enemy and if within range attack with equipped weapon.
#		pass

func _physics_process(delta):
	
	velocity = move_and_slide(velocity)
	#check vertical movement
	if Input.is_action_pressed("MoveDown"):
		velocity.y = min(velocity.y + ACCEL * delta, MAX_SPEED)
		$AnimatedSprite.play("moving")
	elif Input.is_action_pressed("MoveUp"):
		velocity.y = max(velocity.y - ACCEL * delta, -MAX_SPEED)
		$AnimatedSprite.play("moving")
	else:
		velocity.y = 0
	#check horizontal movement
	if Input.is_action_pressed("MoveLeft"):
		velocity.x = max(velocity.x - ACCEL * delta, -MAX_SPEED)
		$AnimatedSprite.play("moving")
		$AnimatedSprite.set_flip_h(false)
	elif Input.is_action_pressed("MoveRight"):
		velocity.x = min(velocity.x + ACCEL * delta, MAX_SPEED)
		$AnimatedSprite.play("moving")
		$AnimatedSprite.set_flip_h(true)
	else:
		velocity.x = 0
	
	if Input.is_action_pressed("MoveLeft") and Input.is_action_pressed("MoveRight"):
		velocity.x = 0
	if Input.is_action_pressed("MoveUp") and Input.is_action_pressed("MoveDown"):
		velocity.y = 0
	
	if velocity.x == 0 and velocity.y == 0:
		$AnimatedSprite.play("idle")
		
