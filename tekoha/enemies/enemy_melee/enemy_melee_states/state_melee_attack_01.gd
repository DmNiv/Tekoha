extends State

@onready var player: Player = get_tree().get_first_node_in_group("Player")

var distance_to_player: Vector2
var weapon: EnemyWeapon

@export var attack_velocity: int

func enter():
	if state_machine.current_state.name == "Attack01":
		animation_root_node.travel("MeleeAttack01")
		owner_node.velocity = Vector2.ZERO
		weapon = owner_node.weapon
		
		weapon.attack_damage = owner_node.attack_damage
		weapon.attack_knockback = owner_node.attack_knockback
		weapon.stun_time = owner_node.attack_stun_time

func exit():
	stop_attack()

func update(_delta: float):
	pass

func physics_update(_delta: float):
	pass

func attack():
	if state_machine.current_state.name == "Attack01":
		owner_node.velocity = (owner_node.move_direction) * attack_velocity
		weapon.weapon_collision.set_deferred("disabled", false)
	
func stop_attack():
	if state_machine.current_state.name == "Attack01":
		weapon.weapon_collision.set_deferred("disabled", true)
		owner_node.velocity = Vector2.ZERO
		owner_node.last_facing_direction = owner_node.move_direction

func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if state_machine.current_state.name == "Attack01":
		if anim_name in ["melee_attack01_down", "melee_attack01_up", "melee_attack01_left", "melee_attack01_right"] and player:
			owner_node.last_facing_direction = player.global_position
			transition_to("Aim")
