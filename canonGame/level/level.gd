extends Node2D

var end_screen = preload("res://shared/endScreen.tscn")
var	impulse = preload("res://canonGame/impulse/impulse.tscn")

var	first_layer		: int = -600
var second_layer	: int = -1200
var third_layer		: int = -1700

func _on_floor_body_entered(body: Node2D) -> void:
	$splashSound.play()

func _on_death() -> void:
	get_tree().change_scene_to_packed(end_screen)

func _on_impulse_spawn_timeout() -> void:
	spawnTurtle()
	spawnFirstLayer()
	spawnSecondLayer()
	spawnThirdLayer()

func	spawnTurtle():
	var	random_pos = Vector2(randi_range(960, 12000), 52)
	var new_impulse = impulse.instantiate()
	new_impulse.position.x = random_pos.x + Global.position.x
	new_impulse.position.y = random_pos.y
	new_impulse.setImpulse(Impulse.types.TURTLE)
	add_child(new_impulse)

func	spawnFirstLayer():
	var	random_pos = Vector2(randi_range(960, 12000), randi_range(740, first_layer))
	var new_impulse = impulse.instantiate()
	new_impulse.position.x = random_pos.x + Global.position.x
	new_impulse.position.y = random_pos.y
	new_impulse.setImpulse(randi_range(0, 2))
	add_child(new_impulse)
	
func	spawnSecondLayer():
	var	random_pos = Vector2(randi_range(960, 12000), randi_range(first_layer, second_layer))
	var new_impulse = impulse.instantiate()
	new_impulse.position.x = random_pos.x + Global.position.x
	new_impulse.position.y = random_pos.y
	new_impulse.setImpulse(randi_range(1, 2))
	add_child(new_impulse)

func	spawnThirdLayer():
	var	random_pos = Vector2(randi_range(960, 12000), randi_range(second_layer, third_layer))
	var new_impulse = impulse.instantiate()
	new_impulse.position.x = random_pos.x + Global.position.x
	new_impulse.position.y = random_pos.y
	new_impulse.setImpulse(randi_range(1,3))
	add_child(new_impulse)

func _on_impulse_button_down() -> void:
	Global.space_pressed = true
	Global.screen_pressed = true

func _on_impulse_button_up() -> void:
	Global.space_pressed = false
	Global.screen_pressed = false

func _on_angle_up_button_down() -> void:
	Global.up_pressed = true
	Global.screen_pressed = true

func _on_angle_up_button_up() -> void:
	Global.up_pressed = false
	Global.screen_pressed = false

func _on_angle_down_button_down() -> void:
	Global.down_pressed = true
	Global.screen_pressed = true

func _on_angle_down_button_up() -> void:
	Global.down_pressed = false
	Global.screen_pressed = false
