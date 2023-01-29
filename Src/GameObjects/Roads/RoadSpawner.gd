extends Node2D

@onready var cooldown_timer := $Cooldown

@export var road_scene : PackedScene

# containers for projectile instances
# used in order to detach projectiles from player's coordinate system
@onready var container = get_tree().get_root()

func _ready():
    spawn()

func _on_cooldown_timeout():
    spawn()

func spawn():
    var r = road_scene.instantiate()
    r.global_position = global_position
    container.add_child.call_deferred(r)

    cooldown_timer.start()
