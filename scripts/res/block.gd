class_name Block extends Resource

# A block inherits a position of any layer.
# This class has four children/subclasses/whatever that specify it into its layer:
# - res://scripts/res/wall.gd         (Buildings / Factories / Walls)
# - res://scripts/res/ore.gd          (Ore / plant layer)
# - res://scripts/res/floor.gd        (Floors)
# - res://scripts/res/subfloor.gd     (Bottom of holes in the floor layer)

# May be used for visual effects or stuff.
var globalPosition: Vector2i
