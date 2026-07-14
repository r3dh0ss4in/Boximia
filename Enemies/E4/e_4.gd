extends CharacterBody2D

enum State { PATROL, CHASE, ATTACK, HURT, DEAD }
var current_state: State=State.PATROL:
	set(value):
		current_state=value
		_update_state_label()

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var label: Label = $Label
@onready var attk: Marker2D = $Attack
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var collision_shape_2d_: CollisionShape2D = $AttackArea/CollisionShape2D


var direction: float = 1.0 
var player_ref: CharacterBody2D = null
var current_health: int

@export var SPEED:float=80.0
@export var CHASE_SPEED:float=80
@export var MAX_HEALTH:int=110


func _ready() -> void:
	current_health=MAX_HEALTH
	animated_sprite_2d.animation_finished.connect(_on_animated_sprite_2d_animation_finished)

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity+=get_gravity()*delta
	match current_state:
		State.PATROL:
			patrol()
		State.CHASE:
			chase()
		State.ATTACK:
			attack()
		State.HURT:
			hurt()
		State.DEAD:
			die()
	move_and_slide()

func patrol():
	animated_sprite_2d.play("Pray")
	if is_on_wall():
		direction*=-1
	velocity.x=0
	animated_sprite_2d.flip_h = (direction < 0)

func chase():
	if player_ref:
		animated_sprite_2d.play("Run")
		var dir_to_player=sign(player_ref.global_position.x-global_position.x)
		velocity.x+=dir_to_player*CHASE_SPEED
		if dir_to_player!=0:
			update_facing(dir_to_player)
	else:
		current_state=State.PATROL


func attack():
	velocity.x=0
	animated_sprite_2d.play("Attack")

func hurt():
	velocity.x=0
	animated_sprite_2d.play("Hurt")
	await get_tree().create_timer(1).timeout
	current_state=State.ATTACK
	

func take_damage():
	if current_health<=0:
		return
	current_health-=Power.amount
	if current_health<=0:
		current_state=State.DEAD
	else:
		current_state=State.HURT

func die():
	velocity.x=0
	animated_sprite_2d.play("Dead")
	attk.visible=false
	Items.items+=70
	collision_shape_2d.visible=false
	set_physics_process(false)
	attk.visible=false
	await get_tree().create_timer(2).timeout
	queue_free()

func change_direction():
	direction*=-1
	update_facing(direction)

func update_facing(dir: float):
	animated_sprite_2d.flip_h=dir<0
	

func _update_state_label():
	if not is_inside_tree() or label == null:
		return
		
	# Match the current state enum to a readable string text
	match current_state:
		State.PATROL:
			label.text = "PATROL"
		State.CHASE:
			label.text = "CHASE"
		State.ATTACK:
			label.text = "ATTACK"
		State.HURT:
			label.text = "HURT"
		State.DEAD:
			label.text= "DEAD"


func _on_player_detector_body_entered(body: Node2D) -> void:
	if body is Player:
		player_ref=body
		if current_state not in [State.ATTACK,State.HURT,State.DEAD]:
			current_state=State.CHASE


func _on_player_detector_body_exited(body: Node2D) -> void:
	if body==player_ref:
		player_ref=null
		if current_state!=State.HURT:
			current_state=State.PATROL




func _on_attack_area_body_entered(body: Node2D) -> void:
	if body is Player:
		if current_state!=State.HURT:
			current_state=State.ATTACK
		



func _on_attack_area_body_exited(body: Node2D) -> void:
	if body==player_ref:
		if current_state!=State.HURT:
			await get_tree().create_timer(1).timeout
			current_state=State.CHASE


func _on_animated_sprite_2d_animation_finished() -> void:
	if current_state == State.HURT:
		if player_ref:
			current_state = State.CHASE
		else:
			current_state = State.PATROL
			
	elif current_state == State.ATTACK:
		if player_ref:
			current_state = State.CHASE

func _attack():
	const atk=preload("res://Enemies/E4/e_4_attack.tscn")
	var new_ik=atk.instantiate()
	new_ik.global_position=attk.global_position
	get_parent().add_child(new_ik)


func _on_timer_timeout() -> void:
	if current_state==State.ATTACK:
		_attack()
