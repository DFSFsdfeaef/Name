extends CharacterBody2D

var dash = 0
var SPEED = 400.0
const JUMP_VELOCITY = -700.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta * 1.5
	else:
		dash = 1
	# Handle jump.
	
	if Input.is_action_just_pressed("Up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	
	if direction:
		if(abs(velocity.x)>400):
			velocity.x = move_toward(velocity.x, direction * SPEED, 100)
		else:
			velocity.x = move_toward(velocity.x, direction * SPEED, 10)
	else:
		if(abs(velocity.x)>400):
			velocity.x = move_toward(velocity.x, 0, 100)
		else:
			velocity.x = move_toward(velocity.x, 0, 10)
	if Input.is_action_just_pressed("dash") && (dash == 1) && not is_on_floor() && velocity.y > -550:
		SPEED = 1500
		if direction:
			velocity.x = 1500*direction
		elif (velocity.x != 0):
			velocity.x = 1500*velocity.x/abs(velocity.x)
		velocity.y = 0
		dash = 0

	if (SPEED > 400):
		SPEED -= sqrt(2*SPEED-800)
	
	move_and_slide()



func _on_area_2d_2_body_entered(body):
	position.x = -1000
	position.y = -1000
