extends CharacterBody3D

@onready var nav: NavigationAgent3D = $NavigationAgent3D
@onready var player: CharacterBody3D
const SPEED =2.0
signal player_damaged
var ismoving:bool=true
func _ready() -> void:
	player=get_tree().get_first_node_in_group("mainplayer")
	
func _physics_process(delta: float) -> void:
	if ismoving:
		look_at(Vector3(player.global_position.x, global_position.y, player.global_position.z))
		nav.target_position = player.global_position
		var next = nav.get_next_path_position()
		var direction = (next - global_position).normalized()
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		
	move_and_slide()
	
func _on_area_3d_area_entered(area: Area3D) -> void:
	if area.is_in_group("player"):
		emit_signal("player_damaged")
		print("arearare")
		
		
