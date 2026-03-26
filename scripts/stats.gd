extends VBoxContainer
@onready var follower_count: Label = $FollowerCount
@onready var money_count: Label = $MoneyCount



func _on_game_gain_followers(amount) -> void:
	follower_count.text = str(amount)
	


func _on_game_gain_money(amount: Variant) -> void:
	money_count.text = str(amount)
