class_name StateRoll extends State

@onready var hitbox: CollisionShape2D = $"../../HitboxComponent/Hitbox"
@onready var roll_timer: Timer = $"../../RollTimer"


const ROLL_SPEED : int = 150

func enter():
	owner_node.can_roll = false
	#owner_node.velocity = Vector2.ZERO
	# Atualiza a direção do mouse
	owner_node.set_mouse_direction()
	# Direção do ataque é a do mouse
	owner_node.roll_direction = owner_node.mouse_direction
	# Animação de cambalhota
	animation_root_node.travel("Roll")

func exit():
	roll_timer.start()

func update(_delta: float):
	pass

func physics_update(_delta: float):
	pass

func dash():
	owner_node.velocity = ROLL_SPEED * owner_node.roll_direction
	hitbox.disabled = true
	
func stop_dash():
	owner_node.velocity = Vector2.ZERO
	owner_node.last_facing_direction = owner_node.roll_direction
	hitbox.disabled = false

func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if anim_name in ["roll_down", "roll_up", "roll_left", "roll_right"]:
		transition_to("Idle")
