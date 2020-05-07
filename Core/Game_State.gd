#the "root" network node

extends Node

#class_name Game_State

#Game port and IP

const IP = "127.0.0.1"

const PORT = 4200

signal connection_failed()
signal connection_succeeded()
signal disconnected_from_server() #server_disconnected
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

var menu = null

var last_checkpoint = "World Objects/spawn1"

#Stats
var map = null		#Currently loaded map
var player = null

##

var test_call_result : bool = false setget test_call_result_set, test_call_result_get

master func test_call_result_set(new_value):
	test_call_result = new_value

master func test_call_result_get():
	return test_call_result

# Called when the node enters the scene tree for the first time.
func _ready():
	var tree = get_tree()
	
	tree.connect("connected_to_server", self, "on_connected_to_server") #_connected_ok
	tree.connect("connection_failed", self, "on_connection_failed")		#_connected_fail
	tree.connect("server_disconnected", self, "on_server_disconnected")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func connect_to_server(ip = IP, port = PORT):
	var host = NetworkedMultiplayerENet.new()
	
	#crashes the engine if the is no server to connect to and host is the passed to set_network_peer
	
	var result = host.create_client(ip, port)
	
	if result != OK:
		emit_signal("connection_failed")
		
		print("connect_to_server - error: " + result)
		
		return
		
	#Can't find a method on NetworkedMultiplayerENet that conveniently allows me to check if a connection works
	
	get_tree().set_network_peer(host)
	
	#Test connection method call
	
	#var test_result : bool = rpc_id(1, "test_call")
	
#Callback for the SceneTree, called when connected to the server
func on_connected_to_server():
	emit_signal("connection_succeeded")
	
	#register this client with the server
	rpc_id(1, "register_player", myName)

#Callback for the SceneTree, called when disconnected to the server	
func on_server_disconnected():
	myPlayers.clear()
	emit_signal("disconnected_from_server")
	
	#Try to connect again?
	#connect_to_server()
	
#Callback for the SceneTree, called when unable to the server
func on_connection_failed():
	get_tree().set_network_peer(null)
	emit_signal("connection_failed")

	#Try to connect again?
	#connect_to_server()
	
puppet func register_player(id, newPlayerData):
	myPlayers[id] = newPlayerData
	emit_signal("players_updated")
	
puppet func unregister_player(id):
	myPlayers.erase(id)
	emit_signal("players_updated")

#Returns a list of player names
func get_player_list():
	return myPlayers.values()
	
puppet func pre_start_game():
	#get_node("/root/Main").hide() #hide something?
	var world = load("res://Maps/World1-1.tscn")
	get_tree().get_root().add_child(world)
	
	#Then add players to the world node at some point
	
	rpc_id(1, "populate_world")
	
