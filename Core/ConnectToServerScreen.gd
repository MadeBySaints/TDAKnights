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
	Game_State.connect("connection_failed", self, "on_connection_failed")
	Game_State.connect("server_disconnected", self, "on_server_disconnected")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_ConnectToServerButton_pressed():
	
	Game_State.connect_to_server($IPAddressLineEdit.text, $PortLineEdit.text)
	
	var nmp : NetworkedMultiplayerPeer = Game_State.get_tree().network_peer
	
	#Ok, it seemms that when you try to connect to a server that does not exist the network_peer of the scene tree does not get initalised
	
	#the connection_status tests may be redundant and there are signals connected to the Game_State node that address the connection state
	
	if nmp == null:
	
		$OutputLabel.text = "Connection Error"
		
	elif nmp.get_connection_status() == NetworkedMultiplayerPeer.CONNECTION_DISCONNECTED:
		
		$OutputLabel.text = "NetworkedMultiplayerPeer.CONNECTION_DISCONNECTED"
		
	elif nmp.get_connection_status() == NetworkedMultiplayerPeer.CONNECTION_CONNECTING:
		
		$OutputLabel.text = "NetworkedMultiplayerPeer.CONNECTION_CONNECTING"
		
	elif nmp.get_connection_status() == NetworkedMultiplayerPeer.CONNECTION_CONNECTED:
		
		$OutputLabel.text = "NetworkedMultiplayerPeer.CONNECTION_CONNECTED"
	
	pass
	
func _on_BackButton_pressed():
	
	#switch out scenes
	
	Game_State.main.remove_child(self)
	
	Game_State.main.add_child(Game_State.main_menu)
	
	pass
	
func on_connected_to_server():
	
	Game_State.main.remove_child(self)
	
	#Game_State.main.pre_start_game()
	
	Game_State.disconnect("connected_to_server", self, "on_connected_to_server")
	Game_State.disconnect("connection_failed", self, "on_connected_to_server")
	
	pass
	


func on_connection_failed():
	
	$OutputLabel.text = "Connection Error"
	
	Game_State.disconnect("connected_to_server", self, "on_connected_to_server")
	Game_State.disconnect("connection_failed", self, "on_connected_to_server")
	
	pass
	
func on_server_disconnected():
	
	$OutputLabel.text = "Connection Error"
	
	Game_State.disconnect("connected_to_server", self, "on_connected_to_server")
	Game_State.disconnect("connection_failed", self, "on_connected_to_server")
	
	pass
