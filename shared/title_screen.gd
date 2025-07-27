extends Control

var	scenario = preload("res://eatingMinigame/scenario/scenario.tscn")

func _on_start_game_pressed() -> void:
	$button_press.play()
	$transitionControl.TransitionOut()
	$transitionControl/transition.timeout.connect(Callable(self, "_on_transtion_timeout"))
	$transitionControl/transition.start()

func	_on_transtion_timeout():
	print("changing scene")
	get_tree().change_scene_to_packed(scenario)
