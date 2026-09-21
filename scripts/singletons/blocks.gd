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
	
	# ###### #
	# Errors #
	# ###### #
	
	&"_errorBiome":
		preload("res://blocks/walls/_errorBiome.tres")
}
