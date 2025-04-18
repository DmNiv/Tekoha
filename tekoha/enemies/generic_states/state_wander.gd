class_name StateWanderEnemy extends State

@export var enemy: Enemy
@export var range_to_follow: int
@onready var player: Player = get_tree().get_first_node_in_group("Player")

var wander_time: float
var distance_to_player: Vector2

func randomize_wander():
	enemy.move_direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	wander_time = randf_range(1, 2)

func enter():
	if enemy:
		randomize_wander()

func exit():
	pass

func update(delta: float):
	if wander_time > 0:
		wander_time -= delta
	else:
		transition_to("Idle")

func physics_update(_delta: float):
	if enemy:
		enemy.velocity = enemy.move_direction * enemy.SPEED
	if player and enemy:
		distance_to_player = player.global_position - enemy.global_position
		if distance_to_player.length() < range_to_follow:
			transition_to("Follow")
