extends CharacterBody2D

@export var horizontal_velocity : int

var sprite_width := 300

func _ready():
    velocity = Vector2(horizontal_velocity, 0)

func _process(delta):
    move_and_slide()

    if position.x < -sprite_width:
        queue_free()