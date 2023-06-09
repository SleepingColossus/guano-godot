extends CharacterBody2D

@export var horizontal_velocity : int

var destroy_offset := 500

func _ready():
    velocity = Vector2(horizontal_velocity, 0)

func _process(_delta):
    move_and_slide()

    if global_position.x < -destroy_offset:
        queue_free()
