extends State

@onready var player: Player = get_tree().get_first_node_in_group("Player")

var distance_to_player: Vector2
var idle_time: float

func enter():
	if state_machine.current_state.name == "Idle":
		owner_node.velocity = Vector2.ZERO
		randomize_time()

func exit():
	pass

func update(delta: float):
	owner_node.target_player()
	
	if idle_time > 0:
		idle_time -= delta
	else:
		transition_to("Wander")

func physics_update(_delta: float):
	if player:
		distance_to_player = player.global_position - owner_node.global_position
		if distance_to_player.length() < owner_node.radius_to_follow:
			transition_to("Follow")

func randomize_time():
	if state_machine.current_state.name == "Idle":
		idle_time = randf_range(1, 2)
