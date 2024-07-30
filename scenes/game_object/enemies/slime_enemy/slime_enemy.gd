extends CharacterBody2D

@onready var velocity_component = $VelocityComponent
@onready var animated_sprite_2d = $Visuals/AnimatedSprite2D

func _ready():
	$HurtboxComponent.hit.connect(on_hit)

func _process(delta):
	velocity_component.accelerate_to_player()
	velocity_component.move(self)
	
	var moving_to_right = (velocity.x < 0)
	animated_sprite_2d.flip_h = moving_to_right

func on_hit():
	$HitAudioComponent.play_random()
