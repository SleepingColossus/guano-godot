extends RigidBody2D

signal missed

var bird : Bird

var screen_height : int
var offset := 100

func _ready():
    bird = get_node("/root/Game/Bird")

    var window_size = get_viewport_rect().size
    screen_height = window_size.y + 100

func _process(_delta):
    if position.y > screen_height:
        missed.emit()
        queue_free()

# NOTE: Using Area2D for collision instead of RigidBody2D because of this bug:
# https://github.com/godotengine/godot/issues/70671
func _on_area_2d_body_entered(target: Target):
    target.die()
    bird.target_hit(target)

    queue_free()
