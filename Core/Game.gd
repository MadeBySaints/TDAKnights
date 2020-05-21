extends Node

func _ready():
	
	print("_ready(): Game")
	
	Game_State.main = self
	Game_State.main_menu = load("res://Core/TitleScreen.tscn").instance()
	reload_game()
	add_child(Game_State.main_menu)

func reload_game():
	for c in get_children():
		c.queue_free()

func _notification(what):
	if (what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST):
		save_game()
		get_tree().quit()

#starts a single player game

func start_game():
	
	#check if ready to load if multiplayer
	
	#load map
	
	#load player
	
	#probably have a loading screen
	
	#if(Game_State.is_connected_to_server()):
		
		#get loaded map from server
		
		
		
		#pass
	
	#the singleplayer game mopde can only on be played in the editor 
	
	if(OS.has_feature("editor")):
	
		Game_State.map = load("res://Maps/World1-1.tscn").instance()
		
		Game_State.player = load("res://Core/Player.tscn").instance()
		#Game_State.player.init() #calling instance should call the players _ready method - https://docs.godotengine.org/en/stable/classes/class_packedscene.html#class-packedscene-method-instance
		
		add_child(Game_State.map)
	
		#Game_State.add_child(Game_State.map)
	
		#Precceding and following steps should probably be done in Game_State
	
		Game_State.map.get_node("World Objects").add_child(Game_State.player)
	
		Game_State.player.set_position(Game_State.map.get_node(Game_State.last_checkpoint).get_position())
	
		remove_child(Game_State.main_menu)
		
	else:
		
		#if the player is not connected to the server and is not in the editor the game quits 
		
		push_error("Cannot start game")
		
		get_tree().quit()



func load_game():
	var savegame = File.new()
	if(!savegame.file_exists("user://savegame.save")):
		Game_State.player = load("res://Core/Player.tscn").instance()
		return
#	var savenodes = get_tree().get_nodes_in_group("Persist")
#	for i in savenodes:
#		i.queue_free()
	var currentline = {}
	savegame.open_encrypted_with_pass("user://savegame.save", File.READ, "6b3a55e0261b0304143f805a24924d0c1c44524821305f31d9277843b8a10f4e")
	while (!savegame.eof_reached()):
		currentline.parse_json(savegame.get_line())
		var newobject = load(currentline["filename"]).instance()
		newobject.set_pos(Vector2(currentline["posx"],currentline["posy"]))
		for i in currentline.keys():
			if (i == "filename" or i == "parent" or i == "posx" or i == "posy"):
				continue
			newobject.set(i, currentline[i])
	savegame.close()

func save_game():
	var savegame = File.new()
	savegame.open_encrypted_with_pass("user://savegame.save", File.WRITE, "6b3a55e0261b0304143f805a24924d0c1c44524821305f31d9277843b8a10f4e")
	var savenodes = get_tree().get_nodes_in_group("Persist")
	for i in savenodes:
		var nodedata = i.save()
		savegame.store_line(nodedata.to_json())
#	var nodedate = global.player.save()
	savegame.close()
