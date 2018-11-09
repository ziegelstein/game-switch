extends Node

#### GLOBAL VARS ####
var speed = 1
var vector = Vector2(0, 0)
var sprite = Sprite.new()
var damage = 10
var size = 1

func on_create(speed, vector, damage, size):
	"""Is called on creation"""
	self.speed = speed
	self.vector = vector
	self.damage = damage
	self.size = size
	pass

func self_destruct():
	"""Destorys the bullet"""
	queue_free()

