class_name  PlatformerCharacter
extends CharacterBody2D

signal direction_changed(direction: Vector2)
@export_range(0,100,.2, "or_greater") var move_speed : float = 150
@export_range(0, 100, .2, "or_greater") var jump_force : float = 320
@export var can_ground_jump : bool = false
var direction : Vector2:
	set(value):
		if direction == value:
			return
		direction = value
		direction_changed.emit(direction)
		
## makes the character jump
func try_jump():
	if can_ground_jump && is_on_floor():
		_jump()
		return true
## Internal logic to execute jump		
func _jump():
	velocity.y -=  jump_force

func _apply_gravity(delta):
	var gravity_vector = ProjectSettings.get_setting("physics/2d/default_gravity_vector")
	var default_gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
	var gravity = gravity_vector * default_gravity
	velocity.y += gravity.y * delta
	velocity.x += gravity.x * delta
