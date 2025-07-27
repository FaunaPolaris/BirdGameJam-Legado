extends Control

var	scenario = preload("res://eatingMinigame/scenario/scenario.tscn")

func _on_start_game_pressed() -> void:
	$button_press.play()
	get_tree().change_scene_to_packed(scenario)
