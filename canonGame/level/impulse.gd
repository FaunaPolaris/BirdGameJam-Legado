extends Button

var focus_point = 0

func	followBullet(target):
	focus_point = target

func	_process(delta: float) -> void:
	if focus_point:
		position = focus_point.position
