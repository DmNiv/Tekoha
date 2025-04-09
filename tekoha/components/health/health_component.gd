class_name HealthComponent extends Node2D

@onready var parent : Node2D = $".."

@export var MAX_HEALTH: int = 100.0
var health : int
 

func _ready() -> void:
	health = MAX_HEALTH

func damage(attack: Attack) -> void:
	if parent:
		if parent is CharacterBody2D:
			var parent_state: State = parent.get_node("StateMachine").current_state
			parent_state.Transitioned.emit(parent_state, "StateStun")
			parent.velocity = (parent.global_position - attack.attack_position).normalized()*attack.knockback_force
	
	health -= attack.attack_damage
	if health <= 0:
		get_parent().queue_free()
