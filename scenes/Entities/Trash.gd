extends Sprite

onready var tween = $Tween

var tween_values = []

var speed: float = rand_range(40,80) * Globals.global_difficulty_modifier
var velocity := Vector2.ZERO

func _ready() -> void:
	rotation_degrees = rand_range(0,360)
#	tween_values.push_front(position.y + rand_range(10,20))
#	tween_values.push_front(position.y)
#	_start_tween()

func _process(delta: float) -> void:
	velocity = speed * Vector2.RIGHT
	position += velocity * delta
	if position.x > 330:
		queue_free()

func _start_tween():
	tween.interpolate_property(self, "position:y", tween_values[0], tween_values[1], rand_range(2,5))
	tween.start()

func _on_Tween_tween_completed(object, key):
  tween_values.invert()
  _start_tween()
