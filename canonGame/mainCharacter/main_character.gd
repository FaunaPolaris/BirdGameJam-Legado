extends RigidBody2D

var	supposed_rotation	: float = 0

var original_pos : Vector2 = Vector2.ZERO

func	_ready() -> void:
	apply_impulse(Vector2(Global.current_fat, 0).rotated(deg_to_rad(supposed_rotation)), original_pos - position)

func controlCamera():
	$Camera2D.make_current()
