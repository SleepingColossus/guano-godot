extends Node2D

@export var cooldown_min : int
@export var cooldown_max : int
@onready var cooldown_timer := $Cooldown

@export var reverse : bool
@export var mark_targets : bool

@export var targets : Array[PackedScene]

# containers for projectile instances
# used in order to detach projectiles from player's coordinate system
@onready var container = get_tree().get_root()

func _ready():
    spawn()

func spawn():
    var rand_index : int = randi() % targets.size()

    var target = targets[rand_index].instantiate()
    target.reverse = reverse

    if mark_targets:
        target.is_marked = mark_targets
        target.ammo_awarded = 1

    target.global_position = global_position
    container.add_child.call_deferred(target)

    var rand_cooldown : int = randi_range(cooldown_min, cooldown_max)
    cooldown_timer.wait_time = rand_cooldown
    cooldown_timer.start()

func _on_cooldown_timeout():
    spawn()
