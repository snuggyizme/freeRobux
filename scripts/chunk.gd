class_name Chunk extends TileMapLayer

var chunkCoord: Vector2i
var data: Dictionary[Vector2i, RuntimeWall]

func _ready() -> void:
	global_position = chunkCoord * Global.worldController.chunkSize * 16

	#var calamity: Mod = tModLoader.mods.get("calamity")
	#calamity.cast_thoughts_of_pedophilia_into_the_minds_of_the_developers()

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
			
			var wallString: StringName = worldController.chunkDatas[
				chunkCoord
			].blocks.get(
				globalCoord,
				&"_errorNoBlock",
			)
			
			if wallString == &"_ref_skip":
				# The root already placed you: Continue
				continue
			
			var wall: Wall = Blocks.types.get(
				wallString,
				Blocks.types[&"_errorNoBlock"]
			)
			
			# Set visuals
			set_cell(
				coord,
				0,
				wall.getAtlasCoord(),
			)
			
			# Save to chunkdata:
			var root := WallRoot.new(wallString)
			data[coord] = root
			
			# Set refs:
			if wall.shape != Wall.Shape.ONE_BY_ONE:
				for i: Vector2i in wall.shapeRaw:
					# We already placed the root: Continue
					if i == Vector2i.ZERO:
						continue
					
					# Set visuals
					set_cell(
						coord + i,
						0,
						wall.getAtlasCoord() + i
					)
					
					var ref := WallRef.new(coord, i)
					data[coord + i] = ref
					root.refs.append(ref)
			
