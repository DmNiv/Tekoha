class_name EnemyMelee extends Enemy

@onready var weapon: EnemyWeapon = $Weapon

func _ready() -> void:
	speed = 50
	
	radius_to_follow = 250
	radius_to_aim = 30
	radius_to_move_away = 15
	
	attack_damage = 10
	attack_knockback = 20
	attack_stun_time = 0.5
	
	animation_tree = $AnimationTree
	state_machine = $StateMachine
	ray_cast = $RayCast
	
	attack = Attack.new()
	attack.attack_damage = attack_damage
	attack.knockback_force = attack_knockback
	attack.stun_time = attack_stun_time
	
	owner_info = OwnerInfo.new()
	owner_info.owner_node = self
	owner_info.animation_tree = animation_tree
	owner_info.animation_root_node = animation_tree["parameters/playback"]
	state_machine.init(owner_info)
	
func _physics_process(_delta: float) -> void:
	last_facing_direction = move_direction
	move_and_slide()
