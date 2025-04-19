extends State

@onready var player: Player = get_tree().get_first_node_in_group("Player")

@export var projectile: PackedScene

var distance_to_player: Vector2

func enter():
	animation_root_node.travel("RangeAttack01")
	owner_node.velocity = Vector2.ZERO

func exit():
	pass

func update(_delta: float):
	pass

func physics_update(_delta: float):
	pass

func shoot():
	if player:
		var projectile_instance: Projectile = projectile.instantiate()
		get_tree().current_scene.add_child(projectile_instance)
		projectile_instance.global_position = owner_node.global_position
		projectile_instance.attack = owner_node.attack
		projectile_instance.direction = (player.global_position - owner_node.global_position).normalized()

func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if anim_name in ["range_attack01_down", "range_attack01_up", "range_attack01_left", "range_attack01_right"] and player:
		owner_node.last_facing_direction = player.global_position
		transition_to("Aim")
