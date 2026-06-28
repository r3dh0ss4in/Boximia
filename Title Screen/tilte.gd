extends CanvasLayer


@onready var animated_sprite_2d: AnimatedSprite2D = $Control/AnimatedSprite2D
@onready var animated_sprite_2d_2: AnimatedSprite2D = $Control/Logo/AnimatedSprite2D
@onready var play: Button = %Play
@onready var quit: Button = %Quit



func _ready() -> void:
	animated_sprite_2d.play("Idle")
	animated_sprite_2d_2.play("Idle")
	play.grab_focus()
	


func _on_play_pressed() -> void:
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_file("res://Levels/00_Hason_Nogor/01.tscn")


func _on_quit_pressed() -> void:
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().quit()
