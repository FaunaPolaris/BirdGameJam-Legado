extends CharacterBody2D

var has_peck	: bool = true
var	speed		: Vector2 = Vector2(20000, 0)
var	can_move	: bool = true

var trans = preload("res://canonGame/level/level.tscn")

func	_ready() -> void:
		$"../transitionControl".TransitionIn()
		$"../transitionControl/transition".timeout.connect(Callable(self, "_on_transition_timeout"))

func	_process(delta: float) -> void:
	if Input.is_action_pressed("ui_left") and can_move:
		velocity = Vector2.LEFT * speed * delta
		move_and_slide()
	elif Input.is_action_pressed("ui_right") and can_move:
		velocity = Vector2.RIGHT * speed * delta
		move_and_slide()
	if Input.is_action_just_pressed("ui_accept") and has_peck and can_move:
		has_peck = false
		can_move = false
		$collision.disabled = false
		$art.set_offset(Vector2(0, 16))
		$peckTimeout.start()
		$peckTime.start()

func _on_peck_time_timeout() -> void:
	$collision.disabled = true
	can_move = true
	$art.set_offset(Vector2(0, 0))

func _on_clock_times_up() -> void:
	can_move = false
	$"../transitionControl".TransitionOut()
	$"../transitionControl/transition".start()

func _on_peck_timeout_timeout() -> void:
	has_peck = true

func _on_transition_timeout() -> void:
	print("changing scene")
	get_tree().change_scene_to_packed(trans)
