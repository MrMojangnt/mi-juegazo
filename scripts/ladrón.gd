extends CharacterBody2D;

@export var speed = 100;

func _physics_process(delta: float) -> void:
	var input: Vector2;
	input.x = Input.get_action_strength("right") - Input.get_action_strength("left");
	input.y = Input.get_action_strength("down") - Input.get_action_strength("up");
	
	if (input.x < 0):
		$AnimatedSprite2D.play("left")
	elif (input.x > 0):
		$AnimatedSprite2D.play("right");
	if (input.y<0):
		$AnimatedSprite2D.play("up");
	elif (input.y>0):
		$AnimatedSprite2D.play("down");
	if input.x==0 && input.y==0:
		$AnimatedSprite2D.play("default");
		
	
	velocity = input.normalized() * speed;
	move_and_slide();
