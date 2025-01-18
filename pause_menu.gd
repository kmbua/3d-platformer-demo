extends ColorRect

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var resume_button: Button = $CenterContainer/PanelContainer/MarginContainer/VBoxContainer/ResumeButton
@onready var restart_button: Button = $CenterContainer/PanelContainer/MarginContainer/VBoxContainer/RestartButton
@onready var quit_button: Button = $CenterContainer/PanelContainer/MarginContainer/VBoxContainer/QuitButton

func _ready() -> void:
	resume_button.pressed.connect(resume)
	restart_button.pressed.connect(restart)
	quit_button.pressed.connect(get_tree().quit)
	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		pause()

func resume():
	animation_player.play("Unpause")
	get_tree().paused = false
	
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func pause():
	animation_player.play("Pause")
	get_tree().paused = true
	
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
func restart():
	resume()
	get_tree().reload_current_scene()
