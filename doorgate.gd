extends StaticBody3D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
var timervar = Timer.new()

func _ready() -> void:
	add_child(timervar)
	timervar.wait_time = 0.95
	timervar.one_shot = true
	timervar.timeout.connect(_on_timer_timeout)

func _on_area_3d_area_entered(area: Area3D) -> void:
	if area.is_in_group("player"):
#		timervar.start()
		animation_player.play("gateopen")
#		animation_player.speed_scale=1

func _on_area_3d_area_exited(area: Area3D) -> void:
	if area.is_in_group("player"):
		animation_player.play_backwards("gateopen")
#		print(timervar.time_left)
""" 	if timervar.time_left==0:
			timervar.stop()
			$AnimationPlayer.seek(0.9)
			animation_player.play("gateopen")
			animation_player.speed_scale=-1 
		else:
			timervar.stop()
			animation_player.play("gateopen")
			animation_player.speed_scale=-1"""
func _on_timer_timeout() -> void:
	print("ывапы")
