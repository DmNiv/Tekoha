extends State

func enter():
	animation_root_node.travel("AttackEnd")

func exit():
	pass

func update(_delta: float):
	if Input.is_action_just_pressed("attack"):
		transition_to("Attack02")
	elif Input.is_action_just_pressed("roll") and owner_node.can_roll:
		transition_to("Roll")

func physics_update(_delta: float):
	pass

func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if anim_name in ["attack_end_down", "attack_end_up", "attack_end_left", "attack_end_right"]:
		transition_to("Idle")
