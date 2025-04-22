extends State

var weapon: PlayerWeapon 

const ATTACK_VELOCITY: int = 75
const ATTACK_DAMAGE: int = 30
const ATTACK_KNOCKBACK: int = 25
const STUN_TIME: float = 0.75

func enter():
	weapon = owner_node.weapon
	#owner_node.can_attack = false
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
	animation_root_node.travel("Attack02")

func exit():
	stop_attack()

func update(_delta: float):
	pass

func physics_update(_delta: float):
	pass

func attack():
	owner_node.velocity = (owner_node.attack_direction) * ATTACK_VELOCITY
	weapon.weapon_collision.set_deferred("disabled", false)

func stop_attack():
	weapon.weapon_collision.set_deferred("disabled", true)
	owner_node.velocity = Vector2.ZERO
	owner_node.last_facing_direction = owner_node.mouse_direction

func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if anim_name in ["attack02_down", "attack02_up", "attack02_left", "attack02_right"]:
		transition_to("Idle")
