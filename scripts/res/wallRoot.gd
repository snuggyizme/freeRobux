class_name WallRoot extends RuntimeWall

var refs: Array[WallRef]
var wall: StringName

func _init(w: StringName) -> void:
	wall = w
