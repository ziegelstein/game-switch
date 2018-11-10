extends Node

#### GLOBAL VARS ####
var player_values = {}
var magazin = 8
var player_sprite = Sprite.new()
var sound_registry = init_registry("res://Media/sounds/player_sounds.csv")

func _ready():
	"""Is called on creation of the player node"""
	set_player_values
	register_sounds(sound_registry)
	add_child(player_sprite)
	player_sprite.draw_texture_rect(Texture.new(), Rect2(10, 10, 10, 10), true, Color(1, 1, 1, 1), false, null)
	pass

func _process(delta):
	check_collision()
	pass

func set_player_values():
	"""Sets the simple player values. TODO - import from json"""
	# Movement Values
	player_values["base_speed"] = 1
	player_values["speed_modifier"] = 1
	# Health and Defence
	player_values["base_health"] = 100
	player_values["current_health"] = player_values["base_health"]
	player_values["base_defense"] = 1
	player_values["defense_modifier"] = 1
	# Attack Values
	player_values["base_damage"] = 10
	player_values["damage_modifier"] = 1
	player_values["attack_speed"] = 1
	player_values["magazine_size"] = 8
	player_values["bullet_size"] = 1
	player_values["bullet_speed"] = 1
	pass

func register_sounds(sound_registry):
	for sound in sound_registry:
		Audio_Manager
	pass

func reduce_health(damage):
	"""Hurts the Player for the given damage"""
	if (player_values["current_health"] - 100) < 0:
		find_node("Global").game_over()
	else: 
		player_values["current_health"] -= (damage-(player_values["base_defense"] * player_values["defense_modifier"]))
		Audio_Manager.play_sound("player_hurt")

func heal(heal_value):
	"""Heals the player for the given amount"""
	player_values["current_health"] += heal_value

func full_heal(heal_value):
	"""Heals the player to the base_health"""
	player_values["current_health"] = player_values["base_health"]

func change_value(key, value):
	"""Changes an Value"""
	if key == "current_health":
		reduce_health(value)
	pass

func shoot():
	"""Generates a new bullet, if magazin is not empty"""
	if magazin > 0:
		var bullet = Bullet.new()
		add_child(bullet)
		### TODO Add Timer for Attack Speed
		bullet.on_create(player_values["speed"], get_viewport().get_mouse_position(), player_values["damage"], player_values["size"])
		magazin -= 1
		Audio_Manager.play_sound("shoot_bullet")
	else:
		# Play anoying "Gun is empty sound
		print("Magazin Leer!")

func reload():
	"""Resets the magazin capacity to the player value, add some time"""
	# create timer
	# when timer is done:
	magazin = player_values["magazine_size"]

func get_position():
	"""Returns the texture of the sprite, contains the size and the position of the player"""
	return sprite.texture
	
func init_registry(path):
	var file = File.new()
	file.open(path, file.READ)
	var line
	var return_val = {}
	while !file.eof_reached():
		line = file.get_csv_line(",")
		if(line.size()==2):
			return_val[(line[1])] = line[0]
		else:
			logger.error(("Error - in Line " + str(line) + " of " + path))
	return return_val
