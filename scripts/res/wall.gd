class_name Wall extends Block

enum Shape {
	ONE_BY_ONE,
	TWO_BY_TWO,
	THREE_BY_THREE,
}

const SHAPES: Dictionary[Shape, Array] = {
	Shape.ONE_BY_ONE: [
		Vector2i(0, 0),
	],
	
	Shape.TWO_BY_TWO: [
		Vector2i(0, 0), Vector2i(1, 0),
		Vector2i(0, 1), Vector2i(1, 1),
	],
	
	Shape.THREE_BY_THREE: [
		Vector2i(0, 0), Vector2i(1, 0), Vector2i(2, 0),
		Vector2i(0, 1), Vector2i(1, 1), Vector2i(2, 1),
		Vector2i(0, 2), Vector2i(1, 2), Vector2i(2, 2),
	],
}

@export_category("Display")
@export var displayName: String
@export var description: String
@export var shape: Shape:
	set(x):
		shapeRaw = SHAPES[x]
		shape = x
@export var atlasCoord: Vector2i

var shapeRaw: Array

func getAtlasCoord() -> Vector2i:
	return atlasCoord
