extends RigidBody2D

func	_ready():
	set_constant_force(Vector2(0, -100))

func	_process(delta: float) -> void:
	if $collection.has_overlapping_bodies():
		queue_free()
		print(position)
	if position.y < -450:
		set_constant_force(Vector2(0, 100))
