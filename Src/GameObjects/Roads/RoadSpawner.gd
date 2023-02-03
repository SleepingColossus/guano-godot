extends Node2D

@onready var cooldown_timer := $Cooldown

@export var road_scene : PackedScene

func _ready():
    spawn()

func _on_cooldown_timeout():
    spawn()

func spawn():
    var r = road_scene.instantiate()
    add_child.call_deferred(r)

    cooldown_timer.start()
