extends TileMap

@onready var pause = get_node("/root/World/UI/Pause")
@onready var hud = get_node("/root/World/UI/Interface")
@onready var grid = get_node("/root/World/Buildings/Grid")
@onready var node = preload("res://assets/nodes/farming/plant.tscn")

func _process(delta):
	if grid.mode != grid.gridmode.nothing:
		grid_movement()
			
func grid_movement():
	var current:Vector2 = local_to_map(get_global_mouse_position())
	grid.set_position(map_to_local(current))

func plant(seed_id):
	if grid.mode == grid.gridmode.seeds:
		var mouse_position = local_to_map(get_global_mouse_position())
		var plant = node.instantiate()
		plant.z_index = 4
		plant.get_plant(seed_id)
		plant.set_position(map_to_local(mouse_position))
		add_child(plant)