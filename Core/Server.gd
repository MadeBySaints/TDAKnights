#Redundant

extends Node

class_name Server

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const IP = '127.0.0.1'
const PORT = 31400 #From \godot-demos\2018\07-30-2018-multiplayer-high-level-api should probably change

var myPort: int #the port used by the server

func _init(port: int = PORT):
	myPort = port


# Called when the node enters the scene tree for the first time.
func _ready():
	var server = NetworkedMultiplayerENet.new()
	server.create_server(IP, myPort)
	var scTree = get_tree()
	scTree.network_peer = server
	if(scTree.is_network_server()):
		print("Server Initialised")
	else:
		print("Error" + str(scTree.network_peer))

func uses_default_port() -> bool:
	return myPort == PORT 

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
