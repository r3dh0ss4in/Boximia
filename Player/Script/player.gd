class_name Player
extends CharacterBody2D

#region // State Machine Variables
var states:Array[PlayerState]
var curr_state:PlayerState:
	get : return states.front()
var pre_state:PlayerState:
	get : return states[1]
#endregion

#region // Onready Variables
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var collision_stand: CollisionShape2D = $CollisionStand
@onready var collision_crouch: CollisionShape2D = $CollisionCrouch
@onready var f_ground_ray_cast: RayCast2D = $f_ground_RayCast
@onready var f_ground_ray_cast_2: RayCast2D = $f_ground_RayCast2
@onready var wall_ray_cast: RayCast2D = $wall_RayCast
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite

#endregion

#region // Standard Variables
var direction:Vector2=Vector2.ZERO
@export var SPEED:float=150
@export var JUMP_VELOCITY:float=-400
#endregion

@onready var label: Label = $Label


func _ready() -> void:
	initialize_state()
	#self.call_deferred("reparent",get_tree().root)
	pass

func _unhandled_input(event: InputEvent) -> void:
	change_state(curr_state.handle_input(event))

func _process(delta: float) -> void:
	update_direction()
	change_state(curr_state.process(delta))

func _physics_process(delta: float) -> void:
	velocity+=get_gravity()*delta
	move_and_slide()
	change_state(curr_state.physics_process(delta))

func initialize_state():
	states=[]
	# Gather all states
	for c in $States.get_children():
		if c is PlayerState:
			states.append(c)
			c.player=self
	if states.size()==0:
		return
	
	# Initialize all states
	for state in states:
		state.init()
	
	# Set our first state
	change_state(curr_state)
	curr_state.enter()
	label.text=curr_state.name


func change_state(new_state:PlayerState):
	if new_state==null:
		return
	elif new_state==curr_state:
		return
	if curr_state:
		curr_state.exit()
	states.push_front(new_state)
	curr_state.enter()
	label.text=curr_state.name
	states.resize(3)

func update_direction():
	var pre_direction:Vector2=direction
	var x_axis=Input.get_axis("move_left","move_right")
	var y_axis=Input.get_axis("up","down")
	direction=Vector2(x_axis,y_axis)
	if direction.x!=pre_direction.x:
		if direction.x<0:
			animated_sprite.flip_h=true
		elif direction.x>0:
			animated_sprite.flip_h=false
	pass
	
