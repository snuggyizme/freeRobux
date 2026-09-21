class_name WallType extends Wall

@export_category("Display")
@export var displayName: String
@export var description: String
@export var size: Vector2i
@export var atlasCoord: Vector2i

func getAtlasCoord() -> Vector2i:
	return atlasCoord
