class_name StateFollowEnemy extends State

@export var enemy: Enemy
@export var range: int
@export var range_to_attack: int
@onready var player: Player = get_tree().get_first_node_in_group("Player")

var distance_to_player: Vector2

func Enter():
	print("follow")
	pass

func Exit():
	pass

func Update(delta: float):
	pass

func Physics_Update(_delta: float):
	if player:
		distance_to_player = player.global_position - enemy.global_position
		enemy.move_direction = distance_to_player
		enemy.velocity = enemy.move_direction.normalized() * enemy.SPEED
		if distance_to_player.length() > range:
			Transitioned.emit(self, "Wander")
		if distance_to_player.length() < range_to_attack:
			Transitioned.emit(self, "RangeAttack01")
