extends State

const ATTACK_VELOCITY: int = 50
const ATTACK_DAMAGE: int = 15
const ATTACK_KNOCKBACK: int = 20
const STUN_TIME: float = 0.5
var weapon: PlayerWeapon

func enter():
	print("attack01")
	weapon = owner_node.weapon
	owner_node.velocity = Vector2.ZERO
	# Atualiza a direção do mouse
	owner_node.set_mouse_direction()
	# Direção do ataque é a do mouse
	owner_node.attack_direction = owner_node.mouse_direction
	# Altera os valores do ataque
	weapon.attack_damage = ATTACK_DAMAGE
	weapon.attack_knockback = ATTACK_KNOCKBACK
	weapon.stun_time = STUN_TIME
	# Animação de ataque
	animation_root_node.travel("Attack01")

func exit():
	stop_attack()

func update(_delta: float):
	pass

func physics_update(_delta: float):
	pass

func attack():
	owner_node.velocity = (owner_node.attack_direction) * ATTACK_VELOCITY
	print("ligou")
	weapon.weapon_collision.set_deferred("disabled", false)
	
func stop_attack():
	print("entrou")
	print("altera colisão")
	weapon.weapon_collision.set_deferred("disabled", true)
	print("desligou")
	owner_node.velocity = Vector2.ZERO
	owner_node.last_facing_direction = owner_node.mouse_direction

func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if anim_name in ["attack01_down", "attack01_up", "attack01_left", "attack01_right"] and state_machine.current_state.name == "Attack01":
		transition_to("AttackEnd")
