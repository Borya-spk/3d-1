extends CanvasLayer
@onready var panel: Panel = $Panel
@onready var progress: ProgressBar = $Progress
@onready var label: Label = $Label
@onready var kni: CharacterBody3D = $"../Enemies/kni"
@onready var character_body_3d: CharacterBody3D = $"../characters/CharacterBody3D"
var scorem=0
@onready var v_box_container: VBoxContainer = $VBoxContainer
func _ready() -> void:
	character_body_3d.player_collect_monet.connect(collect_m)
	character_body_3d.player_damaged.connect(damagedc)
	get_tree().paused=false
	Input.mouse_mode=Input.MOUSE_MODE_CAPTURED	
	Input.mouse_mode=Input.MOUSE_MODE_HIDDEN
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func damagedc() -> void:
	progress.value-=10
	if progress.value==0:
		get_tree().quit()
	

func collect_m() -> void:
	print("coin12345")
	scorem+=1
	label.text="счет:"+str(scorem)
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pausemenu"):
		if v_box_container.visible==false:
			v_box_container.visible=true
			panel.visible=true
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			get_tree().paused=true
		else:
			v_box_container.visible=false
			panel.visible=false
			get_tree().paused=false
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _on_restart_pressed() -> void:
	get_tree().reload_current_scene()


func _on_exit_pressed() -> void:
	get_tree().quit()
