extends Control

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func pause():
	get_tree().paused=true
	animation_player.play("blur")
	
func resume():
	get_tree().paused=false
	animation_player.play_backwards("blur")
	
func esc():
	if Input.is_action_just_pressed("pause") and get_tree().paused==false:
		pause()
	elif Input.is_action_just_pressed("pause") and get_tree().paused:
		resume()

func _ready() -> void:
	animation_player.play("RESET")

func _process(delta: float) -> void:
	esc()


func _on_resume_pressed() -> void:
	resume()


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_home_pressed() -> void:
	resume()
	get_tree().change_scene_to_file("res://Title Screen/tilte.tscn")
