class_name StateAttackEnd extends State

@onready var animation_tree: AnimationTree = $"../../AnimationTree"
@onready var animation_root_node = animation_tree["parameters/playback"]
@onready var player: Player = $"../.."

func Enter():
	if player:
		#player.can_attack = false
		animation_root_node.travel("AttackEnd")

func Exit():
	pass

func Update(_delta: float):
	if Input.is_action_just_pressed("attack"):
		Transitioned.emit(self, "Attack02")

func Physics_Update(_delta: float):
	pass

func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if anim_name in ["attack_end_down", "attack_end_up", "attack_end_left", "attack_end_right"]:
		Transitioned.emit(self, "Idle")
