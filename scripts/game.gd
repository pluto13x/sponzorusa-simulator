extends Control

var followers = 0
var followers_per_click = 1

signal gain_followers

func _on_post_button_button_down() -> void:
	followers += followers_per_click
	emit_signal("gain_followers", followers)
