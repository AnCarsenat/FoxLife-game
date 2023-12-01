extends AudioStreamPlayer2D

@onready var music_woods = load("res://Musics/music_woods.mp3")

# Called when the node enters the scene tree for the first time.
func _ready():
	self.stream = music_woods
	self.play()
	
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
