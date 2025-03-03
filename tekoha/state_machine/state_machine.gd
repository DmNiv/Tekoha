class_name StateMachine extends Node

@export var initial_state : State

var states : Dictionary = {}
var current_state : State

# Preencher o dicionário com todos os estados
func _ready() -> void:
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.Transitioned.connect(change_state)
		
		# Se existir um estado inicial, entrar e assumir como estado atual
		if initial_state:
			initial_state.Enter()
			current_state = initial_state

func _process(delta: float) -> void:
	# Atualizando ações de acordo com o estado
	if current_state:
		current_state.Update(delta)

func _physics_process(delta: float) -> void:
	# Atualizando ações de acordo com o estado
	if current_state:
		current_state.Physics_Update(delta)

func change_state(state : State, new_state_name : String):
	if state != current_state:
		return
	
	var new_state = states.get(new_state_name.to_lower())
	if !new_state:
		return
	
	if current_state:
		current_state.Exit()
	
	new_state.Enter()
	current_state = new_state
