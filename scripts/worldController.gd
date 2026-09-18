class_name WorldController extends Node2D

enum World { FACE_LAND }

const CHUNK_SCENE = preload("res://scenes/chunk.tscn")

@export var worldSize: Vector2i
@export var chunkSize: Vector2i
@export var noiseBox: NoiseBox
@export var currentWorld: World

var seed: int = -1
var biomes: Dictionary[StringName, Biome]
var chunkDatas: Dictionary[Vector2i, ChunkData]

func _ready() -> void:
	Global.worldController = self
	
	if seed == -1:
		randomize()
		seed = randi()
		
		seed(seed)
		noiseBox.rand(seed)
	
	# Setting worlds
	biomes = {
		&"happyBiome":
			preload("res://biomes/_happyBiome.tres"),
		
		&"sadBiome":
			preload("res://biomes/_sadBiome.tres")
	}
	
	generate()
	
	for chunkCoord: Vector2i in chunkDatas.keys():
		var chunk: Chunk = CHUNK_SCENE.instantiate()
		chunk.chunkCoord = chunkCoord
		chunk.update()
		add_child(chunk)

func generate() -> void:
	for x: int in range(worldSize.x):
		for y: int in range(worldSize.y):
			var chunkData := ChunkData.new(x, y)
			chunkDatas[Vector2i(x, y)] = chunkData
