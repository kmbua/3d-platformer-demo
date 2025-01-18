class_name WalkingPlayerState

extends State

func update() -> void:
	if Events.player.velocity.length() == 0.0:
		transition.emit("IdlePlayerState")
