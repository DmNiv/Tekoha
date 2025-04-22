extends AnimationTree

@onready var enemy_ranged: Enemy = $".."

func _ready() -> void:
	active = true

func _process(_delta: float) -> void:
	set("parameters/Idle/blend_position", enemy_ranged.last_facing_direction)
	set("parameters/Walk/blend_position", enemy_ranged.move_direction)
	set("parameters/RangeAttack01/blend_position", enemy_ranged.last_facing_direction)
	set("parameters/AttackEnd/blend_position", enemy_ranged.last_facing_direction)
	set("parameters/Stun/blend_position", -enemy_ranged.velocity)
