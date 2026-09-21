class_name Chunk extends TileMapLayer

var chunkCoord: Vector2i

func update() -> void:
	var worldController: WorldController = Global.worldController
	
	for x: int in range(worldController.chunkSize.x):
		for y: int in range(worldController.chunkSize.y):
			var coord := Vector2i(x, y)
			
			var wall: Wall = Blocks.types.get(
				worldController.chunkDatas[chunkCoord].blocks[Vector3(x, y, 2)],
				Blocks.types[&"_errorNoBlock"]
			)
			
			set_cell(
				coord,
				0,
				
			)
