extends State

@onready var player: Player = get_tree().get_first_node_in_group("Player")

var distance_to_player: Vector2

const ATTACK_VELOCITY: int = 50

var weapon: EnemyWeapon

func enter():
	animation_root_node.travel("MeleeAttack01")
	weapon = owner_node.weapon
	owner_node.velocity = Vector2.ZERO
	# Altera os valores do ataque
	weapon.attack_damage = owner_node.attack_damage
	weapon.attack_knockback = owner_node.attack_knockback
	weapon.stun_time = owner_node.ATTACK_STUN_TIME

func exit():
	pass

func update(_delta: float):
	pass

func physics_update(_delta: float):
	pass

func attack():
	owner_node.velocity = (owner_node.move_direction) * ATTACK_VELOCITY
	weapon.weapon_collision.set_deferred("disabled", false)
	
func stop_attack():
	weapon.weapon_collision.set_deferred("disabled", true)
	owner_node.velocity = Vector2.ZERO
	owner_node.last_facing_direction = owner_node.move_direction

func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if anim_name in ["melee_attack01_down", "melee_attack01_up", "melee_attack01_left", "melee_attack01_right"] and player:
		owner_node.last_facing_direction = player.global_position
		transition_to("Aim")
