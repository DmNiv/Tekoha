class_name Enemy extends CharacterBody2D

const SPEED : float = 50.0 
var move_direction : Vector2
var last_facing_direction = Vector2(0, 1)

var radius_to_follow: int = 250
var radius_to_aim: int = 100
var radius_to_move_away: int = 50

var attack: Attack
var projectile_damage: int = 10
var projectile_knockback: int = 25
const PROJECTILE_STUN_TIME: float = 0.5

@onready var animation_tree: AnimationTree = $AnimationTree
@onready var state_machine: StateMachine = $StateMachine
@onready var owner_info : OwnerInfo

@onready var ray_cast: RayCast2D = $RayCast


func _ready() -> void:
	attack = Attack.new()
	attack.attack_damage = projectile_damage
	attack.knockback_force = projectile_knockback
	attack.stun_time = PROJECTILE_STUN_TIME
	
	owner_info = OwnerInfo.new()
	owner_info.owner_node = self
	owner_info.animation_tree = animation_tree
	owner_info.animation_root_node = animation_tree["parameters/playback"]
	state_machine.init(owner_info)
	
func _physics_process(_delta: float) -> void:
	last_facing_direction = move_direction
	move_and_slide()

func target_player():
	var player = get_tree().get_first_node_in_group("Player")
	if player:
		var target_direction = (player.global_position - global_position).normalized()
		ray_cast.target_position = to_local(player.position)
