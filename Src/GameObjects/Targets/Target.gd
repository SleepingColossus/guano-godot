extends CharacterBody2D

@export var movement_speed : int

@onready var collider : CollisionShape2D = $CollisionShape2D
@onready var animation : AnimationPlayer = $DeathAnimation

var destroy_offset := 200

func _ready():
    velocity = Vector2(movement_speed, 0)

func _process(_delta):
    move_and_slide()

    if global_position.x < -destroy_offset:
        queue_free()

func die():
    collider.set_deferred("disabled", true)
    animation.play("death_animation")

# Called by DeathAnimation node
func delete():
    queue_free()
