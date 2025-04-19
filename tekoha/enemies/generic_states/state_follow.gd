class_name StateFollowEnemy extends State

@export var range_to_aim: int
@onready var player: Player = get_tree().get_first_node_in_group("Player")

var distance_to_player: Vector2

func enter():
	pass

func exit():
	pass

func update(delta: float):
	pass

func physics_update(_delta: float):
	if player:
		distance_to_player = player.global_position - owner_node.global_position
		owner_node.move_direction = distance_to_player
		owner_node.velocity = owner_node.move_direction.normalized() * owner_node.SPEED
		if distance_to_player.length() < range_to_aim:
			transition_to("Aim")
