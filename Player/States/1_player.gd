@icon("res://Player/States/state.svg")

class_name PlayerState
extends Node


var player:Player
var next_state:PlayerState

#region // state references
@onready var idle: PlayerStateIdle = %Idle
@onready var run: PlayerStateRun = %Run
@onready var jump: PlayerStateJump = %Jump
@onready var fall: PlayerStateFall = %Fall
@onready var crouch: PlayerStateCrouch = %Crouch
@onready var attack: PlayerStateAttack = %Attack
@onready var hurt: PlayerStateHurt = %Hurt

#endregion

# What happens when this function is initialized?
func init():
	pass

# What happens when we enter this state?
func enter():
	pass
	
# What happens when we exit this state?
func exit():
	pass

# What happens when an input is Pressed?
func handle_input(_event:InputEvent) -> PlayerState:
	# handle input
	return next_state

# What happens when process tick in this state?
func process(delta:float) -> PlayerState:
	return next_state

# What happens when physics_process tick in this state?
func physics_process(delta:float) -> PlayerState:
	return next_state
