extends PlayerController
class_name Player
var max_health = 50
var health = 50


func _ready():
	pass

func _process(_delta):
	if health == 0:
		death()

func _input(_ev):
	if Input.is_key_pressed(KEY_K):
		health = 0
	print_debug(health)

func init():
	pass

func respwan():
	health = max_health
	set_position(global.map.get_node(global.last_checkpoint).get_position())
	pass

func death():
	# make corpse and despwan it
	respwan()
	pass
