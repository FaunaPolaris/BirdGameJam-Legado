extends CharacterBody2D

var	speed	: Vector2 = Vector2(20000, 0)

func	_process(delta: float) -> void:
	if Input.is_action_pressed("ui_left"):
		velocity = Vector2.LEFT * speed * delta
		move_and_slide()
	elif Input.is_action_pressed("ui_right"):
		velocity = Vector2.RIGHT * speed * delta
		move_and_slide()
	if Input.is_action_just_pressed("ui_accept"):
		$collision.disabled = false
		$art.set_offset(Vector2(0, 64))
		$peckTime.start()


func _on_peck_time_timeout() -> void:
	$collision.disabled = true
	$art.set_offset(Vector2(0, 32))
