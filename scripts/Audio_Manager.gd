extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var sounds = {}


func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	
	# Maybe register default sounds
	pass

func register_sound(file, key):
	var player = AudioStreamPlayer.new()
	self.add_child(player)
	player.stream = load(file)
	if(player.stream):
		sounds[key] = player
	else:
		logger.error("Soundfile "+file+" not found")

func unregister_sound(key):
	if(sounds.has(key)):
		sounds[key].stop()
		sounds[key].queue_free()
		sounds.erase(key)
	else:
		logger.error("Couldn't unregister sound "+key+", not registered")

func play_sound(key):
	if(sounds.has(key)):
		var player = sounds[key]
		player.play()
	else:
		logger.error("Couldn't play sound "+key+", not registered")

func stop_sound(key):
	if(sounds.has(key)):
		var player = sounds[key]
		if(player.playing):
			player.stop()
	else:
		logger.error("Couldn't stop sound "+key+", not registered")

func debug():
	Audio_Manager.register_Sound("res://Media/sounds/no_sh.wav", 'no_sh')
#	Audio_Manager.playSound('no_sh')
#	#Audio_Manager.unregisterSound('no_sh')
#	#Audio_Manager.playSound('no_sh')
#	#play("res://Media/sounds/no_sh.wav")
	return "Audio_Manager done"