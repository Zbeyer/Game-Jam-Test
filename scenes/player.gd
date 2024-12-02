extends RigidBody3D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#var input = Input.get_action_strength("ui_up")
	#apply_central_force(input * Vector3.FORWARD * 1200.0 * delta)
	var input = Vector3.ZERO
	var speed = 1200.0
	input.x = Input.get_axis("move_left", "move_right")
	input.z = Input.get_axis("move_forward", "move_back")
	apply_central_force(input * speed * delta)
