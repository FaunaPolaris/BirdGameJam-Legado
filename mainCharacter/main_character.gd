extends RigidBody2D

var	force	: int = 0

var original_pos : Vector2 = Vector2.ZERO

func	_ready() -> void:
	apply_impulse(Vector2(force, 0).rotated(rotation), original_pos - position)
