extends RigidBody2D

var bird : Bird

func _ready():
    bird = get_node("/root/Game/Bird")

# NOTE: Using Area2D for collision instead of RigidBody2D because of this bug:
# https://github.com/godotengine/godot/issues/70671
func _on_area_2d_body_entered(target: Target):
    target.die()
    bird.target_hit(target)

    queue_free()
