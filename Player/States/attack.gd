class_name PlayerStateAttack
extends PlayerState

#region // Variables
#var atc=Marker2D
#endregion

# What happens when this function is initialized?
func init():
	#atc=Player.attack
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

#func shoot():
	#const atk=preload("res://General/Scenes/ohho_rock.tscn")
	#var new_atk=atk.instantiate()
	#new_ik.global_position=atc.global_position
	#get_parent().add_child(new_atk)
# What happens when physics_process tick in this state?
func physics_process(delta:float) -> PlayerState:
	player.velocity.x-=player.velocity.x*5*delta
	return next_state
