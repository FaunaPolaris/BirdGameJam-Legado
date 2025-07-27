extends Sprite2D

func _ready() -> void:
	$sound.play()

func _on_lifespan_timeout() -> void:
	queue_free()
