class_name StateStun extends State

@onready var parent : CharacterBody2D = $"../.."
@onready var animation_tree: AnimationTree = $"../../AnimationTree"
@onready var animation_root_node = animation_tree["parameters/playback"]

func Enter():
	print("alo")
	if parent:
		animation_root_node.travel("Stun")

func Exit():
	pass

func Update(_delta: float):
	pass

func Physics_Update(_delta: float):
	pass


func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if anim_name in ["take_dmg_down", "take_dmg_up", "take_dmg_left", "take_dmg_right"]:
		Transitioned.emit(self, "Idle")
