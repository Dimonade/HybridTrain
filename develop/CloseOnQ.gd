extends Node

func _input(event):
	if event is InputEventKey:
		if event.scancode == KEY_Q and event.pressed:
			get_tree().quit()