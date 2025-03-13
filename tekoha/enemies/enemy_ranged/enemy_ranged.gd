class_name Enemy extends CharacterBody2D

@onready var animation_tree: AnimationTree = $AnimationTree

const SPEED : float = 50.0 
var move_direction : Vector2
var last_facing_direction = Vector2(0, 1)
var idle

func _ready() -> void:
	animation_tree.active = true

func _physics_process(_delta: float) -> void:
	last_facing_direction = move_direction
	move_and_slide()
