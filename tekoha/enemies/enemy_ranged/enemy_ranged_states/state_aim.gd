class_name StateAimEnemy extends State

@export var range_to_attack: int 
@export var range_to_exit: int
@onready var player: Player = get_tree().get_first_node_in_group("Player")

const PROJECTILE_COOLDOWN: float = 2.0
var projectile_timer: float = 0.0
var distance_to_player: Vector2

func enter():
	projectile_timer = PROJECTILE_COOLDOWN
	owner_node.velocity = Vector2.ZERO

func exit():
	pass

func update(delta: float):
	pass

func physics_update(delta: float):
	if player:
		distance_to_player = player.global_position - owner_node.global_position
		owner_node.move_direction = distance_to_player
	
		if distance_to_player.length() > range_to_exit:
			transition_to("Follow")
		elif distance_to_player.length() < range_to_attack:
			owner_node.velocity = -owner_node.move_direction.normalized() * (owner_node.SPEED*0.8)
	
	if projectile_timer > 0:
		projectile_timer -= delta
	else:
		transition_to("RangeAttack01")
