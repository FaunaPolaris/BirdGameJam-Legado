extends Node2D

var	food = preload("res://eatingMinigame/food/food.tscn")
var	warning = preload("res://eatingMinigame/warning/warning.tscn")

func _on_timer_timeout() -> void:
	var new_food = food.instantiate()
	var new_warning = warning.instantiate()
	new_food.position.x += randi_range(0, 1920)
	new_warning.position.x = new_food.position.x
	new_warning.position.y = -1000
	add_child(new_food)
	add_child(new_warning)
