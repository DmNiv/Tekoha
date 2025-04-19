class_name StateIdleEnemy extends State

@export var range_to_follow: int
@onready var player: Player = get_tree().get_first_node_in_group("Player")

var idle_time: float
var distance_to_player: Vector2

func randomize_time():
	idle_time = randf_range(1, 2)

func enter():
	owner_node.velocity = Vector2.ZERO
	randomize_time()

func exit():
	pass

func update(delta: float):
	if idle_time > 0:
		idle_time -= delta
	else:
		transition_to("Wander")

func physics_update(_delta: float):
	if player:
		distance_to_player = player.global_position - owner_node.global_position
		if distance_to_player.length() < range_to_follow:
			transition_to("Follow")
