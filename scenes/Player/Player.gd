extends Area2D

onready var sprite = $Sprite
onready var animation_player = $AnimationPlayer;

export var speed: int = 100;
var screen_size

func _ready() -> void:
	screen_size = get_viewport_rect().size

func _process(delta) -> void:
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		self.rotate(.1)
#		velocity = rot_to_vector(rotation)
	if Input.is_action_pressed("move_left"):
		self.rotate(-.1)
#		velocity = rot_to_vector(rotation)
	if Input.is_action_pressed("move_up"):
		velocity = Vector2(-1,0).rotated(rotation)
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		animation_player.play('swim')
	else:
		animation_player.stop()
	
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)

func rot_to_vector(rot: float) -> Vector2:
	var direction = Vector2(cos(rot), sin(rot))
	
	return direction


func _on_Player_area_entered(area:Area2D) -> void:
	print(area.name, ' killed you')
	queue_free()
