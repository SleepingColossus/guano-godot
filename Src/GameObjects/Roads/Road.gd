extends CharacterBody2D

@export var horizontal_velocity : int

var sprite_width := 1200

func _ready():
    velocity = Vector2(horizontal_velocity, 0)

func _process(_delta):
    move_and_slide()

    if global_position.x < -sprite_width:
        queue_free()
