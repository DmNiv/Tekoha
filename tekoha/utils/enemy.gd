class_name Enemy extends CharacterBody2D

var speed: float
var move_direction: Vector2
var last_facing_direction: Vector2

var radius_to_follow: int
var radius_to_aim: int
var radius_to_move_away: int

var attack: Attack

var attack_damage: int
var attack_knockback: int
var attack_stun_time: float

var animation_tree: AnimationTree
var state_machine: StateMachine
var ray_cast: RayCast2D

var owner_info : OwnerInfo

func target_player():
	var player = get_tree().get_first_node_in_group("Player")
	if player:
		ray_cast.target_position = to_local(player.position)
