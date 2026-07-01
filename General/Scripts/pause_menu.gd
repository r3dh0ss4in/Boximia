extends Control

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var resume_: Button = %Resume

func pause():
	show()
	get_tree().paused=true
	resume_.grab_focus()
	animation_player.play("blur")
	
func resume():
	get_tree().paused=false
	animation_player.play_backwards("blur")
	hide()

func esc():
	if Input.is_action_just_pressed("pause"):
		if get_tree().paused == false:
			pause()
		else:
			resume()

func _ready() -> void:
	animation_player.play("RESET")
	hide()

func _process(delta: float) -> void:
	esc()


func _on_resume_pressed() -> void:
	resume()


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_home_pressed() -> void:
	resume()
	get_tree().change_scene_to_file("res://Title Screen/tilte.tscn")


func _on_health_pressed() -> void:
	if(Items.items>=10 and PlayerHealth.health!=PlayerHealth.max_health):
		PlayerHealth.health+=50
		Items.items-=10


func _on_strong_pressed() -> void:
	if(Items.items>=20):
		PlayerHealth.max_health+=5
		Items.items-=20
