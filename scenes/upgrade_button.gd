extends Button

signal pressed_upgrade(id)

var follower_price = 0
var money_price = 0
var id = 0

func change_data(new_id, new_name, new_desc, new_price_text, new_texture, new_follower_price, new_money_price):
	id = new_id
	follower_price = new_follower_price
	money_price = new_money_price

	$HBoxContainer/TextureRect.texture = new_texture
	$HBoxContainer/MarginContainer/VBoxContainer/Name.text = new_name
	$HBoxContainer/MarginContainer/VBoxContainer/Desc.text = new_desc
	$HBoxContainer/MarginContainer/VBoxContainer/Price.text = new_price_text
	

func _on_button_down() -> void:
	pressed_upgrade.emit(id)
