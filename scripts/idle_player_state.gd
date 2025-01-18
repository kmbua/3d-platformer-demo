class_name IdlePlayerState

extends State

func update() -> void:
	if Events.player.velocity.length() > 0.0 and Events.player.is_on_floor():
		transition.emit("WalkingPlayerState")
