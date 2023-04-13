extends Node2D

# don't allow player to skip help scene immediately.
# this is in order to prevent click from main menu from registering
# when transitioning into this scene.
var _can_skip := false


func _process(delta):
    if Input.is_anything_pressed() and _can_skip:
        get_tree().change_scene_to_file("res://Scenes/MainMenu/MainMenu.tscn")


func _on_timer_timeout():
    _can_skip = true
