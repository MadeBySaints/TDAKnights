extends Control

func _ready():
	var gsTree : SceneTree = Game_State.get_tree()
	
	#tree.connect("connected_to_server", self, "on_connected_to_server") #_connected_ok
	#tree.connect("connection_failed", self, "on_connection_failed")		#_connected_fail
	gsTree.connect("connected_to_server", self, "on_connected_to_server")
	gsTree.connect("connection_failed", self, "on_connection_failed")
	gsTree.connect("server_disconnected", self, "on_server_disconnected")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_ConnectToServerButton_pressed():
	
	Game_State.connect_to_server($IPAddressLineEdit.text, $PortLineEdit.text)
	
	var nmp : NetworkedMultiplayerPeer = Game_State.get_tree().network_peer
	
	if nmp == null:
	
		$OutputLabel.text = "Connection Error"
		
	elif nmp.get_connection_status() == NetworkedMultiplayerPeer.CONNECTION_DISCONNECTED:
		
		$OutputLabel.text = "NetworkedMultiplayerPeer.CONNECTION_DISCONNECTED"
		
	elif nmp.get_connection_status() == NetworkedMultiplayerPeer.CONNECTION_CONNECTING:
		
		$OutputLabel.text = "NetworkedMultiplayerPeer.CONNECTION_CONNECTING"
		
	elif nmp.get_connection_status() == NetworkedMultiplayerPeer.CONNECTION_CONNECTED:
		
		$OutputLabel.text = "NetworkedMultiplayerPeer.CONNECTION_CONNECTED"
	
	#disable the ConnectToServerButton while the client connects
	
	$ConnectToServerButton.disabled = true
	
func _on_BackButton_pressed():
	
	#switch out scenes
	
	Game_State.main.remove_child(self)
	
	Game_State.main.add_child(Game_State.main_menu)
	
	
func on_connected_to_server():
	
	Game_State.main.remove_child(self)
	
	Game_State.disconnect("connected_to_server", self, "on_connected_to_server")
	Game_State.disconnect("connection_failed", self, "on_connected_to_server")
	
	#Game_State.main.pre_start_game()
	

func on_connection_failed():
	
	$OutputLabel.text = "Connection Error"
	
	#Game_State.disconnect("connected_to_server", self, "on_connected_to_server")
	#Game_State.disconnect("connection_failed", self, "on_connected_to_server")
	
	$ConnectToServerButton.disabled = false
	
func on_server_disconnected():
	
	$OutputLabel.text = "Connection Error"
	
	#Game_State.disconnect("connected_to_server", self, "on_connected_to_server")
	#Game_State.disconnect("connection_failed", self, "on_connected_to_server")
	
	$ConnectToServerButton.disabled = false
