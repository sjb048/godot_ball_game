
extends RigidBody

var velocity = Vector3(0,0,0)
const speed = 7
#const rotspeed = 8
const Jumpgravity = 9.8
const jumppower = 12

func _ready():
	$CameraRig.set_as_toplevel(true)

func _physics_process(delta):
	var old_camera_pos = $CameraRig.global_transform.origin 
	var ball_pos = global_transform.origin
	var new_camera_pos = lerp(old_camera_pos, ball_pos, 0.01)
	$CameraRig.global_transform.origin  = new_camera_pos
	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_left"):
		velocity.x = 0
	elif  Input.is_action_pressed("ui_right"):
		velocity.x = speed
	elif  Input.is_action_pressed("ui_left"):
		velocity.x = -speed
	else:
		velocity.x = lerp(velocity.x,0,0.1)
		
	if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_down"):
		velocity.z = 0
	elif  Input.is_action_pressed("ui_up"):
		velocity.z = -speed
	elif  Input.is_action_pressed("ui_down"):
		velocity.z = speed
	else:
		velocity.z = lerp(velocity.z,0,0.1)
	
	var is_on_floor = 

