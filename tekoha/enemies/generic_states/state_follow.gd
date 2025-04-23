extends State

@onready var player: Player = get_tree().get_first_node_in_group("Player")

var distance_to_player: Vector2

func enter():
	pass

func exit():
	pass

func update(_delta: float):
	owner_node.target_player()
	pass

func physics_update(_delta: float):
	if player:
		distance_to_player = player.global_position - owner_node.global_position
		owner_node.move_direction = distance_to_player.normalized()
		owner_node.velocity = owner_node.move_direction * owner_node.speed
		if distance_to_player.length() < owner_node.radius_to_aim:
			transition_to("Aim")
