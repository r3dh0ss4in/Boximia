extends CanvasLayer

@onready var animated_sprite_2d: AnimatedSprite2D = $Control/AnimatedSprite2D
@onready var animated_sprite_2d_2: AnimatedSprite2D = $Control/Logo/AnimatedSprite2D
@onready var home: Button = %Home




func _ready() -> void:
	animated_sprite_2d.play("Idle")
	animated_sprite_2d_2.play("Idle")
	home.grab_focus()

func _on_play_pressed() -> void:
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_file("res://Title Screen/tilte.tscn")
