extends Node2D

var	main_character	= preload("res://canonGame/mainCharacter/main_character.tscn")

var offset_angle	: int = 90
var	max_angle		: int = -90
var	min_angle		: int = 0
var	canon_speed		: int = 50

func _process(delta : float):
	pass
	if Input.is_action_pressed("ui_up") and $mouth.global_rotation_degrees > max_angle:
		$mouth.global_rotation_degrees -= canon_speed * delta
	elif Input.is_action_pressed("ui_down") and $mouth.global_rotation_degrees < min_angle:
		$mouth.global_rotation_degrees += canon_speed * delta
	if Input.is_action_just_pressed("ui_accept"):
		var new_main = main_character.instantiate()
		new_main.position = $mouth/tip.global_position
		new_main.original_pos = new_main.position
		new_main.supposed_rotation = $mouth/tip.global_rotation_degrees - offset_angle
		add_child(new_main)
		#new_main.controlCamera()
