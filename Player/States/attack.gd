class_name PlayerStateAttack
extends PlayerState

#region // Variables

#endregion

# What happens when this function is initialized?
func init():
	pass

# What happens when we enter this state?
func enter():
	# Play animation
	player.animated_sprite.play("Slashing")
	
# What happens when we exit this state?
func exit():
	pass

# What happens when an input is Pressed?
func handle_input(_event:InputEvent) -> PlayerState:
	if _event.is_action_released("shoot"):
		return idle
	return next_state

# What happens when process tick in this state?
func process(delta:float) -> PlayerState:
	return next_state

# What happens when physics_process tick in this state?
func physics_process(delta:float) -> PlayerState:
	player.velocity.x-=player.velocity.x*5*delta
	return next_state
