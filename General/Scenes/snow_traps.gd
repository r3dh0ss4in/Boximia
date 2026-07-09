extends Area2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	animated_sprite_2d.play("Idle")
	await get_tree().create_timer(2.02).timeout
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	PlayerHealth.health-=5
	body.take_damage()
