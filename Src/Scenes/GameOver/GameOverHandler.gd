extends Node

func _ready():
    $Score.text = "FINAL SCORE: %d" % Global.final_score

func _process(delta):
    if Input.is_anything_pressed():
        get_tree().change_scene_to_file("res://Scenes/Intro/IntroScene.tscn")
