extends Control

const save_path = "user://userdata.save"

var followers = 0
var money = 0
var posts = 0
var posts_per_click = 1

signal gain_followers(amount)
signal gain_posts(amount)
signal gain_money(amount)

func _ready() -> void:
	load_data()
	emit_signal("gain_followers", followers)

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

func _on_post_button_button_down() -> void:
	posts += posts_per_click
	emit_signal("gain_posts", posts)
	save_data()
