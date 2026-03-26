extends VBoxContainer
@onready var follower_count: Label = $FollowerCount
@onready var money_count: Label = $MoneyCount
@onready var followers_per_sec: Label = $FollowersPerSec
@onready var money_per_sec: Label = $MoneyPerSec




func _on_game_gain_followers(amount, persec) -> void:
	follower_count.text = str(int(round(amount)))
	followers_per_sec.text = str(int(round(persec))) + " PER SECOND"


func _on_game_gain_money(amount, persec) -> void:
	money_count.text = str(int(round(amount)))
	money_per_sec.text = str(int(round(persec))) + " PER SECOND"
