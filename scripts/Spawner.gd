extends Path2D

export(PackedScene) var my_scene

func _ready():
	var pos_curve = self.get_curve()
	var total_objects = pos_curve.get_point_count()
	
	for i in range(0, total_objects):
		var objects = my_scene.instance()
		add_child(objects)
		objects.position = pos_curve.get_point_position(i)
	pass
