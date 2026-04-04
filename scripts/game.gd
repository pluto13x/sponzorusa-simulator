extends Control

const save_path = "user://userdata.save"

@export var followers = 0
@export var money = 0
var posts = 0
var posts_per_click = 1
var followers_per_sec = 0
var money_per_sec = 0
var follower_multiplier = 0.25
var monetized = 0

signal gain_followers(amount, persec)
signal gain_posts(amount)
signal gain_money(amount, persec)

func save_data():
	var data = {
		"followers": followers,
		"money": money,
		"posts": posts
	}
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(data)
	file.close()
	
func load_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		var data = file.get_var()
		file.close()
		if typeof(data) == TYPE_DICTIONARY:
			followers = data.get("followers", 0)
			money = data.get("money", 0)
			posts = data.get("posts", 0)
	else:
		save_data()

func emit_signals():
	emit_signal("gain_posts", posts)
	emit_signal("gain_followers", followers, followers_per_sec)
	emit_signal("gain_money", money, money_per_sec)
	
func calculate_followers_and_money():
	followers_per_sec = follower_multiplier * posts**0.9
	money_per_sec = 0.02 * posts**0.4 * followers**0.6 * monetized
	
	followers += followers_per_sec/10
	money += money_per_sec/10
	
func _ready() -> void:
	load_data()
	emit_signals()
	
func _process(_delta: float) -> void:
	save_data()

func _on_post_button_button_down() -> void:
	posts += posts_per_click
	emit_signal("gain_posts", posts)

func _on_restart_save_button_down() -> void:
	followers = 0
	money = 0
	posts = 0
	posts_per_click = 1
	save_data()
	emit_signals()

func _on_timer_timeout() -> void:
	calculate_followers_and_money()
	emit_signals()
