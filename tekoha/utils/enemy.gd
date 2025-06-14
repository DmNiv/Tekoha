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
var nav_agent: NavigationAgent2D
var vision_cone: Node2D
var ray_casts: Array[RayCast2D]

var owner_info : OwnerInfo

var angle_cone_of_vision = deg_to_rad(30.0)
var max_view_distance = 50.0
var angle_between_rays = deg_to_rad(10.0)

func target_player():
	var player = get_tree().get_first_node_in_group("Player")
	if player:
		for ray in ray_casts:
			ray.target_position = to_local(player.position)
		


func is_seeing_player():
	var player = get_tree().get_first_node_in_group("Player")
	if player:
		for ray in ray_casts:
			if ray.get_collider() is HitboxComponent:
				return true
		return false
