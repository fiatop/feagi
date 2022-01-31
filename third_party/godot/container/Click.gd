extends GridMap

onready var selected =  preload("res://selected.meshlib")
onready var deselected = preload("res://Cortical_area_box.meshlib")
onready var block_outline = preload("res://outline.meshlib")


var location = Vector3()
var Gx = 0
var Gy = 0
var Gz = 0


func _on_Area_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == BUTTON_LEFT and event.pressed == true:
			mesh_library = selected
			print(get_node("."))
	else:
		mesh_library = deselected