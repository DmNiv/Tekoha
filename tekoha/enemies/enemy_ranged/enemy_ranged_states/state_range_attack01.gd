class_name StateRangeAttack01Enemy extends State

@onready var enemy: Enemy = $"../.."
@onready var player: Player = get_tree().get_first_node_in_group("Player")

@export var projectile: PackedScene

var distance_to_player: Vector2

func enter():
	if enemy:
		animation_root_node.travel("RangeAttack01")
		enemy.velocity = Vector2.ZERO

func exit():
	pass

func update(_delta: float):
	pass

func physics_update(delta: float):
	pass
	

func shoot():
	var projectile_instance: Projectile = projectile.instantiate()
	get_tree().current_scene.add_child(projectile_instance)
	projectile_instance.global_position = enemy.global_position
	projectile_instance.attack = enemy.attack
	projectile_instance.direction = (player.global_position - enemy.global_position).normalized()
	
func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if anim_name in ["range_attack01_down", "range_attack01_up", "range_attack01_left", "range_attack01_right"]:
		enemy.last_facing_direction = player.global_position
		transition_to("Aim")
