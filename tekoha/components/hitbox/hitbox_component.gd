class_name HitboxComponent extends Area2D

@export var health_component: HealthComponent
@export var state_machine: StateMachine
@export var stun_state: State

func damage(attack: Attack):
	if health_component:
		health_component.damage(attack)
		if stun_state and state_machine.current_state.name != "Stun" and state_machine.current_state.name != "Death":
			stun_state.receive_attack_info(attack)
			state_machine.current_state.transition_to("Stun")
