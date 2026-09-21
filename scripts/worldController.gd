class_name WorldController extends Node2D

enum World { FACE_LAND }

const CHUNK_SCENE = preload("res://scenes/chunk.tscn")

@export var worldSize: Vector2i
@export var chunkSize: Vector2i
@export var noiseBox: NoiseBox
@export var currentWorld: World

var biomes: Dictionary[StringName, Biome]
var chunkDatas: Dictionary[Vector2i, ChunkData]

func _ready() -> void:
	Global.worldController = self
	
	# Setting worlds
	biomes = {
		&"happy":
			preload("res://biomes/happyBiome.tres"),
		
		&"sad":
			preload("res://biomes/sadBiome.tres")
	}
	
	generate()

func generate() -> void:
	for x: int in range(worldSize.x):
		for y: int in range(worldSize.y):
			var chunkData := ChunkData.new(x, y)
			chunkDatas[Vector2i(x, y)] = chunkData
