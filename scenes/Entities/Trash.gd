extends Sprite

export var speed: float = rand_range(40,80)
var velocity := Vector2.ZERO

func _ready() -> void:
	rotation_degrees = rand_range(0,360)

func _process(delta: float) -> void:
	velocity = speed * Vector2.RIGHT
	position += velocity * delta
	if position.x > 330:
		queue_free()
