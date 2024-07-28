class_name Projectile
extends Area2D
## Projectile goes brrr
@export_range(0,300,.2,"or_greater") var move_speed = 150.0

func _physics_process(delta):
	position += transform.x * move_speed * delta 
	
