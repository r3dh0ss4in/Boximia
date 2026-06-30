extends AnimatableBody2D


@export var Distance:int=50
@export var time:float=2

func _ready() -> void:
	if zo.door_unlock:
		sync_to_physics = true
		var tween=create_tween()
		tween.tween_property(self,"position",Vector2.LEFT*Distance,time).as_relative()
