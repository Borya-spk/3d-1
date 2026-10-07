extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("monet")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#func _on_area_3d_area_entered(area: Area3D) -> void:
#	pass

func _on_area_entered(area: Area3D) -> void:
	if area.is_in_group("player"):
		queue_free()
