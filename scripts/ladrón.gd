extends CharacterBody2D;

@export var speed = 100;

func _physics_process(delta: float) -> void:
	var input: Vector2;
	input.x = Input.get_action_strength("right") - Input.get_action_strength("left");
	input.y = Input.get_action_strength("down") - Input.get_action_strength("up");
	
	velocity = input.normalized() * speed;
	move_and_slide();
