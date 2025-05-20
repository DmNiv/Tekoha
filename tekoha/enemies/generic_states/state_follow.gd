extends State

@onready var player: Player = get_tree().get_first_node_in_group("Player")

var distance_to_player: Vector2

@export var nav_timer: Timer

func enter():
	nav_timer.start()
	pass

func exit():
	pass

func update(_delta: float):
	owner_node.target_player()
	pass

func physics_update(_delta: float):
	if player:
		distance_to_player = player.global_position - owner_node.global_position
		owner_node.move_direction = distance_to_player.normalized()
		
		owner_node.move_direction = owner_node.to_local(owner_node.nav_agent.get_next_path_position()).normalized()
		owner_node.velocity = owner_node.move_direction * owner_node.speed
		if distance_to_player.length() < owner_node.radius_to_aim:
			transition_to("Aim")

func makepath():
	owner_node.nav_agent.target_position = player.global_position


func _on_navigation_timer_timeout() -> void:
	makepath()
