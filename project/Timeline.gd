extends Node2D

# signals

# enums

# constants

# exported variables
export var line_position_y := 200
export var line_color := Color.pink

# variables
var _ignore
var _screen_size := Vector2.ZERO

# onready variables

func _ready()->void:
	_screen_size = get_viewport_rect().size
	for time_node in get_children():
		time_node.position.y = line_position_y


func _draw()->void:
	draw_line(Vector2(0, line_position_y), Vector2(_screen_size.x, line_position_y), line_color)
