class_name Chunk extends TileMapLayer

var chunkCoord: Vector2i

func update() -> void:
	var worldController: WorldController = Global.worldController
	
	for x: int in range(worldController.chunkSize.x):
		for y: int in range(worldController.chunkSize.y):
			var coord := Vector2i(x, y)
			var globalCoord := Vector3i(
				(chunkCoord.x * worldController.chunkSize.x) + x,
				(chunkCoord.y * worldController.chunkSize.y) + y,
				2,
			)
			
			var wall: Wall = Blocks.types.get(
				worldController.chunkDatas[chunkCoord].blocks.get(
					globalCoord,
					&"_errorNoBlock",
				),
				Blocks.types[&"_errorNoBlock"]
			)
			
			set_cell(
				coord,
				0,
				wall.getAtlasCoord(),
			)
			
