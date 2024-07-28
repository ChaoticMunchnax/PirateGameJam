class_name PLayerInput
extends Node
@export var character : PlatformerCharacter
@export var actions : PlayerInputActions
@export var shooter : Shooter
func _process(_delta : float) -> void: #using process as its faster input, (most recent input -> update)
	character.direction = Input.get_vector(actions.left,actions.right,actions.up,actions.down)

func _unhandled_input(event: InputEvent) -> void:
	# if input not in use do these
	if event.is_action_pressed(actions.jump):
		character.try_jump()
	if event.is_action_pressed(actions.shoot):
		shooter.try_shoot()
