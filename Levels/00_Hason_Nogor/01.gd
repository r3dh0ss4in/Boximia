extends Node2D

@onready var point_red: Node2D = %Point_red
@onready var point_green: Node2D = %Point_green
@onready var door: AnimatableBody2D = $Door
@onready var player: Player = $Player
@onready var ohho_rock: Area2D = $ohho_rock
@onready var rock: Marker2D = $rock
@onready var rock_2: Marker2D = $rock2

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


func fall2():
	const ik=preload("res://General/Scenes/ohho_rock.tscn")
	var new_ik=ik.instantiate()
	new_ik.global_position=rock_2.global_position
	get_parent().add_child(new_ik)

func fall():
	const ik=preload("res://General/Scenes/ohho_rock.tscn")
	var new_ik=ik.instantiate()
	new_ik.global_position=rock.global_position
	get_parent().add_child(new_ik)

func _on_area_2d_3_body_entered(body: Node2D) -> void:
	if body is Player:
		fall()
		fall2()
