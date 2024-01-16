extends Node
class_name ExpDropComponent

@export_range(0, 1) var drop_percent: float = .5
@export var rune_scene: PackedScene
@export var health_component: Node

func _ready():
	(health_component as HealthComponent).died.connect(on_died)

func on_died():
	var adjusted_drop_percent = drop_percent
	var experience_gain_upgrade_count = MetaProgression.get_upgrade_count("experience_gain")
	if experience_gain_upgrade_count > 0:
		adjusted_drop_percent += (.1 * MetaProgression.get_upgrade_count("experience_gain"))
	
	if randf() > adjusted_drop_percent:
		return 
	
	if rune_scene == null:
		return
		
	if not owner is Node2D:
		return
		
	var spawn_position = (owner as Node2D).global_position
	var rune_instance = rune_scene.instantiate() as Node2D
	var entities_layer = get_tree().get_first_node_in_group("entities_layer")
	entities_layer.add_child(rune_instance)
	rune_instance.global_position = spawn_position
