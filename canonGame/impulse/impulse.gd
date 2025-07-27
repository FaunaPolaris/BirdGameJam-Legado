extends Area2D

class_name Impulse

var	has_impulsed		: bool = false
@export var impulsex	: int = 150
@export var impulsey	: int = -600

enum types {
	BIRD1,
	BIRD2,
	STAR,
	TURTLE,
}

func	setImpulse(type : types):
	if type == types.BIRD1:
		impulsex = -60
		impulsey = 200
		$art.play("fragata")
	if type == types.BIRD2:
		impulsex = -300
		impulsey = 200
		$art.play("gaivotao")
	elif type == types.STAR:
		impulsex = 1500
		impulsey = 200
		$art.play("star")
	elif type == types.TURTLE:
		impulsex = 60
		impulsey = -1400
		$art.play("turtle")

func	_process(delta: float) -> void:
	if has_overlapping_bodies() and !has_impulsed:
		has_impulsed = true
		if impulsex == 1500:
			$starSound.play()
		else:
			$hitSound.play()
		for body in get_overlapping_bodies():
			body.impulse(impulsex, impulsey)
	position.x += -200 * delta

func _on_lifespan_timeout() -> void:
	queue_free()
