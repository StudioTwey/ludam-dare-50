extends Node

func _ready():
	pass # Replace with function body.

onready var fish_death_sound = preload("res://assets/Audio Files/pufferfish-eating-a-carrot.mp3")


func play_death_sound(audio: AudioStreamPlayer):
#	audio.stream = fish_death_sound
	audio.play(0.0)
