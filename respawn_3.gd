extends Node3D

@onready var character_body_3d: CharacterBody3D = $"../characters/CharacterBody3D"
@onready var respawn: Node3D = $"../respawn"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_3d_area_entered(area: Area3D) -> void:
	if area.is_in_group("player"):
		character_body_3d.position=respawn.position
		Dialogic.VAR.ifopen=true
