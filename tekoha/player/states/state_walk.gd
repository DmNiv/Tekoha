extends State

func enter():
	pass

func exit():
	pass

func update(_delta: float):
	if !owner_node.velocity:
		transition_to("Idle")
	elif Input.is_action_just_pressed("roll") and owner_node.can_roll:
		transition_to("Roll")
	elif Input.is_action_just_pressed("attack"):
		transition_to("Attack01")

func physics_update(_delta: float):
	owner_node.set_direction()
	owner_node.velocity = owner_node.move_direction * owner_node.SPEED
