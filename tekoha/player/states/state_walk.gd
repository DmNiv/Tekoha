extends State

func enter():
	pass

func exit():
	pass

func update(_delta: float):
	if !owner_node.velocity:
		transition_to("Idle")
	owner_node.check_roll_input()
	owner_node.check_attack_input()

func physics_update(_delta: float):
	owner_node.set_direction()
	owner_node.velocity = owner_node.move_direction * owner_node.SPEED
