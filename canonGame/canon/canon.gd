extends Node2D

var	main_character	= preload("res://canonGame/mainCharacter/main_character.tscn")

var	main

var	max_angle		: int = 90
var	min_angle		: int = 0
var	canon_speed		: int = 50
var	has_shot		: bool = true
var can_move_sound	: bool = true

func	_ready():
	Global.extra_jump = 0
	$"../AnimationPlayer".play("transition")
	$"../transitionControl".TransitionIn()

func _process(delta : float):
	if (Input.is_action_pressed("ui_up") or (Global.up_pressed and Global.screen_pressed)) and $mouth.global_rotation_degrees > min_angle and !has_shot:
		$mouth.global_rotation_degrees -= canon_speed * delta
		$CannonWheel.global_rotation_degrees += canon_speed * delta
		if can_move_sound:
			$moveSound.play()
			can_move_sound = false
			$moveSoundTimer.start()
		$"../controls/up".play("down")
		$"../controls/down".play("up")
	elif (Input.is_action_pressed("ui_down") or (Global.down_pressed and Global.screen_pressed)) and $mouth.global_rotation_degrees < max_angle and !has_shot:
		$mouth.global_rotation_degrees += canon_speed * delta
		$CannonWheel.global_rotation_degrees -= canon_speed * delta
		if can_move_sound:
			$moveSound.play()
			can_move_sound = false
			$moveSoundTimer.start()
		$"../controls/down".play("down")
		$"../controls/up".play("up")
	else:
		$"../controls/down".play("up")
		$"../controls/up".play("up")
	if (Input.is_action_just_pressed("ui_accept") or (Global.space_pressed and Global.screen_pressed)) and !has_shot:
		var new_main = main_character.instantiate()
		print("doing the thing that should work")
		var tween:Tween = self.create_tween();
		tween.tween_property($mouth, "scale", Vector2.ONE * 4.3, 0.1).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC);
		tween.tween_property($mouth, "scale", Vector2.ONE * 4.0, 0.5).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_ELASTIC);
		new_main.position = $mouth/tip.global_position
		new_main.original_pos = new_main.position
		new_main.supposed_rotation = $mouth.global_rotation_degrees - 90
		main = new_main
		add_child(new_main)
		new_main.controlCamera()
		$"../floor".followBullet(new_main)
		$"../ceiling".followBullet(new_main)
		$shotAudio.play()
		$"../controls/Spacebar".play("down")
		has_shot = true
	elif (Input.is_action_just_pressed("ui_accept") or (Global.space_pressed and Global.screen_pressed)) and Global.extra_jump:
		print("trying to extra jump")
		main.impulse(500, -1200)
		$extraJumpAudio.play()
		Global.extra_jump -= 1

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	has_shot = false
	$"../controls".show()

func _on_move_sound_timer_timeout() -> void:
	can_move_sound = true
