extends RigidBody

var velocity = Vector3(0,0,0)
const speed = 7
const rotspeed = 8

func _ready():
 pass
 
func _physics_process(delta):
 if Input.is_action_pressed("ui_ball_right") and Input.is_action_pressed("ui_ball_left"):
  velocity.x = 0
 elif  Input.is_action_pressed("ui_ball_right"):
  velocity.x = speed
  $MeshInstance.rotate_z(deg2rad(-rotspeed))
 elif  Input.is_action_pressed("ui_ball_left"):
  velocity.x = -speed
  $MeshInstance.rotate_z(deg2rad(rotspeed))
 else:
  velocity.x = lerp(velocity.x,0,0.1)
  
 if Input.is_action_pressed("ui_ball_up") and Input.is_action_pressed("ui_ball_down"):
  velocity.z = 0
 elif  Input.is_action_pressed("ui_ball_up"):
  velocity.z = -speed
  $MeshInstance.rotate_x(deg2rad(rotspeed))
 elif  Input.is_action_pressed("ui_ball_down"):
  velocity.z = speed
  $MeshInstance.rotate_x(deg2rad(-rotspeed))
 else:
  velocity.z = lerp(velocity.z,0,0.1)
	#move_and_slide(velocity) 

