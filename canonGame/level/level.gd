extends Node2D

var end_screen = preload("res://shared/endScreen.tscn")
var	impulse = preload("res://canonGame/impulse/impulse.tscn")

func _on_floor_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_packed(end_screen)


func _on_impulse_spawn_timeout() -> void:
	var	random_pos = Vector2(randi_range(960, 6000), randi_range(-740, 740))
	var new_impulse = impulse.instantiate()
	new_impulse.position.x = random_pos.x + Global.position.x
	new_impulse.position.y = random_pos.y + Global.position.y
	add_child(new_impulse)
