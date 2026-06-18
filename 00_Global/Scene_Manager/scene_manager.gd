extends CanvasLayer

signal load_scene_started
signal new_scene_ready(target_name:String,offset:Vector2)
signal load_scene_finished

func _ready() -> void:
	await get_tree().physics_frame
	load_scene_finished.emit()

func transition_scene(new_scene:String,target_area:String,player_offset:Vector2,direction:String):
	load_scene_started.emit()
	# Fade new scene out
	get_tree().change_scene_to_file(new_scene)
	await get_tree().scene_changed
	new_scene_ready.emit(target_area,player_offset)
	# Fade new scene in
	load_scene_finished.emit()
	pass
