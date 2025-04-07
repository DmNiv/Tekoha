class_name PlayerStateAttack01 extends State

@onready var animation_tree: AnimationTree = $"../../AnimationTree"
@onready var animation_root_node = animation_tree["parameters/playback"]
@onready var player: Player = $"../.."
@onready var weapon: PlayerWeapon = $"../../Weapon"

const ATTACK_VELOCITY: int = 50
const ATTACK_DAMAGE: int = 15
const ATTACK_KNOCKBACK: int = 20

func Enter():
	if player:
		player.velocity = Vector2.ZERO
		# Atualiza a direção do mouse
		player.set_mouse_direction()
		# Direção do ataque é a do mouse
		player.attack_direction = player.mouse_direction
		# Altera os valores do ataque
		weapon.attack_damage = ATTACK_DAMAGE
		weapon.attack_knockback = ATTACK_KNOCKBACK
		# Animação de ataque
		animation_root_node.travel("Attack01")

func Exit():
	pass

func Update(_delta: float):
	pass

func Physics_Update(_delta: float):
	pass

func attack():
	if player:
		player.velocity = (player.attack_direction) * ATTACK_VELOCITY
		weapon.weapon_collision.disabled = false
	
func stop_attack():
	if player:
		player.velocity = Vector2.ZERO
		player.last_facing_direction = player.mouse_direction
		weapon.weapon_collision.disabled = true

func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if anim_name in ["attack01_down", "attack01_up", "attack01_left", "attack01_right"]:
		stop_attack()
		Transitioned.emit(self, "AttackEnd")
