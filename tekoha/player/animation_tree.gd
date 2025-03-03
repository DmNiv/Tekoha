extends AnimationTree

@onready var player: Player = $".."

func _process(_delta: float) -> void:
	set("parameters/Idle/blend_position", player.last_facing_direction)
	set("parameters/Walk/blend_position", player.move_direction)
	#set("parameters/Attack01/blend_position", player.attack_direction)
	#set("parameters/Attack02/blend_position", player.attack_direction)
