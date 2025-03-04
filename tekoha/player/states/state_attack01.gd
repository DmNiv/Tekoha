class_name StateAttack01 extends State

@onready var animation_tree: AnimationTree = $"../../AnimationTree"
@onready var animation_root_node = animation_tree["parameters/playback"]
@onready var player: Player = $"../.."

func Enter():
	if player:
		player.velocity = Vector2.ZERO
		# Atualiza a direção do mouse
		player.set_mouse_position()
		# Direção do ataque é a do mouse
		player.attack_direction = player.mouse_position
		# ação de ataque
		animation_root_node.travel("Attack01")

func Exit():
	pass

func Update(_delta: float):
	pass

func Physics_Update(_delta: float):
	pass

func attack():
	player.velocity = (player.attack_direction) * player.ATTACK_VELOCITY
	
func stop_attack():
	player.velocity = Vector2.ZERO

func _on_animation_tree_animation_finished(_anim_name: StringName) -> void:
	Transitioned.emit(self, "Idle")
