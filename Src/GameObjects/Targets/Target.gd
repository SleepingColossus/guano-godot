class_name Target

extends CharacterBody2D

# used on hint screen
@export var target_name : String
@export var description : String

@export var movement_speed : int
@export var score_awarded : int
@export var ammo_awarded : int

# used in challenge modes
@export var is_marked : bool

@onready var collider : CollisionShape2D = $CollisionShape2D
@onready var animation : AnimationPlayer = $DeathAnimation

var screen_width : int
var destroy_offset := 500
var reverse : bool

func _ready():
    var window_size = get_viewport_rect().size
    screen_width = window_size.x + destroy_offset

    var final_speed = -movement_speed if reverse else movement_speed
    velocity = Vector2(final_speed, 0)

func _process(_delta):
    move_and_slide()

    if not reverse:
        if global_position.x < -destroy_offset:
            queue_free()
    else:
        if global_position.x > screen_width:
            queue_free()

    if is_marked:
        $AnimatedSprite2D.modulate = Color(1, 0, 0)

func die():
    collider.set_deferred("disabled", true)
    animation.play("death_animation")

# Called by DeathAnimation node
func delete():
    queue_free()
