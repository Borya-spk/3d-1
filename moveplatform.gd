extends StaticBody3D
@export var amplitude=3
@export var speed=2
@onready var start_position=position
enum direction{up,left_right,forward_backward}
@export var sel_direction=direction.up
@onready var vector_direction=Vector3(1,0,0)


func _ready() -> void:
	match sel_direction:
		direction.up:
			vector_direction=Vector3(0,1,0)
		direction.left_right:
			vector_direction=Vector3(0,0,1)
		direction.forward_backward:
			vector_direction=Vector3(1,0,0)
			


func _process(delta: float) -> void:
	position+=vector_direction*speed*delta
	if position>=(vector_direction*amplitude)+start_position or position<=start_position-(vector_direction*amplitude):
		speed*=-1
		
