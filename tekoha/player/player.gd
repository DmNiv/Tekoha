class_name Player extends CharacterBody2D

# Variáveis de movimentação
const SPEED : float = 100.0
var move_direction : Vector2
var mouse_direction: Vector2
var last_facing_direction = Vector2(0, 1)
var idle

# Variáveis de ataque
var attack_direction : Vector2 = Vector2.ZERO

# Variáveis de cambalhota
var roll_direction : Vector2 = Vector2.ZERO
var can_roll: bool = true

# Variáveis de controle
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var state_machine: StateMachine = $StateMachine
@onready var owner_info : OwnerInfo
@onready var weapon: PlayerWeapon = $Weapon

signal Player_dead

func _ready() -> void:
	owner_info = OwnerInfo.new()
	owner_info.owner_node = self
	owner_info.animation_tree = animation_tree
	owner_info.animation_root_node = animation_tree["parameters/playback"]
	state_machine.init(owner_info)

func _physics_process(_delta: float) -> void:
	idle = !velocity
	if !idle:
		last_facing_direction = move_direction
	move_and_slide()

func set_direction():
	move_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	
func set_mouse_direction():
	mouse_direction = (get_global_mouse_position() - global_position).normalized()

func check_attack_input():
	if Input.is_action_just_pressed("attack"):
		if state_machine.current_state.name != "AttackEnd":
			state_machine.current_state.transition_to("Attack01")
		else:
			state_machine.current_state.transition_to("Attack02")

func check_roll_input():
	if Input.is_action_just_pressed("roll") and can_roll:
		state_machine.current_state.transition_to("Roll")

func _on_roll_timer_timeout() -> void:
	can_roll = true

func die():
	queue_free()
	emit_signal("Player_dead")
