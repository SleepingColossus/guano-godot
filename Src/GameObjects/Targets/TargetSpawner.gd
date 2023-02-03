extends Node2D

class_name TargetSpawner

@export var cooldown_min : int
@export var cooldown_max : int
@onready var cooldown_timer := $Cooldown

@export var reverse : bool
@export var mark_targets : bool
@export var mark_single : bool

@export var targets : Array[PackedScene]

func _ready():
    spawn()

func spawn():
    var rand_index : int = randi() % targets.size()

    var target = targets[rand_index].instantiate()
    target.reverse = reverse

    if mark_targets:
        target.is_marked = mark_targets
        target.ammo_awarded = 1

    if mark_single:
        mark_targets = false

    add_child.call_deferred(target)

    var rand_cooldown : int = randi_range(cooldown_min, cooldown_max)
    cooldown_timer.wait_time = rand_cooldown
    cooldown_timer.start()

func _on_cooldown_timeout():
    spawn()
