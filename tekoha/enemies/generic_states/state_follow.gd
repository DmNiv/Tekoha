class_name StateFollowEnemy extends State

@export var enemy: Enemy
@export var range: int
@export var range_to_attack: int
@onready var player: Player = get_tree().get_first_node_in_group("Player")

var direction_to_player: Vector2

func Enter():
	print("follow")
	pass

func Exit():
	pass

func Update(delta: float):
	pass

func Physics_Update(_delta: float):
	if player:
		direction_to_player = player.global_position - enemy.global_position
		enemy.move_direction = direction_to_player
		enemy.velocity = enemy.move_direction.normalized() * enemy.SPEED
		if direction_to_player.length() > range:
			Transitioned.emit(self, "Wander")
