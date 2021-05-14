extends Node2D

# signals

# enums

# constants

# exported variables
export var year := ''
export var event := ''
export var node_radius := 10.0
export var node_color := Color.white
export var outline_color := Color.black

# variables
var _ignore

# onready variables
onready var _year_label := $YearLabel
onready var _event_label := $EventLabel
onready var _click_area := $ClickArea/CollisionShape2D


func _ready()->void:
	_year_label.text = year
	_event_label.text = event
	_event_label.visible = false
	_click_area.shape.radius = node_radius
	_event_label.margin_top = node_radius+10


func _on_ClickArea_mouse_entered()->void:
	_event_label.visible = true


func _on_ClickArea_mouse_exited()->void:
	_event_label.visible = false


func _draw()->void:
	var shine_distance := node_radius/3
	draw_circle(Vector2.ZERO, node_radius, outline_color)
	draw_circle(Vector2.ZERO, node_radius*0.9, node_color)
	draw_circle(Vector2(shine_distance, -shine_distance), node_radius/4, Color.white)
