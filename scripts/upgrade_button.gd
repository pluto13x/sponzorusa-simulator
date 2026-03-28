extends Button

signal pressed_upgrade(idx, idy, follower_multiplier, money_price)

var follower_multiplier = 0
var money_price = 0
var idx = 0
var idy = 0

func change_data(new_idx, new_idy, new_name, new_desc, new_price_text, new_texture, new_follower_multiplier, new_money_price):
	idx = new_idx
	idy = new_idy
	follower_multiplier = new_follower_multiplier
	money_price = new_money_price

	$HBoxContainer/TextureRect.texture = new_texture
	$HBoxContainer/MarginContainer/VBoxContainer/Name.text = new_name
	$HBoxContainer/MarginContainer/VBoxContainer/Desc.text = new_desc
	$HBoxContainer/MarginContainer/VBoxContainer/Price.text = new_price_text
	

func _on_button_down() -> void:
	pressed_upgrade.emit(idx, idy, follower_multiplier, money_price)
