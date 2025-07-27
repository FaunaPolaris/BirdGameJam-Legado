extends Node2D

@export var minutes	: int = 0
@export var seconds	: int = 0

signal timesUp

func _on_timer_timeout() -> void:
	seconds -= 1
	if seconds <= 0:
		minutes -= 1
		seconds = 60
	if minutes < 0:
		timesUp.emit()
		$Timer.stop()
	$number.text = str("0", minutes, ":", seconds)
