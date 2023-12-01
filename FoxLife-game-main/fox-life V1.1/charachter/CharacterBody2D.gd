extends CharacterBody2D

#red ff0000
#dafault ffffff

const SPEED = 150.0
const JUMP_VELOCITY = -250.0


@export var Health = 100
@export var Hunger = 0
@export var Thirst = 0
@onready var bars = self.get_parent().get_node("CanvasLayer")
@onready var HealthBar = bars.get_node("Health")
# Get the gravity from the project settings to be synced with RigidBody nodes.
var fallDamage
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var anim = get_node("AnimationPlayer")
@onready var sound_player = self.get_node("SoundPlayer")


func visualDamage() :
		$GPUParticles2D.emitting = true
		self.modulate = "ff0000"
		await get_tree().create_timer(1.0).timeout
		self.modulate = "ffffff"
		
		
func _physics_process(delta):
	HealthBar.value = Health
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		anim.play("Jump")
		
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if direction == -1:
		get_node("AnimatedSprite2D").flip_h = true
	elif direction == 1:
		get_node("AnimatedSprite2D").flip_h = false
	
	if direction:
		velocity.x = direction * SPEED
		if velocity.y == 0:
			anim.play("Run")
			if !sound_player.playing:
				sound_player.stream = load("res://charachter/walk_grass.mp3")
				sound_player.play()
		else:
			fallDamage = velocity.y
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if velocity.y == 0:
			anim.play("Idle")
			sound_player.stop()
	
	
	
	if self.is_on_floor():
		if fallDamage:
			if fallDamage>400:
				
				sound_player.stream = load("res://charachter/fell.mp3")
				sound_player.volume_db = 24
				sound_player.play()
				sound_player.volume_db = 0

				Health-=fallDamage/20
				print(fallDamage/20)
				fallDamage=0
				visualDamage()


				
	move_and_slide()
