class_name PlayerStateHurt
extends PlayerState

@export var hurt_duration: float = 1.0
var hurt_timer: float = 0.0

func init():
	pass

func enter():
	player.animated_sprite_2d.show()
	player.animated_sprite_2d.play("Idle")
	player.animated_sprite.play("Hurt")
	hurt_timer = hurt_duration
	
func exit():
	pass

func handle_input(_event:InputEvent) -> PlayerState:
	return next_state

func process(delta: float) -> PlayerState:
	# Count down the timer by the time passed since the last frame
	hurt_timer -= delta
	# If time is up, transition to idle
	if hurt_timer <= 0.0:
		player.animated_sprite_2d.hide()
		return idle
	return next_state

func physics_process(delta: float) -> PlayerState:
	player.velocity.x = 0
	return next_state
