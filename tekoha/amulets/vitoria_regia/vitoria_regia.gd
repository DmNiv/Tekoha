extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var water_collision: CollisionShape2D = $WaterArea/WaterCollision
@onready var player : Player = get_tree().get_first_node_in_group("Player")

func _ready() -> void:
	animated_sprite_2d.animation = "start"

func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("use_ability"):
		animated_sprite_2d.visible = true
		water_collision.disabled = false
		animation_player.play("start")
	if Input.is_action_just_released("use_ability"):
		animation_player.play("finish")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "start":
		animation_player.play("loop")
	if anim_name == "finish":
		animated_sprite_2d.visible = false
		water_collision.disabled = true
	

func _on_water_area_area_entered(area: Area2D) -> void:
	area.get_parent().velocity -= 200
