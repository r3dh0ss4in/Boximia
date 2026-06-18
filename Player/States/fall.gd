class_name PlayerStateFall
extends PlayerState

#region // Variables
@export var coyote_time:float=0.4
@export var jump_buffer_time:float=0.125
var coyote_timer:float=0
var buffer_timer:float=0
#endregion

# What happens when this function is initialized?
func init():
	pass

# What happens when we enter this state?
func enter():
	# Play animation
	player.collision_crouch.visible=false
	player.animated_sprite.play("Fall")
	if player.pre_state==jump:
		coyote_timer=0;
	else:
		coyote_timer=coyote_time
	pass
	
# What happens when we exit this state?
func exit():
	pass

# What happens when an input is Pressed?
func handle_input(_event:InputEvent) -> PlayerState:
	if _event.is_action_pressed("jump"):
		if coyote_timer>0:
			return jump
		else:
			buffer_timer=jump_buffer_time
	if _event.is_action_pressed("shoot"):
		return attack
	return next_state

# What happens when process tick in this state?
func process(delta:float) -> PlayerState:
	coyote_timer-=delta
	buffer_timer-=delta
	if player.is_on_floor():
		return idle
	return next_state

# What happens when physics_process tick in this state?
func physics_process(delta:float) -> PlayerState:
	if player.is_on_floor():
		if buffer_timer>0:
			return jump
	player.velocity.x=player.direction.x*player.SPEED
	return next_state
