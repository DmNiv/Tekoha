extends Node2D

func _on_player_player_dead() -> void:
	get_tree().call_deferred("reload_current_scene")
