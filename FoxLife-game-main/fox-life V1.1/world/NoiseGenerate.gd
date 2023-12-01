extends TileMap
#var tilemap = self.get_parent().get_node("TileMap")

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
	noise.noise_type = FastNoiseLite.TYPE_PERLIN
	noise.fractal_octaves = 1
	noise.fractal_gain = 1

func _process(delta):
	for x in range(0, image_size.x):
		var noise_level = (noise.get_noise_1d(x)*5)+240
		set_cell(1,Vector2i(x,noise_level),-1)
		
		
			
	
