extends Control

func	_process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		Global.current_fat = 0
		get_tree().change_scene_to_file("res://eatingMinigame/scenario/scenario.tscn")
