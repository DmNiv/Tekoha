extends State

func enter():
	owner_node.velocity = Vector2.ZERO

func exit():
	pass

func update(_delta: float):
	if owner_node.move_direction:
		transition_to("Walk")
	owner_node.check_roll_input()
	owner_node.check_attack_input()

func physics_update(_delta: float):
	owner_node.set_direction()
