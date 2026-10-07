extends Camera3D

const mouse_s:float=0.005
func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotation.y-=event.relative.x*mouse_s
