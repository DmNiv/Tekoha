extends AnimationTree

@onready var player: Player = get_tree().get_first_node_in_group("Player")

func _ready() -> void:
	active = true

func _process(_delta: float) -> void:
	set("parameters/Idle/blend_position", player.last_facing_direction)
	set("parameters/Walk/blend_position", player.move_direction)
	set("parameters/Attack01/blend_position", player.attack_direction)
	set("parameters/AttackEnd/blend_position", player.attack_direction)
	set("parameters/Attack02/blend_position", player.attack_direction)
	set("parameters/Roll/blend_position", player.roll_direction)
	set("parameters/Stun/blend_position", -player.velocity)
	set("parameters/Death/blend_position", player.last_facing_direction)
