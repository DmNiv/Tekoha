extends Area2D

var attack_damage: int
var attack_knockback: int
const STUN_TIME: float = 1.5
const SPEED : float = 200.0

@onready var animation_tree: AnimationTree = $AnimationTree

@onready var player: CharacterBody2D = get_tree().get_first_node_in_group("player")

var direction: Vector2 = Vector2.ZERO

func _process(delta: float) -> void:
	animation_tree.set("parameters/blend_position", direction)
	position += direction * SPEED * delta



func _on_area_entered(area: Area2D) -> void:
	if area.has_method("damage"):
		var attack = Attack.new()
		attack.attack_damage = attack_damage
		attack.knockback_force = attack_knockback
		attack.attack_position = global_position
		attack.stun_time = STUN_TIME
		area.damage(attack)


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
