extends Node2D

const image_size := Vector2(512, 512)
const image_format := Image.FORMAT_RGB8
const noise_types: Array = [
	FastNoiseLite.TYPE_SIMPLEX,
	FastNoiseLite.TYPE_SIMPLEX_SMOOTH,
	FastNoiseLite.TYPE_CELLULAR,
	FastNoiseLite.TYPE_PERLIN,
	FastNoiseLite.TYPE_VALUE,
	FastNoiseLite.TYPE_VALUE_CUBIC
]

var noise: = FastNoiseLite.new()

func _ready():
	randomize()
	
	noise.seed = randi()
	noise.noise_type = FastNoiseLite.TYPE_SIMPLEX
	noise.fractal_octaves = 1
	noise.fractal_gain = 1

func _process(delta):
	if Input.is_action_pressed("w"):
		noise.offset.y -= 25
	if Input.is_action_pressed("s"):
		noise.offset.y += 25
	if Input.is_action_pressed("a"):
		noise.offset.x -= 25
	if Input.is_action_pressed("d"):
		noise.offset.x += 25
	
	for x in range(0, image_size.x):
		for y in range(0, image_size.y):
			var noise_level = (noise.get_noise_2d(x, y) + 1) / 2
			
	
