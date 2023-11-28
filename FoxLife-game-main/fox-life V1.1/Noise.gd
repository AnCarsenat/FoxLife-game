extends Node2D


@export var width := 128
@export var height := 75
@onready var tileMap := $TileMap
var genNoise := FastNoiseLite.new()

func _ready() -> void:
	randomize()
	genNoise.seed = randi()
	genNoise.fractal_octaves = 8
	
func generate_map():
	for x in width:
		for y in height:
			var rand = floor((abs(genNoise.get_noise_2d(x,y)))*3)
			tileMap.set_cell(x,y,rand)



