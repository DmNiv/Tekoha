class_name Player extends CharacterBody2D

# Variáveis de movimentação
const SPEED : float = 100.0
var move_direction : Vector2
var mouse_direction: Vector2
var last_facing_direction = Vector2(0, 1)
var idle

# Variáveis de ataque
var attack_direction : Vector2 = Vector2.ZERO

var roll_direction : Vector2 = Vector2.ZERO
var can_roll: bool = true

@onready var animation_tree: AnimationTree = $AnimationTree

func _ready() -> void:
	animation_tree.active = true

func _physics_process(_delta: float) -> void:
	idle = !velocity
	if !idle:
		last_facing_direction = move_direction
	move_and_slide()

func set_direction():
	move_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	
func set_mouse_direction():
	mouse_direction = (get_global_mouse_position() - global_position).normalized()

func _on_roll_timer_timeout() -> void:
	can_roll = true
