extends Node2D

onready var tween = $Tween
onready var timer = $Timer

export var speed: float = rand_range(40,80)
var velocity := Vector2.ZERO

var target_y = rand_range(100, 250)
var reached_target = false
var tween_started = false
var tween_values = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.wait_time = rand_range(6,10)

func _process(delta: float) -> void:
	velocity = speed * Vector2.DOWN
	position += velocity * delta
	if(position.y >= target_y):
		reached_target = true
	
	if(reached_target && not tween_started):
		speed = 0
		timer.start()
		tween_values.push_front(target_y + rand_range(10,40))
		tween_values.push_front(position.y)
		_start_tween()

func _start_tween():
	tween_started = true
	tween.interpolate_property(self, "position:y", tween_values[0], tween_values[1], rand_range(2,5))
	tween.start()

func _on_Tween_tween_completed(object, key):
  tween_values.invert()
  _start_tween()

func _on_Timer_timeout() -> void:
	tween.stop(self)
	speed = rand_range(-400, -80)
