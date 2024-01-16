extends Button

func _ready():
	pressed.connect(on_pressed)

func on_pressed():
	$RandomAudioPlayerComponent.play_random()
