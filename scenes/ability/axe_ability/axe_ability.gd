extends Node2D

@onready var hitbox_component = $HitboxComponent

const DEFAULT_RADIUS = 75
const DEFAULT_DURATION = 3 

var current_radius
var current_duration

var base_rotation = Vector2.RIGHT

func _ready():
	base_rotation = Vector2.RIGHT.rotated(randf_range(0, TAU))
	
	current_radius = DEFAULT_RADIUS
	current_duration = DEFAULT_DURATION
	
	var tween = create_tween()
	tween.tween_method(tween_method, 0.0, 2.0, current_duration)
	tween.tween_callback(queue_free)

func tween_method(rotations: float):
	var current_direction = base_rotation.rotated(rotations * TAU)
	var player = get_tree().get_first_node_in_group("player")
	if player == null:
		return
	
	global_position = player.global_position + (current_direction * current_radius)
