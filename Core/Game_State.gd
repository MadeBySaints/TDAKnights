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

# Called when the node enters the scene tree for the first time.
func _ready():
	var tree = get_tree()
	
	tree.connect("connected_to_server", self, "on_connected_to_server") #_connected_ok
	tree.connect("connection_failed", self, "on_connection_failed")		#_connected_fail
	tree.connect("server_disconnected", self, "on_server_disconnected")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func connect_to_server():
	var host = NetworkedMultiplayerENet.new()
	host.create_client(IP, PORT)
	get_tree().set_network_peer(host)
	
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
	
