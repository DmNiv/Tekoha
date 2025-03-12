class_name StateIdleEnemy extends State

@export var enemy: Enemy
@export var range: int
@onready var player: Player = get_tree().get_first_node_in_group("Player")

var idle_time: float
var distance_to_player: Vector2

func randomize_time():
	idle_time = randf_range(1, 2)

func Enter():
	print("idle")
	if enemy:
		enemy.velocity = Vector2.ZERO
		randomize_time()

func Exit():
	pass

func Update(delta: float):
	if idle_time > 0:
		idle_time -= delta
	else:
		Transitioned.emit(self, "Wander")

func Physics_Update(_delta: float):
	if player:
		distance_to_player = player.global_position - enemy.global_position
		if distance_to_player.length() < range:
			Transitioned.emit(self, "Follow")
