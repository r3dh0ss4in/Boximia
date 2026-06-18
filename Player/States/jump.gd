class_name PlayerStateJump
extends PlayerState

#region // Variables

#endregion

# What happens when this function is initialized?
func init():
	pass

# What happens when we enter this state?
func enter():
	# Play animation
	player.collision_crouch.visible=false
	player.animated_sprite.play("Jump")
	player.velocity.y=player.JUMP_VELOCITY
	pass
	
# What happens when we exit this state?
func exit():
	pass

# What happens when an input is Pressed?
func handle_input(_event:InputEvent) -> PlayerState:
	if _event.is_action_released("jump"):
		player.velocity.y*=0.5
		return fall
	if _event.is_action_pressed("shoot"):
		return attack
	return next_state

# What happens when process tick in this state?
func process(delta:float) -> PlayerState:
	if player.is_on_floor():
		return idle
	return next_state

# What happens when physics_process tick in this state?
func physics_process(delta:float) -> PlayerState:
	if player.velocity.y>=0:
		return fall
	player.velocity.x=player.direction.x*player.SPEED
	return next_state
