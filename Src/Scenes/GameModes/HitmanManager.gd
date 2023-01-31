extends Node

var spawners : Array

func _ready():
    spawners = [ $TargetSpawnerSky, \
                 $TargetSpawnerSidewalkTop, \
                 $TargetSpawnerCycleLane, \
                 $TargetSpawnerRoadTop, \
                 $TargetSpawnerRoadBottom, \
                 $TargetSpawnerSidewalkBottom \
               ]

    assign_target_spawner()

func assign_target_spawner():
    var rand_index : int = randi() % spawners.size()
    var spawner = spawners[rand_index]

    spawner.mark_targets = true
    spawner.mark_single = true

func _on_mark_timer_timeout():
    assign_target_spawner()
