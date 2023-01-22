extends AnimatedSprite2D

@onready var cooldown_timer := $Cooldown
var ready_to_fire := true

@export var projectile : PackedScene

# containers for projectile instances
# used in order to detach projectiles from player's coordinate system
@onready var container = get_tree().get_root()

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    if Input.is_anything_pressed() && ready_to_fire:
        ready_to_fire = false

        var p = projectile.instantiate()
        p.global_position = global_position
        container.add_child(p)

        cooldown_timer.start()


func _on_cooldown_timeout():
    ready_to_fire = true
