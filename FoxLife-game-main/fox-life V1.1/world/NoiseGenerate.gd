extends TileMap
#var tilemap = self.get_parent().get_node("TileMap")
var width = 4000
var height = 50

var noise: = FastNoiseLite.new()

func _ready():
	randomize()
	
	noise.seed = randi()
	noise.noise_type = FastNoiseLite.TYPE_PERLIN
	noise.fractal_octaves = 1
	noise.fractal_gain = 0.75
	
	for x in range(width):
		var noise_level = abs((noise.get_noise_2d(x,height)*50)+240)
		var tile_Pos = local_to_map(Vector2(x,noise_level))
		set_cell(0, Vector2i(tile_Pos.x,tile_Pos.y),0,Vector2i(1,2))
		for y in range(1,20):
			var dirt_Pos = local_to_map(Vector2(x,noise_level+10*y))
			set_cell(0, Vector2i(dirt_Pos.x,dirt_Pos.y),0,Vector2i(1,3))

func _process(delta):
	pass
			
			
		
		
		
			
	
