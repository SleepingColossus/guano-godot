extends RigidBody2D

var crashed : bool = false

func _on_body_entered(body):
    if not crashed:
        # prevent multiple triggers
        crashed = true

        $FallingSound.stop()
        $CrashSound.play()
