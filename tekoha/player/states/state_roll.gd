extends State

@export var roll_timer: Timer
@export var hitbox: CollisionShape2D


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
	stop_roll()
	roll_timer.start()

func update(_delta: float):
	pass

func physics_update(_delta: float):
	pass

func roll():
	owner_node.velocity = ROLL_SPEED * owner_node.roll_direction
	hitbox.set_deferred("disabled", true)
	
func stop_roll():
	owner_node.velocity = Vector2.ZERO
	owner_node.last_facing_direction = owner_node.roll_direction
	hitbox.set_deferred("disabled", false)

func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if anim_name in ["roll_down", "roll_up", "roll_left", "roll_right"]:
		transition_to("Idle")
