class_name HealthComponent extends Node2D

@export var MAX_HEALTH: int = 100
@export var state_machine: StateMachine

var health : int

func _ready() -> void:
	health = MAX_HEALTH

func damage(attack: Attack) -> void:
	health -= attack.attack_damage

	if health <= 0:
		if get_parent() is Player:
			state_machine.current_state.transition_to("Death")
		else:
			get_parent().queue_free()
