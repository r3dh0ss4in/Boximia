extends Control

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var resume_: Button = %Resume
@onready var health_lbl: Label = $HBoxContainer3/health_lbl
@onready var max_health_lbl: Label = $HBoxContainer3/max_health_lbl
@onready var strength_lbl: Label = $HBoxContainer3/power
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func updtate_labels():
	health_lbl.text=str(PlayerHealth.health)
	max_health_lbl.text=str(PlayerHealth.max_health)
	strength_lbl.text=str(Power.amount)
	

func pause():
	show()
	get_tree().paused=true
	resume_.grab_focus()
	health_lbl.text=str(PlayerHealth.health)
	max_health_lbl.text=str(PlayerHealth.max_health)
	strength_lbl.text=str(Power.amount)
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
	animated_sprite_2d.hide()
	hide()

func _process(delta: float) -> void:
	esc()


func _on_resume_pressed() -> void:
	resume()




func _on_home_pressed() -> void:
	resume()
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	PlayerHealth.health=50
	PlayerHealth.max_health=50
	Power.amount=10
	Items.items=0
	get_tree().change_scene_to_file("res://Title Screen/tilte.tscn")


func _on_health_pressed() -> void:
	if(Items.items>=10 and PlayerHealth.health!=PlayerHealth.max_health):
		animated_sprite_2d.show()
		animated_sprite_2d.play("he")
		PlayerHealth.health+=50
		Items.items-=10
		updtate_labels()
		await get_tree().create_timer(2).timeout
		animated_sprite_2d.hide()


func _on_strong_pressed() -> void:
	if(Items.items>=20):
		animated_sprite_2d.show()
		animated_sprite_2d.play("mh")
		PlayerHealth.max_health+=5
		Items.items-=20
		updtate_labels()
		await get_tree().create_timer(2).timeout
		animated_sprite_2d.hide()


func _on_retry_pressed() -> void:
	resume()
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	PlayerHealth.health=50
	PlayerHealth.max_health=50
	Power.amount=10
	Items.items=0
	get_tree().change_scene_to_file("res://Levels/00_Hason_Nogor/01.tscn")


func _on_power_pressed() -> void:
	if(Items.items>=20):
		animated_sprite_2d.show()
		animated_sprite_2d.play("st")
		Power.amount+=5
		Items.items-=20
		updtate_labels()
		await get_tree().create_timer(2).timeout
		animated_sprite_2d.hide()
