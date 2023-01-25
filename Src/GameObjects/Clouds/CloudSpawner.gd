extends Node2D

@onready var cooldown_timer := $Cooldown

@export var clouds : Array[PackedScene]

# containers for projectile instances
# used in order to detach projectiles from player's coordinate system
@onready var container = get_tree().get_root()

func _ready():
    pass

func _process(delta):
    pass


func _on_cooldown_timeout():
    var rand_index : int = randi() % clouds.size()

    var cloud = clouds[rand_index].instantiate()
    cloud.global_position = global_position
    container.add_child(cloud)

    cooldown_timer.start()
