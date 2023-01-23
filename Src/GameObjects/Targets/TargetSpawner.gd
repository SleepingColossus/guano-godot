extends Node2D

@onready var cooldown_timer := $Cooldown

@export var targets : Array[PackedScene]

# containers for projectile instances
# used in order to detach projectiles from player's coordinate system
@onready var container = get_tree().get_root()

func _ready():
    pass

func _process(delta):
    pass


func _on_cooldown_timeout():
    var rand_index : int = randi() % targets.size()

    var target = targets[rand_index].instantiate()
    target.global_position = global_position
    container.add_child(target)

    cooldown_timer.start()
