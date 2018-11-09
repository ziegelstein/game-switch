extends Node

#### GLOBAL VARS ####
var player_values = {}
var magazin = 8

func _ready():
	"""Is called on creation of the player node"""
	set_player_values
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
	player_values["health"] = 100
	player_values["defense"] = 1
	player_values["defense_modifier"] = 1
	# Attack Values
	player_values["damage"] = 10
	player_values["damage_modifier"] = 1
	player_values["attack_speed"] = 1
	player_values["magazine_size"] = 8
	player_values["bullet_size"] = 1
	player_values["bullet_speed"] = 1
	pass

func reduce_health(damage):
	if (player_values["health"] - 100) < 0:
		find_node("Global").game_over()
	else: player_values["health"] = player_values["health"] - 100

func change_value(key, value):
	pass

func shoot():
	"""Generates a new bullet, if magazin is not empty"""
	if magazin > 0:
		var bullet = Bullet.new()
		add_child(bullet)
		### TODO Add Timer for Attack Speed
		bullet.on_create(player_values["speed"], get_viewport().get_mouse_position(), player_values["damage"], player_values["size"])
		magazin -= 1
	else:
		# Play anoying "Gun is empty sound
		print("Magazin Leer!")

func reload():
	"""Resets the magazin capacity to the player value, add some time"""
	# create timer
	# when timer is done:
	magazin = player_values["magazine_size"]