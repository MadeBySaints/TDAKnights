#Redundant

extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

#this script probably not nessary

# Called when the node enters the scene tree for the first time.
func _ready():
	var result = get_tree().change_scene("res://Core/Server.tscn")
	#should probably handle error if returned
	
	if(result != OK):
		print("Yikes: " + result)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
