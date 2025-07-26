extends Node2D

var	main_character	= preload("res://canonGame/mainCharacter/main_character.tscn")

var	main

var	max_angle		: int = 90
var	min_angle		: int = 0
var	canon_speed		: int = 50
var	has_shot		: bool = true

func	_ready():
	Global.extra_jump = 0
	$"../AnimationPlayer".play("transition")

func _process(delta : float):
	if Input.is_action_pressed("ui_up") and $mouth.global_rotation_degrees > min_angle:
		$mouth.global_rotation_degrees -= canon_speed * delta
		$CannonWheel.global_rotation_degrees += canon_speed * delta
	elif Input.is_action_pressed("ui_down") and $mouth.global_rotation_degrees < max_angle:
		$mouth.global_rotation_degrees += canon_speed * delta
		$CannonWheel.global_rotation_degrees -= canon_speed * delta
	if Input.is_action_just_pressed("ui_accept") and !has_shot:
		var new_main = main_character.instantiate()
		var tween:Tween = self.create_tween();
		tween.tween_property($mouth, "scale", Vector2.ONE * 4.3, 0.1).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC);
		tween.tween_property($mouth, "scale", Vector2.ONE * 4.0, 0.5).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_ELASTIC);
		has_shot = true
		new_main.position = $mouth/tip.global_position
		new_main.original_pos = new_main.position
		new_main.supposed_rotation = $mouth.global_rotation_degrees - 90
		main = new_main
		add_child(new_main)
		new_main.controlCamera()
		$"../floor".followBullet(new_main)
		$"../ceiling".followBullet(new_main)
	elif Input.is_action_just_pressed("ui_accept") and Global.extra_jump:
		main.impulse(500, -1200)
		Global.extra_jump -= 1

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	has_shot = false
	Global.extra_jump = 1
