class_name EnemyRanged extends Enemy

func _ready() -> void:
	speed = 50
	
	radius_to_follow = 250
	radius_to_aim = 100
	radius_to_move_away = 50
	
	attack_damage = 1
	attack_knockback = 25
	attack_stun_time = 0.5
	
	animation_tree = $AnimationTree
	state_machine = $StateMachine
	ray_cast = $RayCast
	nav_agent = $NavigationAgent2D
	
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
