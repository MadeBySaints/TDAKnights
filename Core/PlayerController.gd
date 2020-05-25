extends KinematicBody2D
class_name PlayerController

const MAX_SPEED:int = 50
const ACCEL:int = 350
var velocity:Vector2 = Vector2()
var last_dir:String


signal moved(pos, velocity, last_dir) #Vector2, String

func _ready():
	pass

func _physics_process(delta):
	
	velocity = move_and_slide(velocity)
	#velocity = move_and_slide(velocity.normalized() / delta)
	
	#check vertical movement
	
	#move signals are emitted so they can be sent to the server
	
	if Input.is_action_pressed("MoveDown"):
		velocity.y = min(velocity.y + ACCEL * delta, MAX_SPEED)
		$AnimatedSprite.play("walk down")
		last_dir = "down"
		
		emit_signal("moved", position, velocity, last_dir)
		
	elif Input.is_action_pressed("MoveUp"):
		velocity.y = max(velocity.y - ACCEL * delta, -MAX_SPEED)
		$AnimatedSprite.play("walk up")
		last_dir = "up"
		
		emit_signal("moved", position, velocity, last_dir)
		
	else:
		velocity.y = 0
	#check horizontal movement
	if Input.is_action_pressed("MoveLeft"):
		velocity.x = max(velocity.x - ACCEL * delta, -MAX_SPEED)
		$AnimatedSprite.play("walk left")
		last_dir = "left"
		
		emit_signal("moved", position, velocity, last_dir)
			
	elif Input.is_action_pressed("MoveRight"):
		velocity.x = min(velocity.x + ACCEL * delta, MAX_SPEED)
		$AnimatedSprite.play("walk right")
		last_dir = "right"
		
		emit_signal("moved", position, velocity, last_dir)
		
	else:
		velocity.x = 0
	
	if Input.is_action_pressed("MoveLeft") and Input.is_action_pressed("MoveRight"):
		velocity.x = 0
	if Input.is_action_pressed("MoveUp") and Input.is_action_pressed("MoveDown"):
		velocity.y = 0
	
	if velocity.x == 0 and velocity.y == 0:
		if last_dir == "left":
			$AnimatedSprite.play("idle left")
		elif last_dir == "right":
			$AnimatedSprite.play("idle right")
		elif last_dir == "up":
			$AnimatedSprite.play("idle up")
		elif last_dir == "down":
			$AnimatedSprite.play("idle down")
		else:
			$AnimatedSprite.play("idle down")
	
	#Started work on an in-game menu input
	
	#if Input.is_action_pressed("Escape"):
		
		#var menu = Game_State.main_menu
		
		#if menu.visible:
		#	menu.hide()
		#else:
		#	menu.show()
		
	

