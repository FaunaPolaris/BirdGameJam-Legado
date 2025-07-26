extends CharacterBody2D

var has_peck	: bool = true
var	speed		: Vector2 = Vector2(20000, 0)

var trans = preload("res://shared/transition.tscn")

func	_process(delta: float) -> void:
	if Input.is_action_pressed("ui_left"):
		velocity = Vector2.LEFT * speed * delta
		move_and_slide()
	elif Input.is_action_pressed("ui_right"):
		velocity = Vector2.RIGHT * speed * delta
		move_and_slide()
	if Input.is_action_just_pressed("ui_accept") and has_peck:
		has_peck = false
		$collision.disabled = false
		$art.set_offset(Vector2(0, 16))
		$peckTimeout.start()
		$peckTime.start()

func _on_peck_time_timeout() -> void:
	$collision.disabled = true
	$art.set_offset(Vector2(0, 0))

func _on_clock_times_up() -> void:
	$"../AnimationPlayer".play("transitioning")

func _on_peck_timeout_timeout() -> void:
	has_peck = true

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	get_tree().change_scene_to_packed(trans)
