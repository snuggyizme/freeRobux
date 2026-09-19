extends CharacterBody2D

@export var noclipSpeed: float

func _physics_process(delta: float) -> void:
	debugProcess(delta)

func debugProcess(delta: float) -> void:
	position += noclipSpeed * delta * Input.get_vector(
		"a", "d", "w", "s"
	)
