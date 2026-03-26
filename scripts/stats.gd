extends VBoxContainer
@onready var followers: Label = $FollowerCount

func _on_game_gain_followers(amount) -> void:
	pass
	followers.text = str(amount)
