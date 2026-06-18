@tool
@icon("res://General/Icons/level_bounds.svg")
class_name Level_Bounds
extends Node2D

@export_range(400,2048,32,"suffix:px") var width:int=400:set=_on_width_changed
@export_range(270,2048,32,"suffix:px") var hight:int=270:set=_on_hight_changed

func _ready() -> void:
	# Handle z-index
	z_index=256
	if Engine.is_editor_hint():
		return 
	
	var camera:Camera2D=null
	while not camera:
		await get_tree().process_frame
		camera=get_viewport().get_camera_2d()
	camera.limit_left=int(global_position.x)
	camera.limit_top=int(global_position.y)
	camera.limit_right=int(global_position.x)+width
	camera.limit_bottom=int(global_position.y)+hight
	# Check for and get reference to our camera
	# Update camera's limits
	pass

func _draw() -> void:
	if Engine.is_editor_hint():
		# draw a box
		var r:Rect2=Rect2(Vector2.ZERO,Vector2(width,hight))
		draw_rect(r,Color(0.0,0.45,0.6),false,3)
		draw_rect(r,Color(0.0,0.75,1.0),false,1)
	pass


func _on_width_changed(new_width:int):
	width=new_width
	queue_redraw()
	

func _on_hight_changed(new_hight:int):
	hight=new_hight
	queue_redraw()
