extends RigidBody2D


func _ready():
    pass # Replace with function body.


func _process(delta):
    pass


# NOTE: Using Area2D for collision instead of RigidBody2D because of this bug:
# https://github.com/godotengine/godot/issues/70671
func _on_area_2d_body_entered(body):
    body.die()
    queue_free()
