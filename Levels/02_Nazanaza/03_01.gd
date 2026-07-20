extends Node2D
@onready var worm: Marker2D = $worm


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		TransitionScreen.transition()
		await TransitionScreen.on_transition_finished
		get_tree().change_scene_to_file("res://Levels/02_Nazanaza/03_02.tscn")

func _worm():
	const ik=preload("res://General/Scenes/sand_worm.tscn")
	var new_ik=ik.instantiate()
	new_ik.global_position=worm.global_position
	get_parent().add_child(new_ik)

func _on_area_2d_2_body_entered(body: Node2D) -> void:
	if body is Player:
		TransitionScreen.transition()
		await TransitionScreen.on_transition_finished
		PlayerHealth.health-=10
		if PlayerHealth.health:
			get_tree().reload_current_scene()


func _on_area_2d_3_body_entered(body: Node2D) -> void:
	if body is Player:
		_worm()
