extends Node2D

@onready var point_red: Node2D = %Point_red
@onready var point_green: Node2D = %Point_green

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		TransitionScreen.transition()
		await TransitionScreen.on_transition_finished
		get_tree().change_scene_to_file("res://Levels/00_Hason_Nogor/01_02.tscn")


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	point_green.visible=true
	point_red.visible=false
