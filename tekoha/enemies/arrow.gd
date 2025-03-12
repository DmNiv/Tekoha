extends Area2D

const SPEED : float = 200.0

@onready var animation_tree: AnimationTree = $AnimationTree

@onready var player: CharacterBody2D = get_tree().get_first_node_in_group("player")

var direction: Vector2 = Vector2.ZERO

func _process(delta: float) -> void:
	animation_tree.set("parameters/blend_position", direction)
	position += direction * SPEED * delta


#func _on_body_entered(body: Node2D) -> void:
	#if body.is_in_group("player"):
		#player.take_damage(10)
		#queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
