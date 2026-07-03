extends Area2D


var velocity=Vector2.ZERO
var gravity_=980.0

func _ready() -> void:
	await get_tree().create_timer(1).timeout
	queue_free()

func _physics_process(delta: float) -> void:
	velocity.y+=gravity_*delta
	position+=velocity*delta

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		PlayerHealth.health-=5
