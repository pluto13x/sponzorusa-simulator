extends Control

const save_path = "user://userdata.save"

var followers = 0
var followers_per_click = 1

signal gain_followers(amount)

func _ready() -> void:
	load_data()
	emit_signal("gain_followers", followers)

func save_data():
	var data = {
		"followers": followers
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
	else:
		save_data()

func _on_post_button_button_down() -> void:
	followers += followers_per_click
	emit_signal("gain_followers", followers)
	save_data()
