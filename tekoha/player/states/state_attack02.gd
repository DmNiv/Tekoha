class_name StateAttack02 extends State

@onready var animation_tree: AnimationTree = $"../../AnimationTree"
@onready var animation_root_node = animation_tree["parameters/playback"]
@onready var player: Player = $"../.."
const ATTACK_VELOCITY: int = 50

func Enter():
	if player:
		#player.can_attack = false
		player.velocity = Vector2.ZERO
		# Atualiza a direção do mouse
		player.set_mouse_position()
		# Direção do ataque é a do mouse
		player.attack_direction = player.mouse_position
		# ação de ataque
		animation_root_node.travel("Attack02")

func Exit():
	pass

func Update(_delta: float):
	pass

func Physics_Update(_delta: float):
	pass

func attack():
	if player:
		player.velocity = (player.attack_direction) * ATTACK_VELOCITY

func stop_attack():
	if player:
		player.velocity = Vector2.ZERO
		player.last_facing_direction = player.mouse_position

func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if anim_name in ["attack02_down", "attack02_up", "attack02_left", "attack02_right"]:
		Transitioned.emit(self, "Idle")
