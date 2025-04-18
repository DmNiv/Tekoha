class_name StateFollowEnemy extends State

@export var enemy: Enemy
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
	if player and enemy:
		distance_to_player = player.global_position - enemy.global_position
		enemy.move_direction = distance_to_player
		enemy.velocity = enemy.move_direction.normalized() * enemy.SPEED
		if distance_to_player.length() < range_to_aim:
			transition_to("Aim")
