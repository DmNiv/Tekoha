extends State

func enter():
	animation_root_node.travel("AttackEnd")

func exit():
	pass

func update(_delta: float):
	owner_node.check_attack_input()
	owner_node.check_roll_input()

func physics_update(_delta: float):
	pass

func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if anim_name in ["attack_end_down", "attack_end_up", "attack_end_left", "attack_end_right"]:
		transition_to("Idle")
