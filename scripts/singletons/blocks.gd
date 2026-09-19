class_name EvilAssBlocksContainerSingleton extends Node

const types: Dictionary[StringName, Wall] = {
	# #### #
	# Misc #
	# #### #
	
	&"_":
		preload("res://blocks/walls/_.tres"),
	
	&"_happyLeaving":
		preload("res://blocks/walls/_happyLeaving.tres"),
	
	&"_sadArrival":
		preload("res://blocks/walls/_sadArrival.tres"),
	
	&"_theHappiestDeparture":
		preload("res://blocks/walls/_theHappiestDeparture.tres"),
	
	# ###### #
	# Errors #
	# ###### #
	
	&"_errorBiome":
		preload("res://blocks/walls/_errorBiome.tres"),
	
	&"_errorNoBlock":
		preload("res://blocks/walls/_errorNoBlock.tres"),
	
	&"_errorNoFallback1x1":
		preload("res://blocks/walls/_errorNoFallback1x1.tres"),
}
