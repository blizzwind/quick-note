extends Node2D

onready var _lines := $Lines
var _pressed := false
var _current_line: Line2D

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		_pressed = event.pressed
		if _pressed:
			_current_line = Line2D.new()
			_current_line.default_color = Color.black
			_current_line.width = 1
			_lines.add_child(_current_line)
	if event is InputEventMouseMotion && _pressed:
		_current_line.add_point(event.position)
	if Input.is_action_pressed("ui_select"):
		for n in _lines.get_children():
			n.queue_free()
