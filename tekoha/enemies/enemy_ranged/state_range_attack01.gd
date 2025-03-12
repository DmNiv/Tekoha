class_name StateRangeAttack01Enemy extends State

@onready var enemy: Enemy = $"../.."
@onready var player: Player = get_tree().get_first_node_in_group("Player")
@onready var animation_tree: AnimationTree = $"../../AnimationTree"
@onready var animation_root_node = animation_tree["parameters/playback"]

@export var projectile: PackedScene


var distance_to_player: Vector2

const PROJECTILE_COOLDOWN: float = 4.0
var projectile_timer: float = 0.0

func Enter():
	print("RangeAttack")
	if enemy:
		animation_root_node.travel("RangeAttack01")
		enemy.velocity = Vector2.ZERO

func Exit():
	pass

func Update(_delta: float):
	pass

func Physics_Update(delta: float):
	distance_to_player = player.global_position - enemy.global_position
	enemy.move_direction = distance_to_player
	
	if projectile_timer > 0:
		projectile_timer -= delta
	else:
		shoot()

func shoot():
	var projectile_instance: Area2D = projectile.instantiate()
	get_tree().current_scene.add_child(projectile_instance)
	projectile_instance.global_position = enemy.global_position
	projectile_instance.direction = (player.global_position - enemy.global_position).normalized()
	projectile_timer = PROJECTILE_COOLDOWN
	
