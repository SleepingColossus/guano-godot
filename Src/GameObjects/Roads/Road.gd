extends CharacterBody2D

@export var horizontal_velocity : int

func _ready():
    velocity = Vector2(horizontal_velocity, 0)

func _process(delta):
    move_and_slide()
