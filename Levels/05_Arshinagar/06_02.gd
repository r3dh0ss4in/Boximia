extends Node2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		TransitionScreen.transition()
		await TransitionScreen.on_transition_finished
		get_tree().reload_current_scene()
