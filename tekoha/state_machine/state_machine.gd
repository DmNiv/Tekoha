class_name StateMachine extends Node

@export var initial_state: State

var states: Dictionary = {}
var current_state: State
var previous_state: State

# Preencher o dicionário com todos os estados
func init(owner_info: OwnerInfo) -> void:
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.owner_node = owner_info.owner_node
			child.animation_tree = owner_info.animation_tree
			child.animation_root_node = owner_info.animation_root_node
			child.Transitioned.connect(change_state)
	
	# Se existir um estado inicial, entrar e assumir como estado atual
	if initial_state:
		change_state(initial_state.name)

func _process(delta: float) -> void:
	# Atualizando ações de acordo com o estado
	if current_state:
		current_state.update(delta)

func _physics_process(delta: float) -> void:
	# Atualizando ações de acordo com o estado
	if current_state:
		current_state.physics_update(delta)

func change_state(new_state_name: String):
	var new_state = states.get(new_state_name.to_lower())
	if !new_state:
		return
	
	if current_state:
		previous_state = current_state
		current_state.exit()
	
	current_state = new_state
	current_state.enter()
