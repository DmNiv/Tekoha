extends AnimationTree

@onready var enemy_ranged: Enemy = $".."

func _process(delta: float) -> void:
	set("parameters/Idle/blend_position", enemy_ranged.last_facing_direction)
	set("parameters/Walk/blend_position", enemy_ranged.move_direction)
	set("parameters/RangeAttack01/blend_position", enemy_ranged.move_direction)
