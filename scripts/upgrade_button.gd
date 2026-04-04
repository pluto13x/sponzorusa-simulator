extends Button

signal pressed_upgrade(idx, idy, follower_multiplier, money_price, follower_loss)

var follower_multiplier = 0
var money_price = 0
var idx = 0
var idy = 0
var disabled_forever = false
var follower_loss = 0
var follower_price = 0

func change_data(new_idx, new_idy, new_name, new_desc, new_price_text, new_texture, new_follower_multiplier, new_money_price, new_follower_loss = 0, new_follower_price = 0):
	idx = new_idx
	idy = new_idy
	follower_multiplier = new_follower_multiplier
	money_price = new_money_price
	follower_loss = new_follower_loss
	follower_price = new_follower_price

	$HBoxContainer/TextureRect.texture = new_texture
	$HBoxContainer/MarginContainer/VBoxContainer/Name.text = new_name
	$HBoxContainer/MarginContainer/VBoxContainer/Desc.text = new_desc
	$HBoxContainer/MarginContainer/VBoxContainer/Price.text = new_price_text
	

func _on_button_down() -> void:
	pressed_upgrade.emit(idx, idy, follower_multiplier, money_price, follower_loss)
	
func _process(_delta: float) -> void:
	if disabled_forever == true:
		queue_free()
