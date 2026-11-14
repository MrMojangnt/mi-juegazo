extends CharacterBody2D

var speed = 100
@export var player: Node2D

func _physics_process(delta: float) -> void:
	if not player:
		player = get_tree().get_root().find_child("ladrón", true, false)
		if not player:
			player = get_tree().get_root().find_child("Ladrón", true, false)

	if player:
		var direction = (player.global_position - global_position).normalized()
		velocity = direction * speed
		move_and_slide()
		
		actualizar_animacion(velocity)
	else:
		velocity = Vector2.ZERO
		move_and_slide()
		$AnimatedSprite2D.play("default")

func actualizar_animacion(input: Vector2) -> void:
	if input == Vector2.ZERO:
		$AnimatedSprite2D.play("default")
	elif abs(input.x) > abs(input.y):
		if input.x > 0:
			$AnimatedSprite2D.play("right")
		else:
			$AnimatedSprite2D.play("left")
	else:
		if input.y > 0:
			$AnimatedSprite2D.play("down")
		else:
			$AnimatedSprite2D.play("up")
