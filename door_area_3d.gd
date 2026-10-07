extends Area3D

@onready var mesh_instance_3d: MeshInstance3D = $"../door/MeshInstance3D"
@onready var collision_shape_3d: CollisionShape3D = $"../door/CollisionShape3D"
@onready var animation_player: AnimationPlayer = $"../AnimationPlayer"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		animation_player.play("dooropen")
		get_tree().create_timer(0.5).timeout.connect(_opening)
func _opening():
	animation_player.play("doorstay")
