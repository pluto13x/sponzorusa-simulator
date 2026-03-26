extends Label

func _on_game_gain_posts(amount: Variant) -> void:
	text = "Posts: " + str(amount)
