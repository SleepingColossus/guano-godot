extends Node


func _process(delta):
    if Input.is_anything_pressed():
        $IntroAnimation.play("default")

func load_next_scene():
    get_tree().change_scene_to_file("res://Scenes/Help.tscn")
