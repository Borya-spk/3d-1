extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
@onready var animplay: AnimationPlayer = $"character-male-d/AnimationPlayer"
@onready var player_c: Node3D = $"character-male-d"
enum animstate{idle,walk,jump}
var c_animstate:animstate=animstate.idle
@onready var camera_p: Node3D = $cameraP
@onready var respawn: Node3D = $"../../respawn"
@onready var respawn_2: Node3D = $"../../respawn2"
@onready var respawn_3: Node3D = $"../../respawn3"
signal player_collect_monet
signal player_damaged
@onready var mainc: CharacterBody3D = $"."

func _ready() -> void:
	mainc.position=respawn.position
	Dialogic.signal_event.connect(on_dialogic_signal)
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		c_animstate=animstate.jump

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction:=(camera_p.basis*Vector3(-input_dir.x,0.0,-input_dir.y)).normalized()
	if direction:
		player_c.basis=camera_p.basis
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		c_animstate=animstate.walk
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		c_animstate=animstate.idle

	move_and_slide()
func _process(delta: float) -> void:
	if not is_on_floor():
		animplay.play("jump")
	else:
		match(c_animstate):
			animstate.idle:
				animplay.play("idle")
			animstate.walk:
				animplay.play("walk")

func on_dialogic_signal(argue):
	if argue=='teleport':
		print('зызызызуз')
		mainc.position=respawn_2.position


func _on_area_3d_area_entered(area: Area3D) -> void:
	if area.is_in_group("monet"):
		emit_signal("player_collect_monet")
		print("easdada")
		
	if area.is_in_group("enemy"):
		emit_signal("player_damaged")
		
