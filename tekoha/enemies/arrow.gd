class_name Projectile extends Node2D



@export var speed : int

@onready var animation_tree: AnimationTree = $AnimationTree

@onready var player: CharacterBody2D = get_tree().get_first_node_in_group("player")

var attack: Attack

var direction: Vector2 = Vector2.ZERO


func _process(delta: float) -> void:
	animation_tree.set("parameters/blend_position", direction)
	position += direction * speed * delta


func _on_hitbox_component_area_entered(area: Area2D) -> void:
	if area.has_method("damage"):
		area.damage(attack)
		queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
