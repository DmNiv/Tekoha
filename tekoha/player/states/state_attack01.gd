extends State

const ATTACK_VELOCITY: int = 50
const ATTACK_DAMAGE: int = 15
const ATTACK_KNOCKBACK: int = 20
var weapon: PlayerWeapon

func enter():
	weapon = owner_node.weapon
	owner_node.velocity = Vector2.ZERO
	# Atualiza a direção do mouse
	owner_node.set_mouse_direction()
	# Direção do ataque é a do mouse
	owner_node.attack_direction = owner_node.mouse_direction
	# Altera os valores do ataque
	weapon.attack_damage = ATTACK_DAMAGE
	weapon.attack_knockback = ATTACK_KNOCKBACK
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
	weapon.weapon_collision.disabled = false
	
func stop_attack():
	owner_node.velocity = Vector2.ZERO
	owner_node.last_facing_direction = owner_node.mouse_direction
	weapon.weapon_collision.disabled = true

func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if anim_name in ["attack01_down", "attack01_up", "attack01_left", "attack01_right"]:
		transition_to("AttackEnd")
