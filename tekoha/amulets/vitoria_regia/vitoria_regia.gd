extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("use_ability"):
		animated_sprite_2d.visible = true
		animation_player.play("start")
	if Input.is_action_just_released("use_ability"):
		animation_player.play("finish")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "start":
		animation_player.play("loop")
