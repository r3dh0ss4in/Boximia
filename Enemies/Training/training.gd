extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	velocity+=get_gravity()*delta
	move_and_slide()

func take_damage():
	animated_sprite_2d.play("Hurt")
