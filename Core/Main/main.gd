#Redundant

extends Node

class_name Main

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Application started")
	
	#If the server tag is not found then the application is a client
	
	var result
	
	if(OS.has_feature("Server")):
		print("is server")
		#make the server the main scene
		
		result = get_tree().change_scene("res://Core/Server.tscn")
		
	else:
		print("is client")
		#probably check whether or not to run a test server here
		result = get_tree().change_scene("res://Core/Game.tscn")
	
	if(result != OK):
		print("Yikes: " + result)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
