class_name WallRef extends RuntimeWall

var root: Vector2i ## Root's global position
var localPos: Vector2i ## Own local position from root position.

func _init(rp: Vector2i, lp: Vector2i) -> void:
	root = rp
	localPos = lp
