extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -600.0
const MAX_JUMPS = 2

var jumps_left = MAX_JUMPS


func _physics_process(delta: float) -> void:
	# Add gravity
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		# Reset jumps when touching the ground.
		jumps_left = MAX_JUMPS

	# track jumps
	if Input.is_action_just_pressed("jump") and jumps_left > 0:
		velocity.y = JUMP_VELOCITY
		jumps_left -= 1

	# handling horizontal mvment
	var direction := Input.get_axis("left", "right")

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
