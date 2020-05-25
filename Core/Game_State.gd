#thee network node - all communication is routed through here

#the game and loaded world nodes connect to signals of this node but are NOT added as children

#the relevant signals are connected

#there may be child nodes added that deal with different areas later on depending on how crowded things get

extends Node

#class_name Game_State

#Game port and IP

const IP = "127.0.0.1"

const PORT = 4200

#removed redundant signals

#signal connection_failed()
#signal connection_succeeded()
#signal disconnected_from_server() #server_disconnected

#when a playe has been/registered/deregitered

signal players_updated()



var myName = "Client"

#Players dictionary format: id:name
var myPlayers = {}

#From Global.gd

var INVENTORY_PATH = "res://inventory/"

var main = null
var main_menu = null

var ui = null
var ui_spells = null
var ui_active_spells = null

var ui_stats_tab = null
var ui_stats = null
var ui_inventory = null

var menu = null #Game.gd

var last_checkpoint = "World Objects/spawn1"

#Stats
var map = null		#Currently loaded map
var player = null setget player_set, player_get #:Player

#var pendingServerCalls = []

var pendingServerCalls = {}

#var is_multiplayer:bool = false

#methods to be called from the server

enum ServerCalls{
	
	REGISTER_PLAYER,
	GET_MAP_CLIENT,
	UNREGISTER_PLAYER
	
}

##

#var test_call_result : bool = false setget test_call_result_set, test_call_result_get

#master func test_call_result_set(new_value):
#	test_call_result = new_value

#func test_call_result_get():
#	return test_call_result

# Called when the node enters the scene tree for the first time.
func _ready():
	
	print("_ready(): Game_State")
	
	var tree = get_tree()
	
	tree.connect("connected_to_server", self, "on_connected_to_server") #_connected_ok
	tree.connect("connection_failed", self, "on_connection_failed")		#_connected_fail
	tree.connect("server_disconnected", self, "on_server_disconnected")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func connect_to_server(ip = IP, port = PORT): #port is apparently not an int which is not what I would have expected
	var host = NetworkedMultiplayerENet.new()
	
	#crashes the engine if the is no server to connect to and host is the passed to set_network_peer
	
	var result = host.create_client(ip, int(port))
	
	if result != OK:
		#emit_signal("connection_failed")
		
		print("connect_to_server - error: " + result)
		
		return
		
	get_tree().set_network_peer(host)
	
	#Can't find a method on NetworkedMultiplayerENet that conveniently allows me to check if a connection works
	
	#var sTree : SceneTree = get_tree()
	
	#sTree.set_network_peer(host)
	

	
	#Test connection method call
	
	#var test_result : bool = rpc_id(1, "test_call")
	
	#call a method on the server to see if we're really connected
	
	#this then calls "test_call_result_set" via rset("test_call_result")
	
	#rpc_id(1, "test_call", )
	
	#or just use this:
	
	#if sTree.network_peer.get_connection_status() == 2:
	#	pass

#sets which method will be called by the server and aproximately when it calling rpc method was called in OS millisecond ticks

func set_pending_server_calls(method_to_be_called:String):
	pendingServerCalls[method_to_be_called] = OS.get_ticks_msec()

func get_pending_server_calls():
	return pendingServerCalls.duplicate()

func get_pending_server_calls_count():
	return pendingServerCalls.size()

func get_pending_server_calls_empty():
	return pendingServerCalls.empty()
	
#client methods that call server methods

#rpcd to:, rpcd from 

#server: "register_player", client: "register_player"

#server: "get_map_client", client: "set_map_client" 



#Callback for the SceneTree, called when connected to the server
func on_connected_to_server():
	#emit_signal("connection_succeeded")
	
	print("connection succeeded!")
	
	#client game initailised
	
	#if game is running, stop game
	
	#register this client with the server
	rpc_id(1, "register_player", myName)
	
	set_pending_server_calls("register_player")
	
	#pendingServerCalls.push_front(ServerCalls.REGISTER_PLAYER)
	
	#is_multiplayer = true
	
	#client game start
	
	rpc_id(1, "get_map_client")
	
	set_pending_server_calls("set_map_client")
	
	#pendingServerCalls.push_front(ServerCalls.GET_MAP_CLIENT)
	
	#now in the state of waiting for player being registered and map load being confirmed
	
	#make a note of what is being waited for - put it in an array or something

#Callback for the SceneTree, called when disconnected to the server	
func on_server_disconnected():
	
	print("client disconnected")
	
	myPlayers.clear()
	#emit_signal("disconnected_from_server")
	
	pendingServerCalls.clear()
	
	#stop game and return to menu
	
	main.remove_child(map)
	
	main.add_child(main_menu)
	
	#set map and player to null
	
	map = null
	
	player = null
	
	#Try to connect again?
	#connect_to_server()
	
#Callback for the SceneTree, called when unable to the server

#~Object: Object [Object:1341] was freed or unreferenced while a signal is being emitted from it. Try connecting to the signal using 'CONNECT_DEFERRED' flag, or use queue_free() to free the object (if this object is a Node) to avoid this error and potential crashes.

#shouldn't need to de-reference of the network peer when the conection fails
 
#func on_connection_failed():
#	get_tree().set_network_peer(null)
	#emit_signal("connection_failed")

	#Try to connect again?
	#connect_to_server()

func is_connected_to_server():
	return get_tree().network_peer.get_connection_status() == NetworkedMultiplayerPeer.CONNECTION_CONNECTED

#player registration - regitered locally - called from register_player on the server

puppet func register_player(id, newPlayerData): #, server_map):
	
	pendingServerCalls.erase("register_player")
	
	print("register_player called")
	
	myPlayers[id] = newPlayerData
	emit_signal("players_updated")
	
	#loads player
	
	#player = load("res://Core/Player.tscn").instance()
	
	player_set(load("res://Core/Player.tscn").instance())
	
	#future: select which player based on var
	
	#get map on server in this method and set it up here
	
	#print("Load Map: " + server_map)
	
	#just load the default map for now
	
	#map = load("res://Maps/World1-1.tscn").instance()
	

#unrestered locally - called from unregister_player on the server - when a player disconnects

puppet func unregister_player(id):
	myPlayers.erase(id)
	emit_signal("players_updated")
	
#map

#called from get_map_client on the server

puppet func set_map_client(server_map):
	
	pendingServerCalls.erase("set_map_client")
	
	print("set_map_client called")
	
	print("Load Map: " + server_map)
	
	#Load map
	
	map = load("res://Maps/World1-1.tscn").instance()
	
	main.add_child(map)
	
	map.get_node("World Objects").add_child(player)
	
	player.set_position(map.get_node(last_checkpoint).get_position())

	main.remove_child(main_menu)
	
	#game started

#Returns a list of player names
func get_player_list():
	return myPlayers.values()
	
#puppet func pre_start_game():
	#get_node("/root/Main").hide() #hide something?
	#var world = load("res://Maps/World1-1.tscn")
	#get_tree().get_root().add_child(world)
	
	#Then add players to the world node at some point
	
	#rpc_id(1, "populate_world")
	#pass
	
func player_set(thePlayer): #:Player
	
	#listen to player
	
	if(player != null):
		player.disconnect("moved", self, "on_player_moved")
	
	if(thePlayer != null):
		thePlayer.connect("moved", self, "on_player_moved")
	
	player = thePlayer

func player_get():
	return player
	
func on_player_moved(position, velocity, last_dir):
	
	#report player movement to the server
	
	#does not call replying rpc method
	
	rpc_unreliable_id(1, "on_player_moved_server", position, velocity, last_dir)
	
	

#client connected/game started on client

#func connected_startup():
	
#	rpc_id(1, "get_server_game_info")

	
	
#	pass

#does not call replying rpc method

func disconnect_client():
	#rpc_id(1, "disconnect_client")
	get_tree().set_network_peer(null)
