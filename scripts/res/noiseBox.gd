class_name NoiseBox extends Resource

@export var terrainNoise: FastNoiseLite
@export var biomeNoise: FastNoiseLite

func rand(seed: int) -> void:
	terrainNoise.seed = seed % 510515
	biomeNoise.seed = seed % 239533
