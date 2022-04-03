extends Node2D

onready var score_label = $UI/Control/ScoreText
onready var timer_label = $UI/Control/TimerText
onready var game_over_panel = $UI/Control/GameOverPanel
onready var final_score_label = $UI/Control/GameOverPanel/FinalScore
onready var final_time_label = $UI/Control/GameOverPanel/FinalTime
onready var difficulty_timer = $DifficultyTimer

var time_elapsed := 0.0
var final_time
var score = 0
var final_score

func _ready() -> void:
	get_tree().paused = false
	score_label.text = 'Score: '

func _process(delta: float) -> void:
	time_elapsed += delta
	timer_label.text = format_time(time_elapsed)
	# Revisit score calculation
	score += floor((time_elapsed / 60) * Globals.global_difficulty_modifier) + 1
	print(score)
	score_label.text = 'Score: ' + str(score)

func format_time(time: float) -> String:
	var minutes := time / 60
	var seconds := fmod(time, 60)
	return "%02d:%02d" % [minutes, seconds]

func _on_DifficultyTimer_timeout() -> void:
	Globals.global_difficulty_modifier += .2

func _on_Player_player_died() -> void:
	final_time = format_time(time_elapsed)
	final_score = score
	game_over_panel.visible = true
	final_time_label.text = 'Time: ' + str(final_time)
	final_score_label.text = 'Score: ' + str(final_score)
	get_tree().paused = true

func _on_PlayAgain_pressed() -> void:
	Globals.global_difficulty_modifier = 1
	get_tree().reload_current_scene()

func _on_Quit_pressed() -> void:
	get_tree().quit()
