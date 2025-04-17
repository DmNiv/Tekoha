class_name State extends Node

var owner_node: Node2D
var animation_tree: AnimationTree
var animation_root_node = animation_tree["parameters/playback"]
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
