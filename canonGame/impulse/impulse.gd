extends Area2D

class_name impulse

var	has_impulsed		: bool = false
@export var impulsex	: int = 0
@export var impulsey	: int = 0

func	_process(delta: float) -> void:
	if has_overlapping_bodies() and !has_impulsed:
		has_impulsed = true
		for body in get_overlapping_bodies():
			body.impulse(impulsex, impulsey)
