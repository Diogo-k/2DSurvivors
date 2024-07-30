extends Node

@export var end_screen_scene: PackedScene

var pause_menu = preload("res://scenes/UI/paused_menu.tscn")

func _ready():
	$%Rogue.health_component.died.connect(on_player_died)

func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		add_child(pause_menu.instantiate())
		get_tree().root.set_input_as_handled()

func on_player_died():
	var end_screen_scene_instance = end_screen_scene.instantiate()
	add_child(end_screen_scene_instance)
	end_screen_scene_instance.set_defeat()
	MetaProgression.save()
