class_name ChunkData extends Resource

# (X, Y, L) where L is layer:
# +2 wall
# +1 ore
# +0 floor
# -1 subfloor
@export var blocks: Dictionary[Vector3, StringName]

func _init(cx: int, cy: int) -> void:
	var worldController: WorldController = Global.worldController
	for lx in range(worldController.chunkSize.x):
		for ly in range(worldController.chunkSize.y):
			var coord := Vector2i(
				(cx * worldController.chunkSize.x) + lx,
				(cy * worldController.chunkSize.y) + ly,
			)
			var x: int = coord.x
			var y: int = coord.y
			
			# Get noises for shorter lines
			var terrainNoise: FastNoiseLite = worldController.noiseBox.terrainNoise
			var biomeNoise: FastNoiseLite = worldController.noiseBox.biomeNoise
			
			# Biome Type
			var biomeValue: float = remap(
				biomeNoise.get_noise_2dv(coord), -1, 1, 0, 1
			)
			var biome: Biome = matchBiome(worldController.currentWorld, biomeValue)
			
			# Is it a wall
			var wallValue: float = remap(
				terrainNoise.get_noise_2dv(coord), -1, 1, 0, 1
			)
			if wallValue > 0.5:
				if biome == null:
					blocks[Vector3(x, y, 2)] = &"_errorBiome"
				
				var wallPicked: StringName = biome.walls.pick_random()
				
				#TODO some logic about walls that arent 1x1, add WallRefs into
				#blocks dict and then skip if a wallref is arleady here?
				
				blocks[Vector3(x, y, 2)] = wallPicked

#                                             <  0 to 1  >
func matchBiome(world: WorldController.World, value: float) -> Biome:
	var biomes: Dictionary[StringName, Biome] = Global.worldController.biomes
	
	match world:
		# Testing world
		# =============
		WorldController.World.FACE_LAND:
			if value > 0.0:
				return biomes[&"happyBiome"]
			return biomes[&"sadBiome"]
	
	return null
