extends Area2D

@export var speed = 400.0
@onready var BGMusic = $"../BGMusic"
@onready var EnemyHit = $"../EnemyHit"

func _process(delta):
	var velocity = Vector2.ZERO
	
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		
	position += velocity * delta

func _on_body_entered(body):
	hide()
	BGMusic.stop()
	EnemyHit.play()
