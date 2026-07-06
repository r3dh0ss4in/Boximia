extends Area2D

func _ready() -> void:
	await get_tree().create_timer(0.5).timeout
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		PlayerHealth.health-=10
