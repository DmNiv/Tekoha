class_name State extends Node

@onready var owner_node: Node2D
@onready var state_machine: StateMachine
@onready var animation_tree: AnimationTree
@onready var animation_root_node: AnimationNodeStateMachinePlayback

signal Transitioned(state_name: String)

func enter():
	pass

func exit():
	pass

func update(_delta: float):
	pass

func physics_update(_delta: float):
	pass

func transition_to(state_name: String):
	Transitioned.emit(state_name)
