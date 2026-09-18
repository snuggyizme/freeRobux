extends CharacterBody2D

const SPEED = 300.0

func _physics_process(delta: float) -> void:
	debugProcess(delta)

func debugProcess(delta: float) -> void:
	position += SPEED * delta * Input.get_vector(
		"a", "d", "w", "s"
	)
