class_name Enemy extends CharacterBody2D

@onready var animation_tree: AnimationTree = $AnimationTree

const SPEED : float = 50.0 
var move_direction : Vector2
var last_facing_direction = Vector2(0, 1)
var idle

var attack: Attack
var projectile_damage: int = 10
var projectile_knockback: int = 50
const PROJECTILE_STUN_TIME: float = 1.5

func _ready() -> void:
	attack = Attack.new()
	attack.attack_damage = projectile_damage
	attack.knockback_force = projectile_knockback
	attack.stun_time = PROJECTILE_STUN_TIME
	animation_tree.active = true
	
func _physics_process(_delta: float) -> void:
	last_facing_direction = move_direction
	move_and_slide()
