extends KinematicBody


var velocity = Vector3(0,0,0)
const speed = 10
const rotateSpeed = 8
const gravity = 9.8
const jump = 14

func _ready():
	pass

func _physics_process(delta):
	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_left"):
		velocity.x = 0
	elif  Input.is_action_pressed("ui_right"):
		velocity.x = speed
		$MeshInstance.rotate_z(deg2rad(-rotateSpeed))
	elif  Input.is_action_pressed("ui_left"):
		velocity.x = -speed
		$MeshInstance.rotate_z(deg2rad(rotateSpeed))
	else:
		velocity.x = lerp(velocity.x,0,0.1)
		
	if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_down"):
		velocity.z = 0
	elif  Input.is_action_pressed("ui_up"):
		velocity.z = -speed
		$MeshInstance.rotate_x(deg2rad(rotateSpeed))
	elif  Input.is_action_pressed("ui_down"):
		velocity.z = speed
		$MeshInstance.rotate_x(deg2rad(-rotateSpeed))
	else:
		velocity.z = lerp(velocity.z,0,0.1)
	move_and_slide(velocity)
	
	if is_on_wall() and Input.is_action_just_pressed("jump"):#for Jumping "space".
		velocity.y = jump*gravity
	elif is_on_wall()==false or Input.is_action_just_released("jump"):
		velocity.y = -(gravity*jump*delta*2)




