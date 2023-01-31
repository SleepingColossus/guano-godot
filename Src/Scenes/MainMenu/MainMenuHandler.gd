extends Control

func _on_endless_pressed():         get_tree().change_scene_to_file("res://Scenes/GameModes/EndlessMode.tscn")
func _on_reverse_pressed():         get_tree().change_scene_to_file("res://Scenes/GameModes/ReverseMode.tscn")
func _on_sharpshooter_pressed():    get_tree().change_scene_to_file("res://Scenes/GameModes/SharpshooterMode.tscn")
func _on_breadhunter_pressed():     get_tree().change_scene_to_file("res://Scenes/GameModes/BreadHunterMode.tscn")
func _on_hitman_pressed():          get_tree().change_scene_to_file("res://Scenes/GameModes/HitmanMode.tscn")
