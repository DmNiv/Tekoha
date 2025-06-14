extends State

@onready var player: Player = get_tree().get_first_node_in_group("Player")

var distance_to_player: Vector2
var wander_time: float

func enter():
	if state_machine.current_state.name == "Wander":
		randomize_wander()

func exit():
	pass

func update(delta: float):
	owner_node.target_player()
	
	if wander_time > 0:
		wander_time -= delta
	else:
		transition_to("Idle")

func physics_update(_delta: float):
	owner_node.velocity = owner_node.move_direction * owner_node.speed
	if player:
		distance_to_player = player.global_position - owner_node.global_position
		if distance_to_player.length() < owner_node.radius_to_follow and owner_node.is_seeing_player():
			transition_to("Follow")

func randomize_wander():
	if state_machine.current_state.name == "Wander":
		owner_node.move_direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
		wander_time = randf_range(1, 2)
