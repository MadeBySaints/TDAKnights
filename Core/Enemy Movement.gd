extends KinematicBody2D
class_name EnemyController

const NORM_SPEED = 25.0
const CHASE_SPEED = 40.0

var velocity = Vector2.ZERO

func _physics_process(delta):
	velocity = Vector2.ZERO
	pass

