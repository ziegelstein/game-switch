extends Node

### GLOBAL VARS ###
var interface_list = []

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass
	

func add_interface(interface):
	"""Try to add an interface to the list"""
	if !interface_list.has(interface):
		interface_list.append(interface)
		print (str(interface) + "added to list")
		return true
	else:
		print("Error! " + str(interface) + " was already added.")
		return false
		
func use_interface(command, interface):
	"""TODO"""
	return false
	
func return_interfaces():
	"""Returns the interface_list"""
	if interface_list.size() > 0:
		return interface_list
	else:
		print("Error! Interface_list is empty!")
		return null
