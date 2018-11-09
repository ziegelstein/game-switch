extends Node

# This is the Global Node, it is the Interface to all Game modules.

#### GLOBAL VARS ####
var global_interface = preload("res://scripts/Global_Interface.gd").new()



func _ready():
	generate_interns()
	generate_modules()
	pass

func generate_interns():
	"""Generates all Game Elements"""
	self.add_child(global_interface)
	pass
	
func generate_modules():
	"""Generate all modules"""
	
	pass

func give_interface(interface):
	"""This functions takes generated interfaces-objects from the modules, it stores and manage them in the Global_Interface Subscript"""
	if global_interface.exist():
		return global_interface.add_interface(interface)
	else: return false
	
	
func use_interface(command, module):
	if global_interface.exist():
		return global_interface.execute_command(command, module)
	else: return false
	
	