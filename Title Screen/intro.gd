extends CanvasLayer

@onready var animated_sprite_2d: AnimatedSprite2D = $Control/AnimatedSprite2D

func _ready() -> void:
	Items.visible=false
	PlayerHealth.visible=false
	animated_sprite_2d.play("Idle")
	await get_tree().create_timer(4).timeout
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	Items.visible=true
	PlayerHealth.visible=true
	get_tree().change_scene_to_file("res://Title Screen/tilte.tscn")
