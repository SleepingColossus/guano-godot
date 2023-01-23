extends CharacterBody2D

@export var movement_speed : int

var destroy_offset := 200

func _ready():
    velocity = Vector2(movement_speed, 0)

func _process(delta):
    move_and_slide()

    if position.x < -destroy_offset:
        queue_free()
