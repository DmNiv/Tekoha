class_name HealthComponent extends Node2D

@export var MAX_HEALTH: int = 100.0
var health : int
 

func _ready() -> void:
	health = MAX_HEALTH

func damage(attack: Attack) -> void:
	health -= attack.attack_damage

	if health <= 0:
		get_parent().queue_free()
