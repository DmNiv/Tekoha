class_name PlayerStateWalk extends State

@onready var player: Player = $"../.."

func Enter():
	pass

func Exit():
	pass

func Update(_delta: float):
	if player:
		if !player.velocity:
			Transitioned.emit(self, "Idle")
		elif Input.is_action_just_pressed("roll") and player.can_roll:
			Transitioned.emit(self, "Roll")
		elif Input.is_action_just_pressed("attack"):
			Transitioned.emit(self, "Attack01")

func Physics_Update(_delta: float):
	if player:
		player.set_direction()
		player.velocity = player.move_direction * player.SPEED
