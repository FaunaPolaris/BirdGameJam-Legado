extends Node2D

var	main_character	= preload("res://canonGame/mainCharacter/main_character.tscn")

var	max_angle		: int = 90
var	min_angle		: int = 0
var	canon_speed		: int = 50
var	has_shot		: bool = false

func _process(delta : float):
	pass
	if Input.is_action_pressed("ui_up") and $mouth.global_rotation_degrees > min_angle:
		$mouth.global_rotation_degrees -= canon_speed * delta
		$CannonWheel.global_rotation_degrees += canon_speed * delta
	elif Input.is_action_pressed("ui_down") and $mouth.global_rotation_degrees < max_angle:
		$mouth.global_rotation_degrees += canon_speed * delta
		$CannonWheel.global_rotation_degrees -= canon_speed * delta
	if Input.is_action_just_pressed("ui_accept") and !has_shot:
		var new_main = main_character.instantiate()
		has_shot = true
		new_main.position = $mouth/tip.global_position
		new_main.original_pos = new_main.position
		new_main.supposed_rotation = $mouth.global_rotation_degrees - 90
		add_child(new_main)
		$"../Camera2D".followBullet(new_main)
		$"../floor".followBullet(new_main)
		$"../ceiling".followBullet(new_main)
