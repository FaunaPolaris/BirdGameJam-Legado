extends Control

@export var to_clone:Sprite2D;
@export var columns:int;
@export var rows:int;

var table:Array;

func TransitionOut() -> void:
	var tween := create_tween();
	
	for j in rows:
		for i in columns:
			var quadradinho:Sprite2D = to_clone.duplicate()
			quadradinho.position += Vector2(i, -j)*64
			var animationPlayer :AnimationPlayer = quadradinho.get_child(0)
			animationPlayer.play("transition_in")
			tween.tween_callback(func():
				to_clone.add_sibling(quadradinho);
			);
			tween.tween_interval(0.005);
	

func TransitionIn() -> void:
	var tween := create_tween();
	var arrayBolinhas:Array;
	
	for j in rows:
		for i in columns:
			var quadradinho:Sprite2D = to_clone.duplicate()
			quadradinho.position += Vector2(i, -j)*64;
			arrayBolinhas.append(quadradinho)
			to_clone.add_sibling(quadradinho);
			var animationPlayer :AnimationPlayer = quadradinho.get_child(0)
			var targetTime = 5 * 0.05;
			animationPlayer.play("transition_out")
			animationPlayer.seek(targetTime,true)
			animationPlayer.stop()
			tween.tween_callback(func(): 
				to_clone.add_sibling(quadradinho);
				animationPlayer.play("transition_out")
				await get_tree().create_timer(0.3).timeout
				quadradinho.free(); 
			);
			tween.tween_interval(0.005);
			
	
#func BallDespawn() -> void:
	#var tween := create_tween();
	#for j in rows:
		#for i in columns:
			#var quadradinho:Sprite2D = to_clone.duplicate()
			#quadradinho.position += Vector2(i, -j)*64;
			#var animationPlayer :AnimationPlayer = quadradinho.get_child(0)
			#animationPlayer.play("transition_out")
			#tween.tween_callback(func():
				#to_clone.add_sibling(quadradinho);
				#await get_tree().create_timer(0.3).timeout
				#quadradinho.free(); 
			#);
			#tween.tween_interval(0.005);
