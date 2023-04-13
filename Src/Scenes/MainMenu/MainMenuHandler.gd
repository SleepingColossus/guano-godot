extends Control

func _on_play_pressed(): get_tree().change_scene_to_file("res://Scenes/GameMenu/GameMenu.tscn")
func _on_help_pressed(): get_tree().change_scene_to_file("res://Scenes/Help/Help.tscn")
func _on_fullscreen_pressed(): _toggle_fullscreen_mode()
func _on_quit_pressed(): get_tree().quit()

func _toggle_fullscreen_mode():
    if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
        DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
    else:
        DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
