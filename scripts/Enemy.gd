extends CharacterBody2D

const SPEED = 45

var direction = 1;


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var ray_cast_down_right = $RayCastDownRight
@onready var ray_cast_down_left = $RayCastDownLeft
@onready var ray_cast_left = $RayCastLeft
@onready var ray_cast_right = $RayCastRight

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var changePos = false
	
	if (direction == 1):
		changePos = not ray_cast_down_right.is_colliding()
		changePos = changePos || ray_cast_right.is_colliding()
	elif (direction == -1):
		changePos = not ray_cast_down_left.is_colliding()
		changePos = changePos || ray_cast_left.is_colliding()

	if (changePos):
		direction *= -1
		
	position.x += direction * SPEED * delta
	move_and_slide()
