tool

extends Node2D

var dnd:bool = false

var r:float = 8
var oldPos:Vector2

func _ready():
	oldPos = position

func _process(delta):
	if Engine.editor_hint:
		if oldPos != position:
			oldPos = position
			get_parent().update()
	else:
		if dnd:
			global_position = get_global_mouse_position()
			get_parent().update()

func _input(event):
	print('i')
	if event is InputEventMouseButton:
		if event.pressed:
			print('p')
			if global_position.distance_squared_to(get_global_mouse_position()) <= r * r:
				print('t')
				dnd = true
				get_tree().set_input_as_handled()
		else:
			dnd = false

func _draw():
	draw_circle(Vector2.ZERO, r, Color.black)
