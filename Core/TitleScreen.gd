extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button2_pressed():
	pass # Replace with function body.


func _on_Button_pressed():
	Game_State.main.start_game()
	
	#start_game()
	
	pass
	
#moved from main.gd - oops - main "is" Game

#func start_game():
#	var result = get_tree().change_scene("res://Core/Game.tscn")
	
#	if(result != OK):
#		print("Yikes: " + result)
