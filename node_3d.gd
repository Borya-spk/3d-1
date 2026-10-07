extends Node3D
@onready var animation_player: AnimationPlayer = $anim/AnimationPlayer
@onready var kastrulaplayer: AnimationPlayer = $anim/kastrulaplayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_player.play("fridge")
	
	kastrulaplayer.play("kastrula")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
