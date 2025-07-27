extends RigidBody2D

var	supposed_rotation	: float = 0

var original_pos : Vector2 = Vector2.ZERO

func	_process(delta: float) -> void:
	Global.distance = (global_position.x - original_pos.x) / 100
	Global.position = global_position
	$distanceCounter.setDistance(Global.distance)
	if linear_velocity.length() > 10:
		$art.rotation = linear_velocity.angle() + deg_to_rad(90)
		if $art.rotation > 90.20:
			$art.rotation = 90.20

func	_ready() -> void:
	apply_impulse(Vector2(Global.current_fat, 0).rotated(deg_to_rad(supposed_rotation)), original_pos - position)

func	impulse(forcex, forcey):
	apply_impulse(Vector2(forcex, forcey), original_pos - position)

func controlCamera():
	$Camera2D.make_current()
