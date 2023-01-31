extends Control

func _on_endless_pressed():
    get_tree().change_scene_to_file("res://Scenes/EndlessMode.tscn")


func _on_reverse_pressed():
    get_tree().change_scene_to_file("res://Scenes/ReverseMode.tscn")


func _on_sharpshooter_pressed():
    get_tree().change_scene_to_file("res://Scenes/SharpshooterMode.tscn")


func _on_breadhunter_pressed():
    get_tree().change_scene_to_file("res://Scenes/BreadHunterMode.tscn")


func _on_hitman_pressed():
    get_tree().change_scene_to_file("res://Scenes/HitmanMode.tscn")
