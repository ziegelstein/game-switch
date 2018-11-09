extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var player

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	player = AudioStreamPlayer.new()

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func loadFile(file):
	player.stream = load(file)

func playLoaded():
	if(player.stream):
		player.play()

func play(file):
	player.stream = load(file)
	player.play()

func debug():
	loadFile("res://Media/soundstest/punk.wav")
	playLoaded()
	return "Audio_Manager done"