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

func init():
	pass

func respawn():
	health = max_health
	set_position(Game_State.map.get_node(Game_State.last_checkpoint).get_position())
	pass

func death():
	# make corpse and despwan it
	respawn()
	pass
