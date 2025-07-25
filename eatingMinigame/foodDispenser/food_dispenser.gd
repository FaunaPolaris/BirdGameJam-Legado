extends Node2D

var	food = preload("res://eatingMinigame/food/food.tscn")
var	warning = preload("res://eatingMinigame/warning/warning.tscn")

func _on_timer_timeout() -> void:
	var new_food = food.instantiate()
	var new_warning = warning.instantiate()
	var random_pos =  randi_range(200, 1720)
	random_pos -= (random_pos % 128)
	new_food.position.x += random_pos
	new_warning.position.x = random_pos
	new_warning.position.y = -1000
	add_child(new_food)
	add_child(new_warning)
