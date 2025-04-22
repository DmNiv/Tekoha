extends AnimationTree

# temos que ver como criar uma classe Enemy e fazer eles herdarem dela
@onready var enemy_melee: CharacterBody2D = $".."

func _ready() -> void:
	active = true

func _process(_delta: float) -> void:
	set("parameters/Idle/blend_position", enemy_melee.last_facing_direction)
	set("parameters/Walk/blend_position", enemy_melee.move_direction)
	set("parameters/MeleeAttack01/blend_position", enemy_melee.last_facing_direction)
	set("parameters/AttackEnd/blend_position", enemy_melee.last_facing_direction)
	set("parameters/Stun/blend_position", -enemy_melee.velocity)
