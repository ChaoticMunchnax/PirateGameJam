class_name Shooter
extends Node2D

@export var fireable : Fireable
@export var projectiles_parent_group = "projectiles_parent"

var projectiles_parent : Node
func _ready() -> void:
	projectiles_parent = get_tree().get_first_node_in_group(projectiles_parent_group)
	assert(projectiles_parent != null, "Make sure the bullet exists...")
func try_shoot():
	_shoot()
	return true
func _shoot():
	var projectile = fireable.scene.instantiate() as Projectile
	projectiles_parent.add_child(projectile)
	projectile.name = fireable.display_name
	projectile.global_transform = global_transform
	
