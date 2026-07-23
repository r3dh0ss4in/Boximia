extends CanvasLayer

@onready var label: Label = $Control/Label
@onready var health_bar: ProgressBar = $Control/HealthBar

@export var max_health:int=50

var health:int=50:
	set(value):
		health=clamp(value,0,max_health)
		if label:
			health_bar.value=health
			label.text=str(health)
		if health==0:
			get_tree().change_scene_to_file("res://General/Scenes/game_over.tscn")
			Items.items=0
			max_health=50

func _ready() -> void:
	health_bar.min_value=0
	health_bar.max_value=max_health
	health_bar.value=health
	label.text=str(health)
