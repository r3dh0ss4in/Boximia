extends Node2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		TransitionScreen.transition()
		await TransitionScreen.on_transition_finished
		PlayerHealth.health-=10
		if PlayerHealth.health:
			get_tree().reload_current_scene()


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	if body is Player:
		TransitionScreen.transition()
		await TransitionScreen.on_transition_finished
		get_tree().change_scene_to_file("res://Levels/06_Srirampur/07_02.tscn")
