extends Node2D

@export var cooldown_min : int
@export var cooldown_max : int
@onready var cooldown_timer := $Cooldown

@export var clouds : Array[PackedScene]

func _ready():
    spawn()

func spawn():
    var rand_index : int = randi() % clouds.size()

    var cloud = clouds[rand_index].instantiate()
    add_child.call_deferred(cloud)

    var rand_cooldown : int = randi_range(cooldown_min, cooldown_max)
    cooldown_timer.wait_time = rand_cooldown
    cooldown_timer.start()

func _on_cooldown_timeout():
    spawn()
