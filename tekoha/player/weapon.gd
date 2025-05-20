class_name PlayerWeapon extends Node2D

var attack_damage: int
var attack_knockback: int
var stun_time: float 

@onready var weapon_collision: CollisionShape2D = $WeaponHitbox/WeaponCollision


func _on_weapon_hitbox_area_entered(area: Area2D) -> void:
	if area.has_method("damage"):
		var attack = Attack.new()
		attack.attack_damage = attack_damage
		attack.knockback_force = attack_knockback
		attack.attack_position = global_position
		attack.stun_time = stun_time
		area.damage(attack)
	
func turn_down():
	set_rotation_degrees(0)
	
func turn_left():
	set_rotation_degrees(90)
	
func turn_up():
	set_rotation_degrees(180)
	
func turn_right():
	set_rotation_degrees(270)
