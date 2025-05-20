extends State

@onready var player: Player = get_tree().get_first_node_in_group("Player")

var distance_to_player: Vector2

@export var COOLDOWN: float = 2.0
var timer: float = 0.0

func enter():
	if state_machine.current_state.name == "Aim":
		timer = COOLDOWN
		owner_node.velocity = Vector2.ZERO

func exit():
	pass

func update(delta: float):
	owner_node.target_player()
	
	if timer > 0:
		timer -= delta
	else:
		if owner_node.ray_cast.is_colliding() and owner_node.ray_cast.get_collider() is HitboxComponent:
			transition_to("Attack01")
		else:
			timer = COOLDOWN

func physics_update(_delta: float):
	if player:
		distance_to_player = player.global_position - owner_node.global_position
		owner_node.move_direction = distance_to_player.normalized()
		
		if distance_to_player.length() > (owner_node.radius_to_aim + 20):
			transition_to("Follow")
		elif distance_to_player.length() < owner_node.radius_to_move_away:
			owner_node.velocity = -owner_node.move_direction * (owner_node.speed*0.8)
