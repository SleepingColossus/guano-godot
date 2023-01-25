extends CharacterBody2D

@export var movement_speed : int

@onready var collider : CollisionShape2D = $CollisionShape2D

var destroy_offset := 200

func _ready():
    velocity = Vector2(movement_speed, 0)

func _process(delta):
    move_and_slide()

    if global_position.x < -destroy_offset:
        queue_free()

func die():
    collider.disabled = true
    queue_free()
