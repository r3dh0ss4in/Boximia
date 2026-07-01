extends CanvasLayer

@onready var label: Label = $Control/Label

@export var max_health:int=50

var health:int=20:
	set(value):
		health=clamp(value,0,max_health)
		if label:
			label.text=str(health)
		if health==0:
			get_tree().change_scene_to_file("res://General/Scenes/game_over.tscn")
			Items.items=0
			max_health=50

func _ready() -> void:
	label.text=str(health)
