class_name StateRoll extends State

@onready var animation_tree: AnimationTree = $"../../AnimationTree"
@onready var animation_root_node = animation_tree["parameters/playback"]
@onready var player: Player = $"../.."
@onready var hitbox: CollisionShape2D = $"../../HitboxComponent/Hitbox"
@onready var roll_timer: Timer = $"../../RollTimer"


const ROLL_SPEED : int = 150

func Enter():
	if player:
		player.can_roll = false
		#player.velocity = Vector2.ZERO
		# Atualiza a direção do mouse
		player.set_mouse_direction()
		# Direção do ataque é a do mouse
		player.roll_direction = player.mouse_direction
		# Animação de cambalhota
		animation_root_node.travel("Roll")

func Exit():
	if player:
		roll_timer.start()

func Update(_delta: float):
	pass

func Physics_Update(_delta: float):
	pass

func dash():
	if player:
		player.velocity = ROLL_SPEED * player.roll_direction
		hitbox.disabled = true
	
func stop_dash():
	if player:
		player.velocity = Vector2.ZERO
		player.last_facing_direction = player.roll_direction
		hitbox.disabled = false

func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if anim_name in ["roll_down", "roll_up", "roll_left", "roll_right"]:
		Transitioned.emit(self, "Idle")
