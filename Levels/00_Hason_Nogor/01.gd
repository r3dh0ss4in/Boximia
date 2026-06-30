extends Node2D

@onready var point_red: Node2D = %Point_red
@onready var point_green: Node2D = %Point_green
@onready var door: AnimatableBody2D = $Door
@onready var player: Player = $Player
@onready var shop: Control = $Shop

@export var Distance:int=200
@export var time:float=4

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		TransitionScreen.transition()
		await TransitionScreen.on_transition_finished
		get_tree().change_scene_to_file("res://Levels/00_Hason_Nogor/01_02.tscn")


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	door_move()
	point_green.visible=true
	point_red.visible=false

func door_move():
	door.sync_to_physics = true
	var tween=create_tween()
	tween.tween_property(door,"position",Vector2.LEFT*Distance,time).as_relative()
