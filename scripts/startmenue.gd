#startmenue.gd
extends Control




func _on_play_pressed():
	get_tree().change_scene("res://worlds/World.tscn")


func _on_Quit_pressed():
	get_tree().quit()


func _on_Button_pressed():
	get_tree().change_scene("res://worlds/Help.tscn")
