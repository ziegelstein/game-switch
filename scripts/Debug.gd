extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var debugs = []


func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	push_debugs();
	for debug in debugs:
		var label = Label.new()
		if debug.has_method('debug'):
			label.text = debug.debug()
		get_node("debug").add_child(label)

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	pass

	
func push_debugs():
	debugs.push_front(Audio_Manager)