class_name PlayerStateCrouch
extends PlayerState

#region // Variables
@export var slow_down:float=2
#endregion

# What happens when this function is initialized?
func init():
	pass

# What happens when we enter this state?
func enter():
	# Play animation
	player.collision_stand.visible=false
	player.collision_crouch.visible=true
	player.animated_sprite.play("Slide")
	
# What happens when we exit this state?
func exit():
	pass

# What happens when an input is Pressed?
func handle_input(_event:InputEvent) -> PlayerState:
	if _event.is_action_pressed("jump"):
		if player.f_ground_ray_cast.is_colliding() or player.f_ground_ray_cast_2.is_colliding():
			player.position.y+=4
			player.collision_stand.visible=true
			player.collision_crouch.visible=false
			return fall
	return next_state

# What happens when process tick in this state?
func process(delta:float) -> PlayerState:
	if player.direction.y<=0:
		player.collision_stand.visible=true
		player.collision_crouch.visible=false
		return idle
	return next_state

# What happens when physics_process tick in this state?
func physics_process(delta:float) -> PlayerState:
	player.velocity.x-=player.velocity.x*slow_down*delta
	return next_state
