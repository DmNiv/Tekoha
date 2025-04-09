class_name PlayerStateIdle extends State

@onready var player: Player = $"../.."

func Enter():
	if player:
		player.velocity = Vector2.ZERO

func Exit():
	pass

func Update(_delta: float):
	if player:
		if player.move_direction:
			Transitioned.emit(self, "Walk")
		elif Input.is_action_just_pressed("roll") and player.can_roll:
			Transitioned.emit(self, "Roll")
		elif Input.is_action_just_pressed("attack"):
			Transitioned.emit(self, "Attack01")

func Physics_Update(_delta: float):
	if player:
		player.set_direction()
