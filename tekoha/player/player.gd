class_name Player extends CharacterBody2D

# Variáveis de movimentação
const SPEED : float = 100.0
var move_direction : Vector2
var mouse_position: Vector2
var last_facing_direction = Vector2(0, 1)
var idle

# Variáveis de ataque
var attack_direction : Vector2 = Vector2.ZERO
var can_attack : bool = true

# Variáveis de Dash
var can_dash: bool = true

func _physics_process(_delta: float) -> void:
	idle = !velocity
	if !idle:
		last_facing_direction = move_direction
	
	move_and_slide()

func set_direction():
	move_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	
func set_mouse_position():
	mouse_position = (get_global_mouse_position() - global_position).normalized()
