extends CharacterBody2D

var has_peck	: bool = true
var	speed		: Vector2 = Vector2(20000, 0)
var	can_move	: bool = true

var trans = preload("res://canonGame/level/level.tscn")

func	_ready() -> void:
		$"../transitionControl".TransitionIn()
		$"../transitionControl/transition".timeout.connect(Callable(self, "_on_transition_timeout"))

func	_process(delta: float) -> void:
	if (Input.is_action_pressed("ui_left") or (Global.left_pressed and Global.screen_pressed)) and can_move:
		velocity = Vector2.LEFT * speed * delta
		move_and_slide()
		$"../controls/left".play("down")
		$"../controls/right".play("up")
	elif (Input.is_action_pressed("ui_right") or (Global.right_pressed and Global.screen_pressed)) and can_move:
		velocity = Vector2.RIGHT * speed * delta
		move_and_slide()
		$"../controls/right".play("down")
		$"../controls/left".play("up")
	else:
		$"../controls/right".play("up")
		$"../controls/left".play("up")
	if (Input.is_action_just_pressed("ui_accept") or (Global.space_pressed and Global.screen_pressed)) and has_peck and can_move:
		has_peck = false
		can_move = false
		$collision.disabled = false
		$art.set_offset(Vector2(0, 16))
		$peckTimeout.start()
		$peckTime.start()
		$"../controls/Spacebar".play("down")

func _on_peck_time_timeout() -> void:
	$collision.disabled = true
	can_move = true
	$art.set_offset(Vector2(0, 0))

func _on_clock_times_up() -> void:
	can_move = false
	$"../controls".hide()
	$"../transitionControl".TransitionOut()
	$"../transitionControl/transition".start()

func _on_peck_timeout_timeout() -> void:
	has_peck = true
	$"../controls/Spacebar".play("up")

func _on_transition_timeout() -> void:
	print("changing scene")
	get_tree().change_scene_to_packed(trans)

func _on_move_left_button_down() -> void:
	Global.left_pressed = true
	Global.screen_pressed = true

func _on_move_left_button_up() -> void:
	Global.left_pressed = false
	Global.screen_pressed = false

func _on_move_right_button_down() -> void:
	Global.right_pressed = true
	Global.screen_pressed = true

func _on_move_right_button_up() -> void:
	Global.right_pressed = false
	Global.screen_pressed = false

func _on_peck_button_down() -> void:
	Global.space_pressed = true
	Global.screen_pressed = true

func _on_peck_button_up() -> void:
	Global.space_pressed = false
	Global.screen_pressed = false
