extends Node

class_name Main

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Application started")
	
	#If the server tag is not found then the application is a client
	
	if(OS.has_feature("Server")):
		print("is server")
		#instantiate and run server
	else:
		print("is client")
		#probably check whether or not to run a test server here
		var result = get_tree().change_scene("res://Scenes/Game.tscn")
		#should probably handle error if returned
		
		if(result != OK):
			print("Yikes: " + result)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
