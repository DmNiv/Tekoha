class_name StateAimEnemy extends State

@onready var enemy: Enemy = $"../.."
@onready var player: Player = get_tree().get_first_node_in_group("Player")
@onready var animation_tree: AnimationTree = $"../../AnimationTree"
@onready var animation_root_node = animation_tree["parameters/playback"]

var distance_to_player: Vector2

@export var range_to_attack: int 
@export var range_to_exit: int


const PROJECTILE_COOLDOWN: float = 2.0
var projectile_timer: float = 0.0

func Enter():
	if enemy:
		projectile_timer = PROJECTILE_COOLDOWN
		enemy.velocity = Vector2.ZERO

func Exit():
	pass

func Update(delta: float):
	pass

func Physics_Update(delta: float):
	if player and enemy:
		distance_to_player = player.global_position - enemy.global_position
		enemy.move_direction = distance_to_player
	
		if distance_to_player.length() > range_to_exit:
			Transitioned.emit(self, "Follow")
		elif distance_to_player.length() < range_to_attack:
			enemy.velocity = -enemy.move_direction.normalized() * (enemy.SPEED*0.8)
	
	if projectile_timer > 0:
		projectile_timer -= delta
	else:
		Transitioned.emit(self, "RangeAttack01")
