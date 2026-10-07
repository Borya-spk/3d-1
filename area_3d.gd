extends Area3D

@onready var animation_player: AnimationPlayer = $"../AnimationPlayer"
@onready var c_body: CharacterBody3D = $"../character-female-b/CharacterBody3D"
const JUMP_VELOCITY = 4.5
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _idleanim():
	animation_player.play("idle")



func _on_area_entered(area: Area3D) -> void:
	print("hello")
	animation_player.play("jump")
	get_tree().create_timer(0.5).timeout.connect(_idleanim)


func _on_body_entered(body: Node3D) -> void:
	print("hello")
	animation_player.play("jump")
	get_tree().create_timer(0.5).timeout.connect(_idleanim)
