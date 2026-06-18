class_name PlayerStateRun
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
	player.animated_sprite.play("Run")
	pass
	
# What happens when we exit this state?
func exit():
	pass

# What happens when an input is Pressed?
func handle_input(_event:InputEvent) -> PlayerState:
	# handle input
	if _event.is_action_pressed("jump"):
		return jump
	elif _event.is_action_pressed("shoot"):
		return attack
	return next_state

# What happens when process tick in this state?
func process(delta:float) -> PlayerState:
	if player.direction.x==0:
		return idle
	elif player.direction.y>0:
		return crouch
	return next_state

# What happens when physics_process tick in this state?
func physics_process(delta:float) -> PlayerState:
	player.velocity.x=player.direction.x*player.SPEED
	return next_state
