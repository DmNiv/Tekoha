class_name StateWalk extends State

@onready var player: Player = $"../.."

func Enter():
	pass

func Exit():
	pass

func Update(_delta: float):
	if player:
		if !player.velocity:
			Transitioned.emit(self, "Idle")
		elif Input.is_action_just_pressed("roll_dash") and player.can_dash:
			Transitioned.emit(self, "Roll")
		elif Input.is_action_just_pressed("attack") and player.can_attack:
			Transitioned.emit(self, "Attack01")

func Physics_Update(_delta: float):
	if player:
		player.set_direction()
		player.velocity = player.move_direction * player.SPEED
