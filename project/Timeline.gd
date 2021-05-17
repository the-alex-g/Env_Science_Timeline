extends Node2D

# signals

# enums

# constants

# exported variables
export var line_position_y := 200
export var line_color := Color.pink
export var border_size := 150
export var line_width := 3

# variables
var _ignore
var _screen_size := Vector2.ZERO

# onready variables

func _ready()->void:
	var lowest_year := 3000
	var highest_year := 0
	_screen_size = get_viewport_rect().size
	for time_node in $EventNodes.get_children():
		time_node.position.y = line_position_y
		if int(time_node.year) > highest_year:
			highest_year = int(time_node.year)
		if int(time_node.year) < lowest_year:
			lowest_year = int(time_node.year)
	for time_node in $EventNodes.get_children():
		var year_as_float:float = (float(time_node.year)-lowest_year)/(highest_year-lowest_year)
		var node_position:float = lerp(border_size, _screen_size.x-border_size, year_as_float)
		time_node.position.x = node_position


func _draw()->void:
	draw_line(Vector2(0, line_position_y), Vector2(_screen_size.x, line_position_y), line_color, line_width)
