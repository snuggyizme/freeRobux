class_name ChunkData extends Resource

# (X, Y, L) where L is layer:
# +2 wall
# +1 ore
# +0 floor
# -1 subfloor
@export var blocks: Dictionary[Vector3i, StringName]

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
			
			var wallValue: float = remap(
				terrainNoise.get_noise_2dv(coord), -1, 1, 0, 1
			)
			
			var wallCoord := Vector3i(x, y, 2)
			
			if blocks.get(wallCoord) == &"_ref_skip":
				continue
			
			if wallValue > 0.5:
				if biome == null:
					blocks[wallCoord] = &"_errorBiome"
					continue
				
				var wallPicked: StringName = biome.walls.pick_random()
				var wallResource: Wall = Blocks.types.get(wallPicked)
				
				var fine: bool = true
				for i: Vector2i in wallResource.shapeRaw:
					if blocks.has(Vector3i(x + i.x, y + i.y, 2)):
						fine = false
						break
				
				if not fine:
					if biome.fallback1x1WallIndices.size() < 1:
						blocks[wallCoord] = &"_errorNoFallback1x1"
						continue
					
					blocks[wallCoord] = biome.walls[
						biome.fallback1x1WallIndices.pick_random()
					]
					continue
				
				for i: Vector2i in wallResource.shapeRaw:
					blocks[Vector3i(x + i.x, y + i.y, 2)] = &"_ref_skip"
				
				blocks[wallCoord] = wallPicked
			else:
				blocks[wallCoord] = &"_"

#                                             <  0 to 1  >
func matchBiome(world: WorldController.World, value: float) -> Biome:
	var biomes: Dictionary[StringName, Biome] = Global.worldController.biomes
	
	match world:
		# Testing world
		# =============
		WorldController.World.FACE_LAND:
			if value > 0.5:
				return biomes[&"happyBiome"]
			return biomes[&"sadBiome"]
	
	return null
