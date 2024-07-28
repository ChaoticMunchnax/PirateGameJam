class_name Player
extends PlatformerCharacter

func _physics_process(delta):
	# direction is defined in player_input to allow code reusability!
	velocity.x = move_speed * direction.x
	_apply_gravity(delta)
	move_and_slide()
