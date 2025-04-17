extends State

func enter():
	owner_node.velocity = Vector2.ZERO

func exit():
	pass

func update(_delta: float):
	if owner_node.move_direction:
		transition_to("Walk")
	elif Input.is_action_just_pressed("roll") and owner_node.can_roll:
		transition_to("Roll")
	elif Input.is_action_just_pressed("attack"):
		transition_to("Attack01")

func physics_update(_delta: float):
	owner_node.set_direction()
