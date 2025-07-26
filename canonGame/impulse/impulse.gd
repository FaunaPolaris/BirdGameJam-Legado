extends Area2D

class_name Impulse

var	has_impulsed		: bool = false
@export var impulsex	: int = 150
@export var impulsey	: int = -600

enum types {
	BIRD,
	WIND,
	STAR,
}

func	setImpulse(type : types):
	if type == types.BIRD:
		impulsex = -60
		impulsey = 200
		$art.modulate = Color(0.475, 0.26, 0.65)
	elif type == types.STAR:
		impulsex = 2000
		impulsey = 200
		$art.modulate = Color(0.773, 0.773, 0)
	elif type == types.WIND:
		impulsex = 150
		impulsey = -600
		$art.modulate = Color(1, 1, 1)

func	_process(delta: float) -> void:
	if has_overlapping_bodies() and !has_impulsed:
		has_impulsed = true
		for body in get_overlapping_bodies():
			body.impulse(impulsex, impulsey)

func _on_lifespan_timeout() -> void:
	queue_free()
