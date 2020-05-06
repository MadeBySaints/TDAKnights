extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	#var tree = get_tree()
	
	#tree.connect("connected_to_server", self, "on_connected_to_server") #_connected_ok
	#tree.connect("connection_failed", self, "on_connection_failed")		#_connected_fail
	Game_State.connect("connected_to_server", self, "on_connected_to_server")
	Game_State.connect("connection_failed", self, "on_server_disconnected")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_ConnectToServerButton_pressed():
	
	
	
	pass
	
func _on_BackButton_pressed():
	
	#"res://Core/ConnectToServer.tscn"
	
	Game_State.connect_to_server($IPAddressLineEdit.text, $PortLineEdit.text)
	
	
	pass
	
func on_connected_to_server():
	
	Game_State.main.remove_child(self)
	
	#Game_State.main.pre_start_game()
	
	Game_State.disconnect("connected_to_server", self, "on_connected_to_server")
	Game_State.disconnect("connection_failed", self, "on_connected_to_server")
	
	pass
	


func on_server_disconnected():
	
	$OutputLabel.text = "Connection Error"
	
	Game_State.disconnect("connected_to_server", self, "on_connected_to_server")
	Game_State.disconnect("connection_failed", self, "on_connected_to_server")
	
	pass
