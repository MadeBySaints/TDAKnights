#An "abstract class" for all world objects

extends Node

class_name TDAKWorld
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

puppet func spawn_player(spawn_pos, id):
	var player = Game_State.player #assumes player has already been loaded
	
	
	player.positiotion = spawn_pos 
	player.name = String(id)
	player.set_network_manster(id)
	
	#$World Objects
	get_node("World Objects").add_child(player)

puppet func remove_player(id):
	get_node("World Objects").get_node(String(id)).queue_free()
