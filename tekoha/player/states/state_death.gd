class_name StateDeath extends State

@onready var hitbox: CollisionShape2D = $"../../HitboxComponent/Hitbox"

func enter():
	hitbox.set_deferred("disabled", true)
	animation_root_node.travel("Death")

func exit():
	owner_node.die()

func update(_delta: float):
	pass

func physics_update(_delta: float):
	pass

func transition_to(state_name: String):
	Transitioned.emit(state_name)


func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if state_machine.current_state.name == "Death":
		if anim_name in ["death_down", "death_left", "death_right", "death_up"]:
			owner_node.die()
